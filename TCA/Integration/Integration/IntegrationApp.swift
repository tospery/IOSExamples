//
//  IntegrationApp.swift
//  Integration
//
//  Created by 杨建祥 on 2024/6/7.
//

@_spi(Logging) import ComposableArchitecture
import SwiftUI
import TestCases

@main
struct IntegrationApp: App {
  @UIApplicationDelegateAdaptor var appDelegate: IntegrationAppDelegate
  var body: some Scene {
    WindowGroup {}
  }
}

final class IntegrationSceneDelegate: NSObject, UIWindowSceneDelegate {
    var keyWindow: UIWindow!
    var logsWindow: UIWindow!
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        NotificationCenter.default.post(name: .clearLogs, object: nil)
    }
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene
        else { return }
        
        self.logsWindow = UIWindow(windowScene: windowScene)
        self.logsWindow.rootViewController = UIHostingController(rootView: LogsView())
        self.logsWindow.rootViewController?.view.backgroundColor = .clear
        self.logsWindow.isUserInteractionEnabled = false
        self.logsWindow.makeKeyAndVisible()
        
        self.keyWindow = UIWindow(windowScene: windowScene)
        self.keyWindow.rootViewController = UIHostingController(rootView: ContentView())
        self.keyWindow.makeKeyAndVisible()
    }
}

final class IntegrationAppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        Logger.shared.isEnabled = true
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = IntegrationSceneDelegate.self
        return sceneConfig
    }
}

private struct LogsView: View {
    @State var logs: [String] = []
    
    var body: some View {
        if ProcessInfo.processInfo.environment["UI_TEST"] != nil {
            VStack {
                Text(self.logs.joined(separator: "\n"))
                    .accessibilityIdentifier("composable-architecture.debug.logs")
                    .allowsHitTesting(false)
            }
            .background(Color.clear)
            .onReceive(Logger.shared.$logs) { self.logs = $0 }
            .onReceive(NotificationCenter.default.publisher(for: .clearLogs)) { _ in
                Logger.shared.clear()
            }
        }
    }
}
