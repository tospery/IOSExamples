//
//  HomeViewController+Share.swift
//  IOSExamples
//
//  Created by 杨建祥 on 2022/11/21.
//

import UIKit
import Rswift

extension HomeViewController {
    
    @objc func shareNative(_ parameters: [String: Any]?) {
        let title = "分享内容的标题"
        let message = "这是具体分享的内容，比如活动截止到本月底，大家快快来参加吧~"
        let image = R.image.share_bg()!
        let url = "https://github.com/tospery/flutter_hub".url!
        let vc = UIActivityViewController(activityItems: [title, message, image, url], applicationActivities: nil)
        self.present(vc, animated: true, completion: nil)
    }

}
