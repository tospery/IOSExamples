//
//  TestCase.swift
//  TestCases
//
//  Created by 杨建祥 on 2024/6/7.
//

import Foundation

public enum TestCase: String, CaseIterable, Identifiable, RawRepresentable {
  case escapedWithViewStore = "Escaped WithViewStore"
  case ifLetStore = "IfLetStore"
  case forEachBinding = "ForEach Binding"
  case navigationStack = "NavigationStack"
  case presentation = "Presentation APIs"
  case presentationItem = "Presentation Item"
  case switchStore = "SwitchStore/CaseLet Warning"
  case bindingLocal = "BindingLocal Warning"

  public var id: Self { self }
}
