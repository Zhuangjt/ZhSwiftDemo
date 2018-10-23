//
//  DYAllListCell.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/10/18.
//  Copyright © 2018 Zhuang. All rights reserved.
//

import UIKit

private let cellH: CGFloat = ((KScreenWidth - 10)/2.0) * 0.65

class DYAllListCell: BaseCollectionViewCell {
    
    /// 推荐-全部
    var model: HomeAllList? {
        didSet{
            contentImg.kf.setImage(with: URL.init(string: model?.room_src ?? ""))
            labNickName.text = model?.nickname
            var numStr: String = ""
            if (model?.online_num)! > 9999 {
                let num = Float((model?.online_num)!) / 10000
                numStr = "\(String(format: "%.2f",num))W"
            }else{
                numStr = (model?.online_num?.description)!
            }
            labCount.text = numStr
            labRoomName.text = model?.room_name
            labGameName.text = model?.cate2_name
        }
    }
    
    lazy var contentImg: UIImageView = {
        let contentImg = UIImageView()
//        contentImg.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        return contentImg
    }()
    
    lazy var labNickName: UILabel = {
        let labNickName = UILabel.quickCreateLabel(text: "王者荣耀官方赛事", textColor: KCOLOR_TEXT_WHITE, font: KFontSize(FONT_SUPER_SMALL))
        return labNickName
    }()
    
    lazy var labCount: UILabel = {
        let labCount = UILabel.quickCreateLabel(text: "338.16w", textColor: KCOLOR_TEXT_WHITE, font: KFontSize(FONT_SUPER_SUPER_SMALL))
        return labCount
    }()
    
    lazy var labRoomName: UILabel = {
        let labRoomName = UILabel.quickCreateLabel(text: "KPL官方赛事 TOPM VS WE", textColor: KCOLOR_TEXT_BLACK1, font: KFontSize(FONT_SUPER_SMALL))
        return labRoomName
    }()
    
    lazy var labGameName: UILabel = {
        let labGameName = UILabel.quickCreateLabel(text: "王者荣耀", textColor: KCOLOR_TEXT_GRAY1, font: KFontSize(FONT_SUPER_SMALL))
        return labGameName
    }()
    
    override func setUpUI() {
        addSubview(contentImg)
        addSubview(labNickName)
        addSubview(labCount)
        addSubview(labRoomName)
        addSubview(labGameName)
        
        contentImg.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(cellH)
        }
        
        labNickName.snp.makeConstraints { (make) in
            make.left.equalTo(KAutoLayoutWidth(8))
            make.bottom.equalTo(contentImg).offset(-KAutoLayoutWidth(8))
            make.right.equalTo(-KAutoLayoutWidth(50))
        }
        
        labCount.snp.makeConstraints { (make) in
            make.left.equalTo(labNickName.snp.right).offset(2)
            make.right.equalTo(-KAutoLayoutWidth(2))
            make.bottom.equalTo(contentImg).offset(-KAutoLayoutWidth(8))
        }
        
        labRoomName.snp.makeConstraints { (make) in
            make.top.equalTo(contentImg.snp.bottom).offset(KAutoLayoutWidth(8))
            make.left.equalTo(KAutoLayoutWidth(2))
            make.right.equalTo(-KAutoLayoutWidth(2))
        }
        
        labGameName.snp.makeConstraints { (make) in
            make.top.equalTo(labRoomName.snp.bottom).offset(4)
            make.left.equalTo(KAutoLayoutWidth(2))
            make.right.equalTo(-KAutoLayoutWidth(2))
        }
    }
}
