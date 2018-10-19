//
//  Const.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/8/1.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

//屏幕相关
let KScreenWidth = UIScreen.main.bounds.width
let KScreenHeight = UIScreen.main.bounds.height
let KScreenBounds = UIScreen.main.bounds
//获取状态栏、标题栏、导航栏高度
let KUIStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
let KUINavigationBarHeight: CGFloat =  KDEVICE_IPHONEX ? 88 : 64
let KUITabBarHeight: CGFloat = KDEVICE_IPHONEX ? 83 : 49
//navigationBarHeight默认高度44 （iPhoneX 88）
//tabBarHeight默认高度49     （iPhoneX 83）

//适配 350 375 414  568 667(812) 736
func KAutoLayoutWidth(_ width: CGFloat) -> CGFloat {
    return width * KScreenWidth/375
}
func KAutoLayoutHeigth(_ height: CGFloat) -> CGFloat {
    return height * KScreenHeight/667
}

/**
 字符串是否为空
 @param str NSString 类型 和 子类
 @return  BOOL类型 true or false
 */
func KStringIsEmpty(_ str: String!) -> Bool {
    if str.isEmpty {
        return true
    }
    if str == nil {
        return true
    }
    if str.count < 1 {
        return true
    }
    if str == "(null)" {
        return true
    }
    if str == "null" {
        return true
    }
    return false
}
// 字符串判空 如果为空返回@“”
func KStringNullToempty(_ str: String) -> String {
    let resutl = KStringIsEmpty(str) ? "" : str
    return resutl
}
func kStringNullToReplaceStr(_ str: String,_ replaceStr: String) -> String {
    let resutl = KStringIsEmpty(str) ? replaceStr : str
    return resutl
}

/**
 数组是否为空
 @param array NSArray 类型 和 子类
 @return BOOL类型 true or false
 */
func KArrayIsEmpty(_ array: [String]) -> Bool {
    let str: String! = array.joined(separator: "")
    if str == nil {
        return true
    }
    if str == "(null)" {
        return true
    }
    if array.count == 0 {
        return true
    }
    if array.isEmpty {
        return true
    }
    return false
}
/**
 字典是否为空
 @param dic NSDictionary 类型 和子类
 @return BOOL类型 true or false
 */
func KDictIsEmpty(_ dict: NSDictionary) -> Bool {
    let str: String! = "\(dict)"
    if str == nil {
        return true
    }
    if str == "(null)" {
        return true
    }
    if dict .isKind(of: NSNull.self) {
        return true
    }
    if dict.allKeys.count == 0 {
        return true
    }
    return false
}

//代码缩写
let KApplication = UIApplication.shared
let KAPPKeyWindow = KApplication.keyWindow
let KAppDelegate = KApplication.delegate
let KAppNotificationCenter = NotificationCenter.default
let KAppRootViewController = KAppDelegate?.window??.rootViewController

//APP版本号
let KAppVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
//当前系统版本号
let KVersion = (UIDevice.current.systemVersion as NSString).floatValue

// UserDefaults 操作
let KUserDefaults = UserDefaults.standard
func KUserDefaultsRead(_ KeyStr: String) -> String {
    return KUserDefaults.string(forKey: KeyStr)!
}
func KUserDefaultsWrite(_ obj: Any, _ KeyStr: String) {
    KUserDefaults.set(obj, forKey: KeyStr)
}
func KUserValue(_ A: String) -> Any? {
    return KUserDefaults.value(forKey: A)
}

//x
func x(object : UIView) -> CGFloat{
    return object.frame.origin.x
}
//y
func y(object : UIView) -> CGFloat{
    return object.frame.origin.y
}
//w
func w(object : UIView) -> CGFloat{
    return object.frame.size.width
}
//h
func h(object : UIView) -> CGFloat {
    return object.frame.size.height
}

//颜色
func KRGBAColor(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
    return UIColor.init(red: r, green: g, blue: b, alpha: a)
}
func KRGBColor(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor{
    return UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
}
func KHexColorA(_ HexString: String,_ a: CGFloat) ->UIColor {
    return UIColor.colorWith(hexString: HexString, alpha: a)
}
func KHexColor(_ HexString: String) ->UIColor {
    return UIColor.colorWith(hexString: HexString)
}

let KCOLOR_BAR_TINT = KHexColor("E1834C")   //nav背景色
let KCOLOR_BAR_TEXT = KHexColor("925657")   //nav字体颜色
let KCOLOR_TAB_TEXT = KHexColor("f55a5d")   //tab字体颜色
let KCOLOR_TEXT_GRAY1 = KHexColor("DCD7D4") //浅灰字体
let KCOLOR_TEXT_WHITE = UIColor.white       //白色字体
let KCOLOR_TEXT_BLACK1 = KHexColor("262626") //黑色字体

let KCOLOR_LINE_GRAY1  = KHexColor("E6E6E6") //分割线颜色


//字体 字号
func KFontSize(_ a: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: KAutoLayoutWidth(a))
}
func KFontBoldSize(_ a: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: KAutoLayoutWidth(a))
}
func KFontWeigtSize(_ a: CGFloat, _ b: UIFont.Weight) -> UIFont{
    return UIFont.systemFont(ofSize: KAutoLayoutWidth(a), weight: b)
}

//图片
func KImageName(_ a: String) -> UIImage?{
    return UIImage(named: a)
}

let FONT_SUPER_BIG: CGFloat    = 32.0
let FONT_BIG: CGFloat          = 22.5
let FONT_MIDDLE: CGFloat       = 18.0
let FONT_SAMLL: CGFloat        = 15.0
let FONT_SUPER_SMALL: CGFloat  = 12.0
let FONT_SUPER_SUPER_SMALL: CGFloat = 10.0


//判断 iPhone 的屏幕尺寸
let KSCREEN_MAX_LENGTH = max(KScreenWidth, KScreenHeight)
let KSCREEN_MIN_LENGTH = min(KScreenWidth, KScreenHeight)

//判断 iPhone 机型
let K_IPHONE = (UIDevice.current.userInterfaceIdiom == .phone)
let KDEVICE_IPHONE5 = (K_IPHONE && KSCREEN_MAX_LENGTH == 568.0)
let KDEVICE_IPHONE6 = (K_IPHONE && KSCREEN_MAX_LENGTH == 667.0)
let KDEVICE_IPHONEPLUS = (K_IPHONE && KSCREEN_MAX_LENGTH == 736.0)
let KDEVICE_IPHONEX = (K_IPHONE && KSCREEN_MAX_LENGTH == 812.0)



// 注册通知
func KNOTIFY_ADD(observer: Any, selector: Selector, name: String) {
    return NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name(rawValue: name), object: nil)
}
// 发送通知
func KNOTIFY_POST(name: String, object: Any) {
    return NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: object)
}
// 移除通知
func KNOTIFY_REMOVE(observer: Any, name: String) {
    return NotificationCenter.default.removeObserver(observer, name: Notification.Name(rawValue: name), object: nil)
}




