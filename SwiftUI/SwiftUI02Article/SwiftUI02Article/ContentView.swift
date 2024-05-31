//
//  ContentView.swift
//  SwiftUI02Article
//
//  Created by 杨建祥 on 2024/5/31.
//

import SwiftUI

struct ContentView: View {
#if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass:UserInterfaceSizeClass?
#endif
    @ViewBuilder
    var body: some View {
        NavigationView {
#if os(iOS)
            if horizontalSizeClass == .compact {
                TabBarView()
            } else {
                SideBarView()
            }
#else
            SideBarView()
#endif
        }
    }
}

#Preview {
    ContentView()
}
