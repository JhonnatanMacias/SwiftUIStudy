//
//  ContentView.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 23/01/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    //    @Environment(\.managedObjectContext) private var viewContext

    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //        animation: .default)
    //    private var items: FetchedResults<Item>
    
    let options: [ClassType] = [.image, .animation, .hierachical, .navigation, .imagesResize, .codable, .sheet, .stateWithClass, .form_And_NavBar, .state, .viewLoop, .stacks, .gradient, .guessTheFlag, .customModifier,
                                .customContainer, .picker, .coreML]

    var body: some View {
            NavigationView {
                List(options, id: \.self) { option in
                    NavigationLink(destination: OptionDetailView(optionStr: option.rawValue, option: option)) {
                        Text(option.rawValue.capitalized)
                    }
                }
                .navigationTitle("Swift UI ")
            }
        }
        
    }


#Preview {
    ContentView()
/*    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)*/
}


struct OptionDetailView: View {
    var optionStr: String
    var option: ClassType

    var body: some View {
        VStack {
            switch option {
            case .coreML:
                CoreMLExample()
            case .animation:
                AnimationExample()
            case .hierachical:
                HierachicalExample()
            case .sheet:
                SheetExample()
            case .navigation:
                NavigationExample()
            case .image:
                ImageExample()
            case .stateWithClass:
                StateWithClass()
            case .imagesResize:
                ImagesExample()
            case .form_And_NavBar:
                FormExample()
            case .state:
                StateExample()
            case .viewLoop:
                ViewLoopExample()
            case .stacks:
                StacksExample()
            case .gradient:
                GradientsExample()
            case .guessTheFlag:
                GuessTheFlagExample()
            case .customModifier:
                CustomModifierExample()
            case .customContainer:
                CustomContainerExample()
            case .picker:
                PickerExample()
            case .codable:
               CodableAstronautExample()
            }
//            Text("Selected Option: \(optionStr)")
//                .font(.title)
//                .padding()
        }
        .navigationTitle(optionStr)
    }
}
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }


//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
