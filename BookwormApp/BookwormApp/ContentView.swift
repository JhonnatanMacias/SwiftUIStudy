//
//  ContentView.swift
//  BookwormApp
//
//  Created by Jhonnatan Macias on 1/08/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
//    @Query var books: [Book]
//    @Query(sort: \Book.rating, order: .reverse) var books: [Book]
//    @Query(sort: [SortDescriptor(\Book.title)]) var books: [Book]
//    @Query(sort: [SortDescriptor(\Book.title, order: .reverse)]) var books: [Book]
    @State private var showingAddScreen = false
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
//    @Query(sort: \Book.title) var books: [Book]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
//                NavigationLink(value: book) se usa con Nav..Destination
                    NavigationLink(destination: DetailView(book: book)) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    } // body
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let book = books[offset]

            // delete it from the context
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}

/*

NavigationStack {
    List(books) { book in
        NavigationLink(destination: DetailView(book: book)) {
            HStack {
                EmojiRatingView(rating: book.rating)
                    .font(.largeTitle)
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text(book.author)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
    .navigationTitle("Bookworm")
    .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
            Button("Add Book", systemImage: "plus") {
                showingAddScreen.toggle()
            }
        }
    }
    .sheet(isPresented: $showingAddScreen) {
        AddBookView()
    }
}
*/
