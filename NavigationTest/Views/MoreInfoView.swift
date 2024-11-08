//
//  MoreInfoView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 8/11/24.
//

import SwiftUI

struct MoreInfoView: View {

    let content: ContentViewModel

    var body: some View {
        VStack {
            Text(content.id.uuidString)
            Text(content.title)
                .font(.title)
        }
    }
}

#Preview {
    MoreInfoView(content: contentData1)
}
