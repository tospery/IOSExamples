//
//  ErrorResponse.swift
//  S08GitHubSearch
//
//  Created by 杨建祥 on 2024/6/1.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    let message: String
}

