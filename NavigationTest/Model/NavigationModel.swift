//
//  NavigationModel.swift
//  NavigationTest
//
//  Created by Ricardo Rodríguez on 8/7/24.
//

import SwiftUI
import Combine

class NavigationModel: ObservableObject {
    @Published var selectedTabId: UUID
    @Published var path: NavigationPath

    @Published var presentingSheet: ContentViewModel?
    @Published var presentingFullScreenCover: ContentViewModel?

    private var cancellables = Set<AnyCancellable>()
    /*
     Uno de los retos de esta implementación es resetear la navegación cada vez que se cambia de tab, para eso he pedido
     ayuda a ChatGPT que lo ha resuelto con la lista de cancellables y añadiendo el observador en el constructor.
     Adjunto explicación de ChatGPT a la solución:
     Explicación:
         •    Importar Combine: Asegúrate de importar el framework Combine para poder utilizar los publishers y subscribers.
         •    Crear una colección de AnyCancellable: Esto es necesario para almacenar las suscripciones y evitar fugas de memoria.
         •    Observar selectedTabId: Utilizamos el publisher $selectedTabId para observar cambios en esta propiedad.
         •    Suscribirse al publisher: Con el método sink, ejecutamos popToRoot() cada vez que selectedTabId cambia.
         •    Almacenar la suscripción: Usamos .store(in: &cancellables) para mantener viva la suscripción mientras la instancia de NavigationModel exista.

     Nota: Usar didSet en una propiedad @Published no es recomendable, ya que @Published ya maneja sus propios observadores internos, lo que puede llevar a comportamientos inesperados.

     De esta manera, cada vez que cambie el valor de selectedTabId, el método popToRoot() se ejecutará, reseteando la navegación como deseas.
     */

    init(menu: [MenuViewModel]) {
        self.path = NavigationPath()
        self.selectedTabId = menu.first?.id ?? UUID()
        $selectedTabId
            .sink { [weak self] _ in
                self?.popToRoot()
            }
            .store(in: &cancellables)
    }
    
    func navigate(to destination: ContentViewModel, preferredNavigationType: NavigationTypeEnum) {
        switch preferredNavigationType {
        case .push:
            switch destination.type {
            case .detail, .list:
                push(destination)
            case .player:
                presentFullScreen(destination)
            }
        case .fullScreenCover:
            switch destination.type {
            case .list:
                push(destination)
            case .detail, .player:
                presentFullScreen(destination)
            }
        case .sheet:
            presentSheet(destination)
        }
    }

    func navigateBack() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    @ViewBuilder
    func view(for content: ContentViewModel) -> some View {
        switch content.type {
        case .list:
            ListView(content: content)
        default:
            ContentDetailView(content: content)
        }
    }

    private func push(_ content: ContentViewModel) {
        print("adding content \(content.id) to path: \(selectedTabId)")
        path.append(content)
    }

    private func presentSheet(_ content: ContentViewModel) {
        self.presentingSheet = content
    }

    private func presentFullScreen(_ content: ContentViewModel) {
        self.presentingFullScreenCover = content
    }
}

public enum NavigationTypeEnum {
    case push
    case sheet
    case fullScreenCover
}
