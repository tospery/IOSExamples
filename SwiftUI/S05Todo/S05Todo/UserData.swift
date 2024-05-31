//
//  UserData.swift
//  S05Todo
//
//  Created by 杨建祥 on 2024/6/1.
//

import Combine
import SwiftUI

private let defaultTasks: [Task] = [
    Task(title: "Read SwiftUI Documentation 📚", isDone: false),
    Task(title: "Watch WWDC19 Keynote 🎉", isDone: true),
]

final class UserData: ObservableObject {
    let objectWillChange = PassthroughSubject<UserData, Never>()

    @UserDefaultValue(key: "Tasks", defaultValue: defaultTasks)
    var tasks: [Task] {
        didSet {
            objectWillChange.send(self)
        }
    }
}

