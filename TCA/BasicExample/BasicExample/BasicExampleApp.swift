//
//  BasicExampleApp.swift
//  BasicExample
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI
import ComposableArchitecture

@main
struct BasicExampleApp: App {
    var body: some Scene {
        WindowGroup {
            FeatureView(
                store: Store(initialState: Feature.State()) {
                    Feature()
                }
            )
        }
    }
}
