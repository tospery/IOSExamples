//
//  Router+Ex.swift
//  IOSExamples
//
//  Created by liaoya on 2022/2/16.
//

import SwiftEntryKit
import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import URLNavigator
import Rswift
import HiIOS

extension Router: RouterCompatible {
    
    public func isLogined() -> Bool {
        false
    }
    
    public func isLegalHost(host: Host) -> Bool {
        true
    }
    
    public func allowedPaths(host: Host) -> [Path] {
        switch host {
        case .popup: return [
            .inviteNew
        ]
        default: return []
        }
    }
    
    public func hasType(host: Router.Host) -> Bool {
        switch host {
        case .popup: return true
        default: return false
        }
    }
    
    public func forDetail(host: Router.Host) -> Bool {
        switch host {
        case .user: return true
        default: return false
        }
    }
    
    public func needLogin(host: Router.Host, path: Router.Path?) -> Bool {
        switch host {
        case .user: return path == nil
        default: return false
        }
    }
    
    public func customLogin(
        _ provider: HiIOS.ProviderType,
        _ navigator: NavigatorProtocol,
        _ url: URLConvertible,
        _ values: [String: Any],
        _ context: Any?
    ) -> Bool {
        true
    }
    
    public func shouldRefresh(host: Host, path: Router.Path? = nil) -> Bool {
        false
    }
    
    public func shouldLoadMore(host: Host, path: Router.Path? = nil) -> Bool {
        false
    }

}
