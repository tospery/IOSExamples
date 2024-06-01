//
//  NoteList.swift
//  S06Note
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

struct NoteList : View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List(userData.notes) { note in
                NavigationLink(destination: NoteDetail(note: note)
                    .environmentObject(self.userData)) {
                    NoteRow(note: note)
                }
            }
                .navigationBarTitle(Text("Notes"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: self.createNote, label: { Text("New") }))
        }
    }
    
    private func createNote() {
        let newNote = Note(text: "")
        self.userData.notes.insert(newNote, at: 0)
    }
}


#Preview {
    ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
        NoteList()
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
    }
}
