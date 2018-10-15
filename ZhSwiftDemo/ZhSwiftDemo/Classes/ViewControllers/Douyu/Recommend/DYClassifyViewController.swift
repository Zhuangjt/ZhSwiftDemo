//
//  DYClassifyViewController.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/9/18.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

private let tableViewH : CGFloat = KScreenWidth / 4.0 * 2.0 + 40

class DYClassifyViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func setupSubViews() {
        super.setupSubViews()
        tableView .zh_regisiterCell(cell: DYClassifyCell.self)
        tableView.sectionFooterHeight = 0
    }

}

extension DYClassifyViewController {
    
    //section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    //row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewH
    }
    
    //header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42
    }
    
    //header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = DYClassifyHeaderView.init(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: 42))
        return view
    }
    
    //cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DYClassifyCell.identifier(), for: indexPath)
        return cell
        
    }
}
