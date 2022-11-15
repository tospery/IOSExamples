//
//  CaseViewReactor.swift
//  IOSExamples
//
//  Created by liaoya on 2022/11/15.
//

import Foundation
import ReactorKit
import HiIOS

class CaseViewReactor: TableViewReactor, ReactorKit.Reactor {
    enum Action {
        case load
    }

    enum Mutation {
        case setLoading(Bool)
        case setError(Error?)
        case setCases([Case])
    }

    struct State {
        var isLoading = false
        var title: String?
        var error: Error?
        var cases = [Case].init()
        var sections = [CaseSection].init()
    }

    var initialState = State()

    required init(_ provider: ProviderType, _ parameters: [String: Any]?) {
        super.init(provider, parameters)
        self.initialState = State(
            title: self.title,
            cases: self.parameters.array(for: Parameter.models) as? [Case] ?? []
        )
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .load:
            return .concat([
                .just(.setLoading(true)),
                .just(.setCases(self.currentState.cases)),
                .just(.setLoading(false))
            ])
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setLoading(isLoading):
            newState.isLoading = isLoading
        case let .setError(error):
            newState.error = error
        case let .setCases(cases):
            newState.cases = cases
            newState.sections = [CaseSection.cases(cases.map { CaseSectionItem.case(CaseItem.init($0)) })]
        }
        return newState
    }
}
