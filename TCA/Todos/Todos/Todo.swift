//
//  Todo.swift
//  Todos
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Todo {
    @ObservableState
    struct State: Equatable, Identifiable {
        var description = ""
        let id: UUID
        var isComplete = false
    }
    
    enum Action: BindableAction, Sendable {
        case binding(BindingAction<State>)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
    }
}

struct TodoView: View {
    @ComposableArchitecture.Bindable var store: StoreOf<Todo>
    
    var body: some View {
        HStack {
            Button {
                store.isComplete.toggle()
            } label: {
                Image(systemName: store.isComplete ? "checkmark.square" : "square")
            }
            .buttonStyle(.plain)
            
            TextField("Untitled Todo", text: $store.description)
        }
        .foregroundColor(store.isComplete ? .gray : nil)
    }
}

