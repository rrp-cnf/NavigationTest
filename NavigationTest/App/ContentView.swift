//
//  ContentView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    let menu: [MenuViewModel]
    @StateObject private var navigationModel: NavigationModel
    init(menu: [MenuViewModel]) {
        self.menu = menu
        _navigationModel = StateObject(wrappedValue: NavigationModel(menu: menu))
    }
    
    var body: some View {
        TabView(selection: $navigationModel.selectedTabId) {
            ForEach(menu) {menuItem in
                NavigationStack(path: binding(for: menuItem.id)) {
                    MenuItemView(menuItem: menuItem)
                        .navigationDestination(for: ContentViewModel.self) { content in
                            switch content.type {
                            case .detail:
                                ContentDetailView(content: content)
                            case .player:
                                PlayerView(content: content)
                            case .list:
                                ListView(content: content)
                            }
                        }
                        .navigationDestination(for: ContentViewModelDetailWrapper.self) { content in
                            if (content.content.type == .list) {
                                ListView(content: content.content)
                            } else {
                                PlayerView(content: content.content)
                            }
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
        .padding()
    }
    
    private func binding(for key: UUID) -> Binding<NavigationPath> {
        Binding(
            get: { navigationModel.paths[key, default: NavigationPath()] },
            set: { navigationModel.paths[key] = $0 }
        )
    }
}

#Preview() {
    ContentView(menu: menuSampleData)
}
