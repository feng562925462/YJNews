//
//  YJGlobal.swift
//  YJNews
//
//  Created by cool on 2018/5/25.
//  Copyright © 2018 cool. All rights reserved.
//

import Foundation
import UIKit

// 是否是夜间模式
let isNightKey = "isNightKey"
// 夜间模式切换通知
let DayNightModeSwitchingNotification = "DayNightModeSwitchingNotification"


// MARK:- 自定义打印方法
public func YJLog<T>(_ items:T ,file:String = #file,method: String = #function,line: Int = #line){
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)],\(method):\n\(items)\n--------------------------------------")
    #endif
}

/**
 *  把String转化为UIViewController
 */
public func classFromString(_ className:String) -> UIViewController?{
    //Swift中命名空间的概念
    guard let nameSpage = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
        YJLog("没有命名空间")
        return nil
    }
    guard let childVcClass = NSClassFromString(nameSpage + "." + className) else {
        YJLog("没有获取到对应的class")
        return nil
    }
    guard let childVcType = childVcClass as? UIViewController.Type else {
        YJLog("没有得到的类型")
        return nil
    }
    let vc = childVcType.init()
    return vc
}
