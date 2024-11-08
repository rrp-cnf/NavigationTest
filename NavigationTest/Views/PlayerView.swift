//
//  PlayerView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 8/7/24.
//

import SwiftUI
import AVKit

struct PlayerView: View {

    let content: ContentViewModel

    var body: some View {
        if let url = URL(string: content.contentUrl) {
            let player = AVPlayer(url: url)
            VideoPlayer(player: player)
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
            .edgesIgnoringSafeArea(.all)
        } else {
            Text("Url \(content.contentUrl) no válida.")
                .focusable()
        }
    }
}

#Preview {
    PlayerView(content: contentData2)
}
