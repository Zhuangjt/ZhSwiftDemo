//
//  DYHotAcRollingCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/22.
//  Copyright © 2018 Zhuang. All rights reserved.
//

import UIKit

class DYHotAcRollingCell: BaseCollectionViewCell {
    lazy var ivGrayBg: UIView = {
        let ivGrayBg = UIView()
        ivGrayBg.backgroundColor = KCOLOR_BG_GRAY1
        return ivGrayBg
    }()
    
    lazy var rollingNoticeView: GYRollingNoticeView = {
        let rollingNoticeView = GYRollingNoticeView()
        rollingNoticeView.dataSource = self
        rollingNoticeView.delegate = self
        rollingNoticeView.register(DYHotRollingCell.self, forCellReuseIdentifier: "DYHotRollingCell")
        return rollingNoticeView
    }()
    
    override func setUpUI() {
        addSubview(ivGrayBg)
        addSubview(rollingNoticeView)
        
        ivGrayBg.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
        }
        
        rollingNoticeView.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.bottom.equalTo(-5)
            make.right.equalTo(-5)
        }
        
        rollingNoticeView.reloadDataAndStartRoll()
    }
}

extension DYHotAcRollingCell: GYRollingNoticeViewDelegate,GYRollingNoticeViewDataSource{
    func numberOfRowsFor(roolingView: GYRollingNoticeView) -> Int {
        return 10
    }
    
    func rollingNoticeView(roolingView: GYRollingNoticeView, cellAtIndex index: Int) -> GYNoticeViewCell {
        let cell = roolingView.dequeueReusableCell(withIdentifier: "DYHotRollingCell") as! DYHotRollingCell
        return cell
    }
    
    func rollingNoticeView(_ roolingView: GYRollingNoticeView, didClickAt index: Int) {
        print("\(roolingView.currentIndex)")
    }
}
