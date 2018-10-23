//
//  DYHotRollingCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/22.
//  Copyright © 2018 Zhuang. All rights reserved.
//

import UIKit

class DYHotRollingCell: GYNoticeViewCell {
    var model: HotAcList? {
        didSet{
            labTitle.text = model?.act_name
            labSub.text = model?.act_info
            
        }
    }
    
    lazy var icHot: UIImageView = {
        let ivHot = UIImageView.init(image: KImageName("dy_ic_ac_hot"))
        return ivHot
    }()
    
    lazy var labAc: UILabel = {
        let labAc = UILabel.quickCreateLabel(text: "活动", textColor: KCOLOR_TEXT_BLACK1, font: KFontSize(FONT_MIDDLE))
        return labAc
    }()
    
    lazy var ivDiviceline: UIImageView = {
        let ivDiviceline = UIImageView()
        ivDiviceline.backgroundColor = KCOLOR_LINE_GRAY1
        return ivDiviceline
    }()
    
    lazy var labTitle: UILabel = {
        let labTitle = UILabel.quickCreateLabel(text: "海味冒险岛", textColor: KCOLOR_TEXT_BLACK1, font: KFontSize(FONT_SUPER_SMALL))
        return labTitle
    }()
    
    lazy var labSub: UILabel = {
        let labSub = UILabel.quickCreateLabel(text: "官宣:打野主播去征服星辰..", textColor: KCOLOR_TEXT_GRAY1, font: KFontSize(FONT_SUPER_SUPER_SMALL))
        return labSub
    }()
    
    lazy var btnReserve: UIButton = {
        let btnReserve = UIButton.quickCreateButton(text: "预定", textColor: KCOLOR_TEXT_WHITE, font: KFontSize(FONT_SUPER_SMALL))
        btnReserve.setBackgroundImage(KImageName("dy_btn_ac_reserve"), for: .normal)
        return btnReserve
    }()
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public required init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        addSubview(icHot)
        addSubview(labAc)
        addSubview(ivDiviceline)
        addSubview(labTitle)
        addSubview(labSub)
        addSubview(btnReserve)
        
        icHot.snp.makeConstraints { (make) in
            make.left.equalTo(KAutoLayoutWidth(8))
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: KAutoLayoutWidth(20), height: KAutoLayoutWidth(20)))
        }
        
        labAc.snp.makeConstraints { (make) in
            make.left.equalTo(icHot.snp.right).offset(4)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: KAutoLayoutWidth(40), height: KAutoLayoutWidth(21)))
        }

        ivDiviceline.snp.makeConstraints { (make) in
            make.left.equalTo(labAc.snp.right).offset(KAutoLayoutWidth(12))
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 0.5, height: KAutoLayoutWidth(24)))
        }

        labTitle.snp.makeConstraints { (make) in
            make.left.equalTo(ivDiviceline.snp.right).offset(KAutoLayoutWidth(10))
            make.bottom.equalTo(self.snp.centerY).offset(-2);
            make.size.equalTo(CGSize(width: KScreenWidth - KAutoLayoutWidth(180), height: KAutoLayoutWidth(16)))
        }

        labSub.snp.makeConstraints { (make) in
            make.left.equalTo(ivDiviceline.snp.right).offset(KAutoLayoutWidth(10))
            make.top.equalTo(self.snp.centerY).offset(2);
            make.size.equalTo(CGSize(width: KScreenWidth - KAutoLayoutWidth(180), height: KAutoLayoutWidth(16)))

        }

        btnReserve.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(-KAutoLayoutWidth(10))
            make.size.equalTo(CGSize(width: 48, height: 24))
        }

    }
}
