//
//  DetailView.swift
//  BookwormApp
//
//  Created by Jhonnatan Macias on 10/09/24.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4)

        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}


/*
https://www.hackingwithswift.com/books/ios-swiftui/introduction-to-swiftdata-and-swiftui
 but first we need a new property to access the model context that was created earlier.
 @Environment(\.modelContext) var modelContext
 
 
 https://www.hackingwithswift.com/quick-start/swiftdata/whats-the-difference-between-modelcontainer-modelcontext-and-modelconfiguration
 
 
 SwiftData has three important classes with similar names but very different functionality:

 ModelContainer is responsible for creating and managing the actual database file used for all SwiftData’s storage needs.
 ModelContext has the job of tracking all objects that have been created, modified, and deleted in memory, so they can all be saved to the model container at some later point.
 ModelConfiguration determines how and where data is stored, including which CloudKit container to use if any, and whether saving should be enabled or not. This configuration is provided to your model container to determine how it behaves.
 
 Because all SwiftData apps must have at least one model container, you’ll usually have code like this somewhere in your main App struct:

 .modelContainer(for: YourModel.self)
 That also creates a model context for us called the main context, and it places that context into SwiftUI’s environment for us to use. This main context always runs on Swift’s main actor, so it’s safe to use from our user interface.

 Important: Model containers can be passed freely around your program, but model contexts must stay on the thread that created them.

 We can read this back out from the environment using SwiftUI’s @Environment property wrapper by adding code like this to any view where we need the context:

 @Environment(\.modelContext) var modelContext
 This same context is automatically used by @Query in your SwiftUI views.
 
 
 CUSTOM CONTAINER with CONFIGURATION
 
 https://www.hackingwithswift.com/quick-start/swiftdata/how-to-configure-a-custom-modelcontainer-using-modelconfiguration
*/
