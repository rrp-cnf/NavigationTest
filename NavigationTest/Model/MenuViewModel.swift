//
//  MenuViewModel.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 6/7/24.
//

import Foundation

struct MenuViewModel: Codable, Identifiable {
    let id: UUID
    let name: String
    let icon: String
    let type: MenuTypeEnum
    
    init(id: UUID = UUID(), name: String, icon: String, type: MenuTypeEnum) {
        self.id = id
        self.name = name
        self.icon = icon
        self.type = type
    }
}

enum MenuTypeEnum: String, Codable {
    case screen
    case list
    case profile
    case search
}
