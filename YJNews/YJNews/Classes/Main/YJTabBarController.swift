//
//  YJTabBarController.swift
//  YJNews
//
//  Created by cool on 2018/5/25.
//  Copyright © 2018 cool. All rights reserved.
//

import UIKit

class YJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.lightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.orange], for: .selected)
        
        tabBar.tintColor = UIColor.orange
        tabBar.backgroundColor = UIColor.white
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDayOrNightButtonClicked), name: NSNotification.Name(rawValue: "dayOrNightButtonClicked"), object: nil)
    }
    
    /// 接收到了按钮点击的通知
    @objc func receiveDayOrNightButtonClicked(notification: Notification) {
        let selected = notification.object as! Bool
    
        for childController in childViewControllers {
            switch childController.title! {
            case "首页":
                setChildController(childController, imageName: "home", isDay: !selected)
            case "西瓜视频":
                setChildController(childController, imageName: "video", isDay: !selected)
            case "小视频":
                setChildController(childController, imageName: "huoshan", isDay: !selected)
            case "微头条":
                setChildController(childController, imageName: "weitoutiao", isDay: !selected)
            case "":
                setChildController(childController, imageName: "redpackage", isDay: !selected)
            default:
                break
            }
        }
    }

    // 控制器图标设置
    func setChildController(_ controller: UIViewController, imageName: String, isDay: Bool = true) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar\(isDay == true ? "" :"_night")_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press\(isDay == true ? "" :"_night")_32x32_")
    }
    
    /// 添加子控制器
    private func addChildViewControllers() {
        setChildViewController(HomeViewController(), title: "首页", imageName: "home")
        setChildViewController(WatermelonVideoViewController(), title: "西瓜视频", imageName: "video")
        setChildViewController(RedPackageViewController(), title: "", imageName: "redpackage")
        setChildViewController(HeadlinesViewController(), title: "微头条", imageName: "weitoutiao")
        setChildViewController(SmallVideoViewController(), title: "小视频", imageName: "huoshan")
    }
    
    /// 初始化子控制器
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        // 设置 tabbar 文字和图片
        setChildController(childController, imageName: imageName, isDay: !UserDefaults.standard.bool(forKey: isNightKey))
        childController.title = title
        childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -5)
        // 添加导航控制器为 TabBarController 的子控制器
        addChildViewController(YJNavigationViewController(rootViewController: childController))
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
