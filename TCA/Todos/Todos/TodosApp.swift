//
//  TodosApp.swift
//  Todos
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI
import ComposableArchitecture

@main
struct TodosApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
                store: Store(initialState: Todos.State()) {
                    Todos()
                }
            )
        }
    }
}
