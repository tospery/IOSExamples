//
//  S06NoteApp.swift
//  S06Note
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

@main
struct S06NoteApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            NoteList()
                .environmentObject(UserData())
        }
        .onChange(of: scenePhase) { newScenePhase in
             switch newScenePhase {
             case .inactive:
                 NoteData.shared.save()
             default:
                 break
             }
         }
    }
}
