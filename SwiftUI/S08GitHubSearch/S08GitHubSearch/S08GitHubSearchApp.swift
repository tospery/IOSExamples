//
//  S08GitHubSearchApp.swift
//  S08GitHubSearch
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

@main
struct S08GitHubSearchApp: App {
    var body: some Scene {
        WindowGroup {
            RepositoryListView(viewModel: RepositoryListViewModel(mainScheduler: DispatchQueue.main))
        }
    }
}
