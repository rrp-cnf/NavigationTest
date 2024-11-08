//
//  MenuItemView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 7/7/24.
//

import SwiftUI

struct MenuItemView: View {
    let menuItem: MenuViewModel

    var body: some View {
        switch menuItem.type {
        case .screen:
            ScreenView(screen: screenSampleData)
        case .list:
            HotView()
        case .search:
            SearchView()
        case .profile:
            ProfileView(user: userRichieData)
        }
    }
}

#Preview {
    MenuItemView(menuItem: homeMenuData)
}
