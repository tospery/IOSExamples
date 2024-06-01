//
//  RepositoryView.swift
//  S08GitHubSearch
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

struct RepositoryView : View {

    let repository: Repository

    var body: some View {
        
        VStack(alignment: .leading) {

            HStack {
                Image(systemName: "doc.text")
                Text(repository.fullName)
                    .bold()
            }

            // Show text if description exists
            repository.description
                .map(Text.init)?
                .lineLimit(nil)

            HStack {
                Image(systemName: "star")
                Text("\(repository.stargazersCount)")
            }
        }
    }
}
