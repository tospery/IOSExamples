//
//  WebView.swift
//  S08GitHubSearch
//
//  Created by 杨建祥 on 2024/6/1.
//

import SafariServices
import SwiftUI

struct WebView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<WebView>) {}
}
