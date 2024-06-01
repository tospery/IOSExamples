//
//  UserData.swift
//  S06Note
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    let objectWillChange = PassthroughSubject<UserData, Never>()
    
    var notes = NoteData.shared.notes {
        didSet {
            objectWillChange.send(self)
            NoteData.shared.notes = notes
        }
    }
}
