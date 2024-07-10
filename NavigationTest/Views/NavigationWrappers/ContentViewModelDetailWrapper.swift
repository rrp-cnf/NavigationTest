//
//  ContentViewModelDetailWrapper.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 9/7/24.
//

import Foundation

struct ContentViewModelDetailWrapper: Identifiable, Hashable, Codable {
    let id: UUID
    let content: ContentViewModel
    
    init(content: ContentViewModel) {
        self.id = content.id
        self.content = content
    }
}
