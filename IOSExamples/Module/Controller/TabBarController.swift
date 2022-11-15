//
//  TabBarController.swift
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

class TabBarController: HiIOS.TabBarController, ReactorKit.View {

    required init(_ navigator: NavigatorProtocol, _ reactor: BaseViewReactor) {
        defer {
            self.reactor = reactor as? TabBarReactor
        }
        super.init(navigator, reactor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.theme.barTintColor = themeService.attribute { $0.lightColor }
        self.tabBar.theme.tintColor = themeService.attribute { $0.primaryColor }
        self.tabBar.theme.unselectedItemTintColor = themeService.attribute { $0.titleColor }
    }

    func bind(reactor: TabBarReactor) {
        super.bind(reactor: reactor)
        reactor.state.map { $0.keys }
            .take(until: self.rx.viewDidLoad)
            .subscribe(onNext: { [weak self] keys in
                guard let `self` = self else { return }
                self.viewControllers = keys.map {
                    NavigationController(rootViewController: self.viewController(with: $0))
                }
            })
            .disposed(by: self.disposeBag)
    }

    func viewController(with key: TabBarKey) -> BaseViewController {
        var viewController: BaseViewController!
        switch key {
        case .dashboard:
            viewController = DashboardViewController(self.navigator, DashboardViewReactor(self.reactor!.provider, nil))
            viewController.tabBarItem.image = R.image.tabbar_dashboard_normal()?.original
            viewController.tabBarItem.selectedImage = R.image.tabbar_dashboard_selected()?.original
        case .personal:
            viewController = PersonalViewController(self.navigator, PersonalViewReactor(self.reactor!.provider, nil))
            viewController.tabBarItem.image = R.image.tabbar_personal_normal()?.original
            viewController.tabBarItem.selectedImage = R.image.tabbar_personal_selected()?.original
        }
        viewController.hidesBottomBarWhenPushed = false
        return viewController!
    }

}
