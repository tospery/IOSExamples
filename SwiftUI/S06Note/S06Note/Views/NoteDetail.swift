//
//  NoteDetail.swift
//  S06Note
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

struct NoteDetail : View {
    @EnvironmentObject var userData: UserData
    var note: Note
    private var text: State<String>
    
    init(note: Note) {
        self.note = note
        self.text = .init(initialValue: note.text)
    }
    
    var noteIndex: Int {
        userData.notes.firstIndex(where: { $0.id == note.id })!
    }
    
    var body: some View {
        VStack {
            TextField("", text: self.text.projectedValue,
                      onEditingChanged: { _ in self.updateNote()},
                      onCommit: {})
            Spacer()
        }
        .padding()
        .navigationBarTitle(
            Text(NoteData.dateToString(date: note.date)), displayMode: .inline)
    }
    
    private func updateNote() {
        self.userData.notes[noteIndex].text = self.text.wrappedValue
    }
}

#Preview {
    NoteDetail(note: NoteData.shared.notes[0])
        .environmentObject(UserData())
}
