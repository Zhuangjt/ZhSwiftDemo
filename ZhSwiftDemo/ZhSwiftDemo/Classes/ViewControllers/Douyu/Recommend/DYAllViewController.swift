//
//  DYAllViewController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/18.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

private let cellW: CGFloat = (KScreenWidth - 10)/2.0
private let cellH: CGFloat = (KScreenWidth - 10)/2.0 * 0.65 + KAutoLayoutWidth(42)

class DYAllViewController: BaseCollectionViewController {

    private var data: [HomeAllList] = [HomeAllList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupSubViews() {
        super .setupSubViews()
        collectionView.zh_registerCell(cell: DYAllListCell.self)
        self.cellSize = CGSize(width: cellW, height: cellH)
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
        
        loadData()
        
        self.collectionView.es.addPullToRefresh { [weak self] in
            self?.loadData()
        }
    }
    
    func loadData() {
        DYNetworkProvider.shared.requestDataWithTargetJSONHasDiaLog(target: DYApi.liveAllList, successClosure: {[weak self] (response) in
            guard let jsonDict = response.dictionaryObject else{
                self?.collectionView.es.stopPullToRefresh()
                return
            }
            //字典赚模型
            let allData: HomeAllData = HomeAllData(JSON: jsonDict)!
            self?.data = allData.list
            self?.collectionView.reloadData()
            self?.collectionView.es.stopPullToRefresh()
        }, failClosure: {[weak self] _ in
            self?.collectionView.es.stopPullToRefresh()

        })
    }
}

extension DYAllViewController{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DYAllListCell.identifier(), for: indexPath) as! DYAllListCell
        let model: HomeAllList? = self.data[indexPath.row]
        cell.model = model
        return cell
    }
}
