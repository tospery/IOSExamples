//
//  Preference.swift
//  IOSExamples
//
//  Created by 杨建祥 on 2020/11/28.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import URLNavigator
import Rswift
import HiIOS
import ReusableKit_Hi
import ObjectMapper_Hi

struct Preference: ModelType, Identifiable, Subjective, Eventable {
    
    enum Event {
    }
    
    var id = ""
    
    init() {
    }

    init(id: String) {
        self.id = id
    }
    
    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        id                  <- map["id"]
    }
    
}