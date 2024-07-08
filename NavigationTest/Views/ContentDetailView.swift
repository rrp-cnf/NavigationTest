//
//  ContentDetailView.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 7/7/24.
//

import SwiftUI
import UIKit
import UIImageColors

struct ContentDetailView: View {
    
    let content: ContentViewModel
    @State private var titleColor: Color = .white
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Imagen de fondo
            AsyncImage(url: URL(string: content.cover)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .onAppear {
                        extractColors(from: image)
                    }
                    .ignoresSafeArea()
            } placeholder: {
                Color.gray
                    .ignoresSafeArea()
            }
            
            // Contenido sobre la imagen de fondo
            VStack(alignment: .leading) {
                Text(content.title)
                    .font(.title)
                    .foregroundColor(titleColor)
                NavigationLink(value: content, label: {
                    Text(content.type == .list ? "Ver Episodios" : "Ver Contenido")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(BlurView(style: .systemUltraThinMaterial))
                        .cornerRadius(10)
                })
            }
            .padding(.horizontal)
        }
        Spacer()
    }
    
    private func extractColors(from image: Image) {
        guard let uiImage = image.asUIImage() else { return }
        
        uiImage.getColors { colors in
            guard let colors = colors else { return }
            let backgroundColor = colors.background
            
            DispatchQueue.main.async {
                // Decide el color del texto en función del color de fondo predominante
                titleColor = backgroundColor?.isLight ?? true ? .black : .white
            }
        }
    }
}

extension Image {
    func asUIImage() -> UIImage? {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: CGRect(origin: .zero, size: targetSize), afterScreenUpdates: true)
        }
    }
}

extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        self.getWhite(&white, alpha: nil)
        return white > 0.5
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview ("Detalle") {
    ContentDetailView(content: contentData10)
}

#Preview ("Lista") {
    ContentDetailView(content: contentData29)
}
