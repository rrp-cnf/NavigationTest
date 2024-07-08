//
//  ScreenViewModel.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 7/7/24.
//

import Foundation

struct ScreenViewModel: Codable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let backgroundImage: String
    let widgets: [WidgetViewModel]
    
    init(id: UUID = UUID(), title: String, backgroundImage: String, widgets: [WidgetViewModel]) {
        self.id = id
        self.title = title
        self.backgroundImage = backgroundImage
        self.widgets = widgets
    }
}

struct WidgetViewModel: Codable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let backgroundImage: String
    var contents: [ContentViewModel]
    
    init(id: UUID = UUID(), title: String, backgroundImage: String, contents: [ContentViewModel]) {
        self.id = id
        self.title = title
        self.backgroundImage = backgroundImage
        self.contents = contents
    }
}

struct ContentViewModel: Codable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let cover: String
    let contentUrl: String
    let type: ContentTypeEnum
    let contents: [ContentViewModel]?
    
    init(id: UUID = UUID(), title: String, cover: String, contentUrl: String, type: ContentTypeEnum, contents: [ContentViewModel]) {
        self.id = id
        self.title = title
        self.cover = cover
        self.contentUrl = contentUrl
        self.type = type
        self.contents = contents
    }
}

enum ContentTypeEnum: String, Codable {
    case list
    case detail
    case player
}

