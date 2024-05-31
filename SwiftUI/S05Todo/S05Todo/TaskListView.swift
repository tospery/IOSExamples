//
//  TaskListView.swift
//  S05Todo
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI

struct TaskListView: View {
  @EnvironmentObject var userData: UserData
  @State var draftTitle: String = ""
  @State var isEditing: Bool = false

  var body: some View {
    NavigationView {
    List {
      TextField("Create a New Task...", text: $draftTitle, onCommit: self.createTask)
      ForEach(self.userData.tasks) { task in
        TaskItemView(task: task, isEditing: self.$isEditing)
      }
    }
    .navigationBarTitle(Text("Tasks 👀"))
    .navigationBarItems(trailing: Button(action: { self.isEditing.toggle() }) {
      if !self.isEditing {
        Text("Edit")
      } else {
        Text("Done").bold()
      }
    })
    }
  }

  private func createTask() {
    let newTask = Task(title: self.draftTitle, isDone: false)
    self.userData.tasks.insert(newTask, at: 0)
    self.draftTitle = ""
  }
}


#Preview {
    TaskListView()
}
