//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Jhonnatan Macias on 28/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
//    @Query(sort: \User.name) var users: [User]
//    @Query(filter: #Predicate<User> { user in
//        user.name.localizedStandardContains("R") &&
//        user.city == "London"
//    }, sort: \User.name) var users: [User]
    
//    @Query(filter: #Predicate<User> { user in
//        if user.name.localizedStandardContains("R")  {
//            if user.city == "London" {
//                return true
//            } else {
//                return false
//            }
//        } else {
//            return false
//        }
//      }, sort: \User.name) var users: [User]
   
//    @State private var path = [User]()
//    @State private var pathGeneric = NavigationPath()
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)]

    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    let firts = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Ed Diaz", city: "Quilla", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                   
                    modelContext.insert(firts)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
//                    pathGeneric.append(user)
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        Text("Sort By Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
//                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}

/*
 VERSIIN 1
 
 
 struct ContentView: View {
     @Environment(\.modelContext) private var modelContext
     @Query(sort: \User.name) var users: [User]
     @State private var path = [User]()
     @State private var pathGeneric = NavigationPath()

     var body: some View {
         NavigationStack(path: $path) {
             List(users) { user in
                 NavigationLink(value: user) {
                     Text(user.name)
                 }
             }
             .navigationTitle("Users")
             .navigationDestination(for: User.self) { user in
                 EditUserView(user: user)
             }
             .toolbar {
                 Button("Add User", systemImage: "plus") {
                     let user = User(name: "", city: "", joinDate: Date.now)
                     modelContext.insert(user)
                     path = [user]
 //                    pathGeneric.append(user)
                 }
             }
         }
     }

     private func addItem() {
         withAnimation {
 //            let newItem = Item(timestamp: Date())
 //            modelContext.insert(newItem)
         }
     }

     private func deleteItems(offsets: IndexSet) {
         withAnimation {
             for index in offsets {
 //                modelContext.delete(items[index])
             }
         }
     }
 }
 */

//El path es una propiedad que mantiene el estado de la navegación dentro de un NavigationStack. En SwiftUI, el NavigationStack se usa para manejar la navegación en una vista de pila, lo que te permite navegar a otras vistas de manera jerárquica. Este componente es más moderno y flexible que el viejo NavigationView.
/*
 
 
 @State private var path = [User]():
 Esta es una propiedad de estado (usando @State) que mantiene un array de usuarios ([User]). El propósito de esta propiedad es almacenar el estado actual de la navegación en la pila. Cuando navegas a una vista, agregas un elemento (en este caso un User) al array path.

 NavigationStack(path: $path):
 Aquí, se está usando el NavigationStack con un enlace bidireccional a la propiedad path. Cuando la navegación cambia (es decir, cuando el usuario navega hacia una nueva vista), el path se actualiza automáticamente para reflejar qué vistas están en la pila de navegación. Esto permite a SwiftUI rastrear el historial de navegación y gestionarlo.

 path = [user]:
 En el botón "Add User", cuando se crea un nuevo usuario, se inserta en el modelo de datos (modelContext.insert(user)) y luego se actualiza el path con ese nuevo usuario. Esto provoca que la vista actual navegue hacia la vista de detalles de ese nuevo usuario, ya que el path refleja ahora un único usuario.
 */
