//
//  ContentView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    let menu = menuSampleData
    var body: some View {
        TabView() {
            ForEach(menu) {menuItem in
                NavigationStack() {
                    MenuItemView(menuItem: menuItem)
                }
                .tabItem {
                    VStack {
                        Text(menuItem.name)
                        Image(systemName: menuItem.icon)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview() {
    ContentView()
}
