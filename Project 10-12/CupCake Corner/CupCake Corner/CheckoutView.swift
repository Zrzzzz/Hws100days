//
//  CheckoutView.swift
//  CupCake Corner
//
//  Created by Zr埋 on 2020/6/24.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                }
                
                Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                    .font(.title)
                
                Button("Place Order") {
                    self.placeOrder()
                }
                .padding()
            }
        }
        .alert(isPresented: $showingConfirmation, content: {
            Alert(title: Text("Thank u"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        })
        .navigationBarTitle("Check Out", displayMode: .inline)
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, res, err in
            if let data = data {
                if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                    self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
                    self.showingConfirmation = true
                }
            } else {
                print("No data in response: \(err?.localizedDescription ?? "Unknown error").")
                return
            }
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
