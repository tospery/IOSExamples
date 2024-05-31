//
//  ArticleView.swift
//  SwiftUI02Article
//
//  Created by 杨建祥 on 2024/5/31.
//

import SwiftUI

struct ArticleView: View {
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(article.title)
            .font(.title)
            Text(article.description)
            .font(.headline)
            Spacer()
        }.padding()
    }
}
