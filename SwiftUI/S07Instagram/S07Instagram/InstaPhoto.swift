//
//  InstaPhoto.swift
//  S07Instagram
//
//  Created by 杨建祥 on 2024/6/1.
//

import Foundation

struct InstaPhoto: Identifiable {
    let id: Int
    let username: String
    let comments: [String]
    let likes: Int
    let image: String
}
