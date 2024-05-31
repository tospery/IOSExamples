//
//  Task.swift
//  S05Todo
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

struct Task: Equatable, Hashable, Codable, Identifiable {
    let id: UUID
    var title: String
    var isDone: Bool

    init(title: String, isDone: Bool) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
}
