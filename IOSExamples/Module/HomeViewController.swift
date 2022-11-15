//
//  HomeViewController.swift
//  IOSExamples
//
//  Created by liaoya on 2022/11/15.
//

import UIKit

class HomeViewController: CaseViewController {
    
    @objc func test(_ parameters: [String: Any]?) {
        log("test")
    }
    
    @objc func openWeibo(_ parameters: [String: Any]?) {
        let url = "sinaweibo://userinfo?uid=7718833735".url!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            log("网页打开: https://weibo.com/u/7718833735")
            log("网页打开: https://m.weibo.cn/u/7718833735")
        }
    }
    
}
