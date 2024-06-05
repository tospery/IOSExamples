//
//  AnimatingViewsAndTransitionsApp.swift
//  AnimatingViewsAndTransitions
//
//  Created by 杨建祥 on 2024/6/4.
//

import SwiftUI

@main
struct AnimatingViewsAndTransitionsApp: App {
    var body: some Scene {
        WindowGroup {
            LandmarkList().environmentObject(UserData())
        }
    }
}
