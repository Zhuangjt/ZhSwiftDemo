//
//  DYClassifyViewController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/18.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

private let cellItemH: CGFloat = KScreenWidth / 4.0

class DYClassifyViewController: BaseTableViewController {

    private var cateListData: [CateOneList] = [CateOneList]()
    private var cateRecomData: [RecomCateList] = [RecomCateList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func setupSubViews() {
        super.setupSubViews()
        tableView .zh_regisiterCell(cell: DYClassifyCell.self)
        tableView.sectionFooterHeight = 0
        self.cellHeight =  cellItemH * 2.0 + 40
        loadData()
        
        self.tableView.es.addPullToRefresh {[weak self] in
            self?.loadData()
        }
    }
    
    
    func loadData() {
        //初始化信号量为1
        let semaphoreA = DispatchSemaphore(value: 1)
        //第二个信号量为0
        let semaphoreB = DispatchSemaphore(value: 0)
        //第三个信号量为0
        let semaphoreC = DispatchSemaphore(value: 0)
        
        let queue = DispatchQueue(label: "com.douyuLive.cate1.queue", qos: .utility, attributes: .concurrent)
        
        queue.async {
            semaphoreA.signal()
            
            DYNetworkProvider.shared.requestDataWithTargetJSON(target: DYApi.liveCategoryList, successClosure: {[weak self] (response) in
                guard let jsonDict = response.dictionaryObject else{
                    semaphoreB.signal()
                    return
                }
                //字典转模型
                let allData: CateAllData = CateAllData(JSON: jsonDict)!
                self?.cateListData = allData.cate1_list
                semaphoreB.signal()
                
            }, failClosure: {_ in
                semaphoreB.signal()
            })
            
        }
        
        queue.async {
            semaphoreB.wait()
            
            DYNetworkProvider.shared.requestDataWithTargetJSON(target: DYApi.recommendCategoryList, successClosure: {[weak self] (response) in
                guard let jsonDict = response.dictionaryObject else{
                    semaphoreC.signal()
                    return
                }
                //字典转模型
                let allData: CateRecomData = CateRecomData(JSON: jsonDict)!
                self?.cateRecomData = allData.cate2_list
                semaphoreC.signal()
                
                
            }, failClosure: {_ in
                semaphoreC.signal()
            })
        }
        
        queue.async {
            if semaphoreC.wait(timeout: .distantFuture) == .success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.es.stopPullToRefresh()
                }
            }
        }
       
    }

}


extension DYClassifyViewController {
    
    //section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.cateListData.count + 1
    }
    
    //row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return KAutoLayoutWidth(42)
    }
    
    //header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = DYClassifyHeaderView.init(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: 42))
        if section == 0 {
            view.configTitle(title: "推荐分类")
        }else{
            if self.cateListData.count != 0 {
                let model = self.cateListData[section - 1]
                view .configTitle(title: model.cate_name)
            }
        }
        return view
    }
    
    //cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.zh_dequeueReusableCell(cell: DYClassifyCell.self, indexPath: indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: DYClassifyCell.identifier(), for: indexPath) as! DYClassifyCell
        if indexPath.section == 0 {
            cell.data = self.cateRecomData
        }else{
            let model: CateOneList = self.cateListData[indexPath.section - 1];
            cell.data = model.cate2_list
        }
        return cell
    }
}
