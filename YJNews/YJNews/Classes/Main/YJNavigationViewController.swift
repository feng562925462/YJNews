//
//  YJNavigationViewController.swift
//  YJNews
//
//  Created by cool on 2018/5/25.
//  Copyright © 2018 cool. All rights reserved.
//

import UIKit

class YJNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 设置导航条
        navigationBar.setBackgroundImage(UIImage(named: "navigation_background"), for: .default)
        navigationBar.shadowImage = UIImage()
        
        /// 设置导航条的标题
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
        
        /// 设置返回按钮图标的颜色
        navigationBar.tintColor = UIColor.white
        
        /// 设置返回按钮文字
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: .normal)
    }
    
    /// 设置标题颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// 设置屏幕状态
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // 拦截 push 操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_24x24_"), style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    /// 返回上一控制器
    @objc private func navigationBack() {
        popViewController(animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
