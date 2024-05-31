//
//  SideBarView.swift
//  SwiftUI02Article
//
//  Created by 杨建祥 on 2024/5/31.
//

import SwiftUI

struct SideBarView: View {
    @ViewBuilder
    var body: some View {
        List() {
            NavigationLink(
                destination: ArticlesListView(articles: techArticles),
                label: {
                    Label("Tech", systemImage: "desktopcomputer")
                }
            )
            NavigationLink(
                destination: ArticlesListView(articles: businessArticles) ,
                label: { Label("Business", systemImage: "dollarsign.circle")
                }
            )
            NavigationLink(
                destination: ArticlesListView(articles: sportArticles),
                label: { Label("Sport", systemImage: "sportscourt") }
            )
        }
        .navigationTitle("Articles")
        .listStyle(SidebarListStyle())
    }
}

