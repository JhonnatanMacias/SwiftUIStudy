//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Jhonnatan Macias on 5/02/25.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]

    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                Spacer()
                Text(String(user.jobs.count))
                    .fontWeight((.black))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear(perform: {
            addSample()
        })
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users =  Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "NUY", joinDate: .now)
        let job1 = Job(name: "Organize soch drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)
        modelContext.insert(user1)
        
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

/*(o propiedades que vienen con un wrapper de propiedad como @State, @Binding, etc.)
Usas _users en el inicializador porque estás interactuando con la propiedad interna del wrapper (@Query).
Usas users más tarde cuando necesitas acceder al valor de esa propiedad para mostrarlo en la vista o hacer cálculos.
Este patrón se utiliza comúnmente en SwiftUI y en otros lugares donde las propiedades están envueltas con wrappers para proporcionar más funcionalidades como la observación de cambios o la gestión de estado.*/

//@Query(filter: #Predicate<User> { user in
//    if user.name.localizedStandardContains("R")  {
//        if user.city == "London" {
//            return true
//        } else {
//            return false
//        }
//    } else {
//        return false
//    }
//  }, sort: \User.name) var users: [User]

#Preview {
    UsersView(minimumJoinDate: .now,
              sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
