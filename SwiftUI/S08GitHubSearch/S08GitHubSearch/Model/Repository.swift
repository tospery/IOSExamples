//
//  Repository.swift
//  S08GitHubSearch
//
//  Created by 杨建祥 on 2024/6/1.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let fullName: String
    let description: String?
    let stargazersCount: Int
    let htmlUrl: URL
}
