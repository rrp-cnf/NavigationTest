//
//  ScreenView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 7/7/24.
//

import SwiftUI

struct ScreenView: View {
    let screen: ScreenViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                ForEach(screen.widgets) { widget in
                    WidgetView(widget: widget)
                }
            }
        }
    }
}

#Preview {
    ScreenView(screen: screenSampleData)
}
