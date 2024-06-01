//
//  CameraView.swift
//  S07Instagram
//
//  Created by 杨建祥 on 2024/6/1.
//

import SwiftUI
import UIKit

struct CameraView : UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> CameraViewController {
        return CameraViewController()
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: UIViewControllerRepresentableContext<CameraView>) {
        
    }
    
    typealias UIViewControllerType = CameraViewController
}
