//
//  NavigationModel.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 8/7/24.
//

import SwiftUI

class NavigationModel: ObservableObject {
    @Published var selectedTabId: UUID
    @Published var paths: [UUID: NavigationPath]

    init(menu: [MenuViewModel]) {
        var initialPaths = [UUID: NavigationPath]()
        for menuItem in menu {
            initialPaths[menuItem.id] = NavigationPath()
        }
        self.paths = initialPaths
        self.selectedTabId = menu.first?.id ?? UUID()
    }
}
