//
//  Case.swift
//  IOSExamples
//
//  Created by liaoya on 2022/11/15.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper_Hi
import HiIOS

struct Case: ModelType {
    var id = UUID.init().uuidString
    var name = ""
    var forward = ""
    var parameters = [String: Any].init()
    
    init() {
    }
    
    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        id              <- map["guid"]
        name            <- map["name"]
        forward         <- map["forward"]
        parameters      <- map["parameters"]
    }
}
