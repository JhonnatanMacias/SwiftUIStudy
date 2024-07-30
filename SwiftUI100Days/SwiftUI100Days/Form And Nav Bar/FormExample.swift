//
//  FormExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 23/01/24.
//

import SwiftUI

struct FormExample: View {
    
    @State private var userName = ""
    @State private var email = ""
    
    var disableForm: Bool {
        userName.count < 5 || email.count < 5
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                Section {
                    TextField("UserName", text: $userName)
                    TextField("Email", text: $email)
                }
                
                Section {
                    Button("Create account") {
                        print("Creating account...")
                    }
                }
                .disabled(disableForm)
                
                Section {
                    Text("Form And Nav Bar")
                }
                
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World 10!")
                }
            }
            .navigationTitle("Form and Navigation")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    FormExample()
}
