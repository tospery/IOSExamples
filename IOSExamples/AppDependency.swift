//
//  AppDependency.swift
//  IOSExamples
//
//  Created by liaoya on 2022/7/20.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import URLNavigator
import Rswift
import HiIOS
import RxOptional
import RxSwiftExt
import NSObject_Rx
import RxDataSources
import RxViewController
import RxTheme
import ReusableKit_Hi
import ObjectMapper_Hi
import SwifterSwift_Hi
import BonMot


final class AppDependency: HiIOS.AppDependency {

    static var shared = AppDependency()
    
    // MARK: - Initialize
    override func initialScreen(with window: inout UIWindow?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        self.window = window

        let title = UIApplication.shared.name
        var models = [Case].init()
        if let json = FileManager.default.json(withFilename: "Home.json") as? [[String: Any]] {
            models = [Case].init(JSONArray: json)
        }
        let viewReactor = HomeViewReactor(self.provider, [
            Parameter.title: title,
            Parameter.models: models
        ])
        let viewController = HomeViewController(self.navigator, viewReactor)
        let navigationController = NavigationController.init(rootViewController: viewController)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: - Test
    override func test(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        log("看看: \(envParameters)")
    }

    // MARK: - Setup
//    override func setupPreference() {
//        let userid = User.current?.id
//        let pref = Preference.cachedObject(id: userid) ?? .init(id: userid ?? "")
//        Subjection.update(Preference.self, pref, true)
//    }
    override func setupConfiguration() {
        
    }
    
    // MARK: - Lifecycle
    override func application(
        _ application: UIApplication,
        entryDidFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        super.application(application, entryDidFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(
        _ application: UIApplication,
        leaveDidFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        super.application(application, leaveDidFinishLaunchingWithOptions: launchOptions)
    }
    
}
