//
//  NavigationStackExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 24/06/24.
//

import SwiftUI

struct StudentList: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
        NavigationLink("Go to ramdom number ", value: Int.random(in: 1...5))
            .navigationTitle("number \(1)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct NavigationStackExample: View {
    @State private var path = [Int]()
    @State private var students  = [
        StudentList(name: "John", age: 20),
        StudentList(name: "Jane", age: 22),
        StudentList(name: "Alice", age: 21)]
    @State private var pathGeneric = NavigationPath()
    var body: some View {
       
        Spacer()
        NavigationStack(path: $pathGeneric) {
            List(students, id:\.id) { student in
//                NavigationLink(student.name, value: StudentList)
                NavigationLink(destination: DetailView(number: student.age)) {
                                   Text("Select \(student.name)")
                               }
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Show 32") {
                    pathGeneric.append(32)
                }
                
                Button("append String 64") {
                    pathGeneric.append("64")
                }
            }
            .navigationDestination(for: StudentList.self) { student in
                
                DetailView(number: student.age)
            }
            
            
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected the number \(selection)")
//            }
//            .navigationDestination(for: String.self) { selection in
//                Text("You selected the string \(selection)")
//            }
        }
        
        
    }
}

#Preview {
    NavigationStackExample()
}

//            VStack {
//
//                Button("Show 32") {
//                    pathGeneric.append(32)
//                }
//
//                Button("append String 64") {
//                    pathGeneric.append("64")
//                }
//            }
//
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//            .navigationDestination(for: String.self) { selection in
//                Text("You selected the string \(selection)")
//            }
