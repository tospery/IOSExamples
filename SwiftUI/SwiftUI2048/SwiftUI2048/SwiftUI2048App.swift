//
//  SwiftUI2048App.swift
//  SwiftUI2048
//
//  Created by 杨建祥 on 2024/6/3.
//

import SwiftUI

@main
struct SwiftUI2048App: App {
    var body: some Scene {
        WindowGroup {
            GameView().environmentObject(GameLogic())
        }
    }
}
