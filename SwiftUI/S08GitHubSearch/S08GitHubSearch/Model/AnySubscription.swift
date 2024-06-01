//
//  AnySubscription.swift
//  S08GitHubSearch
//
//  Created by 杨建祥 on 2024/6/1.
//

import Combine

/// - seealso: https://twitter.com/peres/status/1135970931153821696
final class AnySubscription: Subscription {

    private let cancellable: AnyCancellable

    init(_ cancel: @escaping () -> Void) {
        self.cancellable = AnyCancellable(cancel)
    }

    func request(_ demand: Subscribers.Demand) {}

    func cancel() {
        cancellable.cancel()
    }
}
