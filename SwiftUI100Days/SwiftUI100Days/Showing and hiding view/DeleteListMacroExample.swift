//
//  DeleteListMacroExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 23/05/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id =  UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encode = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encode, forKey: "Items")
            }
        }
    }
    
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodeItems = try? JSONDecoder().decode([ExpenseItem].self, from: saveItems) {
                items = decodeItems
                return
            }
        }
        
        items = []
    }
}

struct DeleteListMacroExample: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
        
    var body: some View {

        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expenses", systemImage: "plus") {
//                    let expense = ExpenseItem(name: "Joe", type: "Test", amount: 5)
//                    expenses.items.append(expense)
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    DeleteListMacroExample()
}
