//
//  Library+Ex.swift
//  IOSExamples
//
//  Created by liaoya on 2022/2/15.
//

import Foundation
import IQKeyboardManagerSwift
import Toast_Swift
import HiIOS

extension Library: LibraryCompatible {
    
    public func mySetup() {
        self.basic()
        self.setupUmbrella()
        self.setupKeyboardManager()
        self.setupToast()
    }
    
    func setupUmbrella() {
    }
    
    func setupKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }

    func setupToast() {
        ToastManager.shared.position = .center
        ToastManager.shared.isQueueEnabled = true
    }
    
}
