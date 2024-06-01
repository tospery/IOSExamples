//
//  NoteRow.swift
//  S06Note
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

struct NoteRow : View {
    var note: Note
    
    var body: some View {
        HStack {
            Text(note.text)
        }
    }
}

#Preview {
    Group {
        NoteRow(note: Note(text: "New Note"))
        NoteRow(note: Note(text: "Another Note"))
    }
}
