//
//  ContentView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 6/7/24.
//

import SwiftUI

struct ContentView: View {

    let menu: [MenuViewModel]

    @StateObject private var router: NavigationModel

    init(menu: [MenuViewModel]) {
        self.menu = menu
        _router = StateObject(wrappedValue: NavigationModel(menu: menu))
    }

    var body: some View {
        TabView(selection: $router.selectedTabId) {
            ForEach(menu) {menuItem in
                NavigationStack(path: $router.path) {
                    MenuItemView(menuItem: menuItem)
                        .navigationDestination(for: ContentViewModel.self) { content in
                            router.view(for: content, type: .push)
                        }
                }
                .tabItem {
                    VStack {
                        Text(menuItem.name)
                        Image(systemName: menuItem.icon)
                    }
                }
                .tag(menuItem.id)
            }
        }
        .sheet(item: $router.presentingSheet) { content in
            router.view(for: content, type: .sheet)
        }
        .sheet(item: $router.presentingError) { error in
            router.view(for: error, type: .sheet)
        }
        .fullScreenCover(item: $router.presentingFullScreenCover) { content in
            router.view(for: content, type: .fullScreenCover)
        }
        .padding()
        .environmentObject(router)
    }
}

#Preview() {
    ContentView(menu: menuSampleData)
}
