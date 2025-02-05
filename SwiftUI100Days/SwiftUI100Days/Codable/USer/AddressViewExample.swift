//
//  AddressViewExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 17/07/24.
//

import SwiftUI

struct AddressViewExample: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }

            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == true)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressViewExample(order: Order())
}

/*
Previously you've seen how Xcode lets us bind to local @State properties just fine, even when those properties are classes using the @Observable macros. That works because the @State property wrapper automatically creates two-way bindings for us, which we access through the $ syntax – $name, $age, etc.
 
 We haven't used @State in AddressView because we aren't creating the class here, we're just receiving it from elsewhere. This means SwiftUI doesn't have access to the same two-way bindings we'd normally use, which is a problem.
 
 **
 Now, we know this class uses the @Observable macro, which means SwiftUI is able to watch this data for changes. So, what the @Bindable property wrapper does is create the missing bindings for us – it produces two-way bindings that are able to work with the @Observable macro, without having to use @State to create local data. It's perfect here, and you'll use it a lot in your future projects.
 
 https://www.hackingwithswift.com/books/ios-swiftui/checking-for-a-valid-address
*/
