//
//  TabBarView.swift
//  SwiftUI02Article
//
//  Created by 杨建祥 on 2024/5/31.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ArticlesListView(articles: techArticles)
            .tabItem {
                Image(systemName: "desktopcomputer")
                Text("Tech")
            }.tag(0)
            ArticlesListView(articles: businessArticles)
            .tabItem {
                Image(systemName: "dollarsign.circle")
                Text("Science")
            }.tag(1)
            ArticlesListView(articles: sportArticles)
            .tabItem {
                Image(systemName: "sportscourt")
                Text("Design")
            }.tag(2)
        }.navigationTitle("Articles")
    }
}
