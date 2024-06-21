//
//  HierachicalExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 30/05/24.
//

import SwiftUI

struct HierachicalExample: View {
    

    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
    ]
   
    
    var body: some View {
        Button("Decode Json!") {
            let input = """
                {
                    "name": "Taylor Swift",
                    "address": {
                        "street": "555, Taylor Swift Avenue",
                        "city": "Nashville"
                    }
                }
                """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(UserHierachical.self, from: data) {
                print(user.address.street)
            }
        }
        
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach (0..<12) {
                    Text("Item \($0)")
                }
            }
        }
        Spacer()
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach (0..<100) {
                    Text("Item \($0)")
                }
            }
        }
      
        
    }
}

#Preview {
    HierachicalExample()
}

struct UserHierachical: Codable {
    let name: String
    let address: AddressHierachical
}

struct AddressHierachical: Codable {
    let street: String
    let city: String
}
