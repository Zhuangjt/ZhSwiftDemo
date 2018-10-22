//
//  DYRecommendViewController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/18.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

private let cellW: CGFloat = (KScreenWidth - 10)/2.0
private let cellH: CGFloat = ((KScreenWidth - 10)/2.0) * 0.65 + KAutoLayoutWidth(42)
private let gameCollH: CGFloat = ((KScreenWidth - 20)/4.0) * 2.0 + 20


class DYRecommendViewController: BaseCollectionViewController {

    var cateRecomData: [RecomCateList] = [RecomCateList]()  //分类推荐数据
    var hotAcList: [HotAcList] = [HotAcList]()   //热门活动数据
    var allList: [HomeAllList] = [HomeAllList]() //全部数据
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupSubViews() {
        super.setupSubViews()
        collectionView.zh_registerCell(cell: DYHotAcRollingCell.self)
        collectionView.zh_registerCell(cell: DYAllListCell.self)
        collectionView.zh_registerView(kind: UICollectionElementKindSectionHeader, reusableView: DYGameCollHeaderView.self)
        collectionView.zh_registerView(kind: UICollectionElementKindSectionHeader, reusableView: DYRecomHeaderView.self)
        
        loadData()
        self.collectionView.es.addPullToRefresh {[weak self] in
            self?.loadData()
        }
    }
    
    func loadData() {
        // 创建调度组
        let workingGroup = DispatchGroup()
        // 创建多列
        let workingQueue = DispatchQueue(label: "request_queue")
        
        //入组
        workingGroup.enter()
        workingQueue.async {  //推荐分类
            DYNetworkProvider.shared.requestDataWithTargetJSON(target: DYApi.recommendCategoryList, successClosure: {[weak self] (response) in
                guard let jsonDict = response.dictionaryObject else{
                    return
                }
                //字典转模型
                let cateRecomData: CateRecomData = CateRecomData(JSON: jsonDict)!
                self?.cateRecomData = cateRecomData.cate2_list
            }, failClosure: {_ in
                
            })
            workingGroup.leave()
        }
        
        workingGroup.enter()
        workingQueue.async {  //热门活动
            DYNetworkProvider.shared.requestDataWithTargetJSON(target: DYApi.hotActitytyList, successClosure: {[weak self] (response) in
                guard let jsonDic = response.dictionaryObject else{
                    return
                }
                let hotAcData: HotAcData = HotAcData(JSON: jsonDic)!
                self?.hotAcList = hotAcData.list
            }, failClosure: {_ in
                
            })
            
            workingGroup.leave()
        }
        
        workingGroup.enter()
        workingQueue.async {  //全部
            DYNetworkProvider.shared.requestDataWithTargetJSON(target: DYApi.liveAllList, successClosure: {[weak self] (response) in
                guard let jsonDic = response.dictionaryObject else{
                    return
                }
                let allData: HomeAllData = HomeAllData(JSON: jsonDic)!
                self?.allList = allData.list
                
            }, failClosure: {_ in
                
            })
            workingGroup.leave()
        }
        
        workingGroup.notify(queue: workingQueue) {
            //所有接口结束
            self.collectionView.reloadData()
            self.collectionView.es.stopPullToRefresh()
        }
        
    }
}

extension DYRecommendViewController{
   override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return section == 0 ? 0 : 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return section == 0 ? 0 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return section == 0 ? CGSize(width: KScreenWidth - 20, height: gameCollH) : CGSize(width: KScreenWidth, height: KAutoLayoutWidth(42))
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView = UICollectionReusableView()
        if kind == UICollectionElementKindSectionHeader {
            if indexPath.section == 0 {
                let firstHeaderView: DYGameCollHeaderView = collectionView.zh_dequeueReusableView(kind: UICollectionElementKindSectionHeader, indexPath: indexPath, resusableView: DYGameCollHeaderView.self)
                reusableView = firstHeaderView
            }else{
                let secondHeaderView: DYRecomHeaderView = collectionView.zh_dequeueReusableView(kind: UICollectionElementKindSectionHeader, indexPath: indexPath, resusableView: DYRecomHeaderView.self)
                reusableView = secondHeaderView
            }
        }
        return reusableView
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return indexPath.section == 0 ? CGSize(width: KScreenWidth, height: KAutoLayoutWidth(80)) : CGSize(width: cellW, height: cellH)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.zh_dequeueReusableCell(cell: DYHotAcRollingCell.self, indexPath: indexPath)
            return cell
        }else{
            let cell = collectionView.zh_dequeueReusableCell(cell: DYAllListCell.self, indexPath: indexPath)
            return cell
        }
    }
}
