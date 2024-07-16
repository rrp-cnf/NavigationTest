//
//  WidgetView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 8/7/24.
//

import SwiftUI

struct WidgetView: View {
    let widget: WidgetViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(widget.title)
                .font(.headline)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(widget.contents) { content in
                        NavigationLink(value: content, label: {
                            VStack {
                                ContentImageView(url: content.cover)
                                    .cornerRadius(4)
                                Text(content.title)
                                    .font(.caption)
                                    .bold()
                                    //.frame(minWidth: 0, maxWidth: .infinity)
                                    .lineLimit(1)
                            }
                            .frame(width: 320, height: 240)
                        })
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    WidgetView(widget: widgetData1)
}
