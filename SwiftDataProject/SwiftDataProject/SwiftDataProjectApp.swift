//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Jhonnatan Macias on 28/10/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}

//
//Cuando llamas a .modelContainer(for: User.self), SwiftData automáticamente configura un contenedor de modelos que incluye el contexto para User y te permite acceder al modelo de datos desde cualquier vista en la aplicación.
//
//Este contenedor se inyecta en el entorno de las vistas, lo que te permite acceder a él mediante el modificador @Environment(\.modelContext).
