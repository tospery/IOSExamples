//
//  ItemResponse.swift
//  S08GitHubSearch
//
//  Created by 杨建祥 on 2024/6/1.
//

import Foundation

struct ItemResponse<T: Decodable>: Decodable {
    let items: [T]
}
