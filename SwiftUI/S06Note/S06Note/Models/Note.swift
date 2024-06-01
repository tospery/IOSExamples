//
//  Note.swift
//  S06Note
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

struct Note: Hashable, Codable, Identifiable {
    var id = UUID()
    var text: String
    var date = Date()
}
