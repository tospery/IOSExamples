//
//  CaseItem.swift
//  IOSExamples
//
//  Created by liaoya on 2022/11/15.
//

import Foundation
import ReactorKit
import HiIOS

class CaseItem: BaseTableItem, ReactorKit.Reactor {

    typealias Action = NoAction
    
    struct State {
        var name: String?
    }

    var initialState = State()

    required init(_ model: ModelType) {
        super.init(model)
        guard let `case` = model as? Case else { return }
        self.initialState = State(
            name: `case`.name
        )
    }
}
