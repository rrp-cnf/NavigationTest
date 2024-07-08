//
//  PlayerView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 8/7/24.
//

import SwiftUI

struct PlayerView: View {
    let content: ContentViewModel
    
    var body: some View {
        Text("Content: \(content.contentUrl)")
    }
}

#Preview {
    PlayerView(content: contentData2)
}
