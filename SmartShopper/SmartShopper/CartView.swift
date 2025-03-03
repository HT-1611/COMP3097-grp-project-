import SwiftUI

struct CartView: View {
    let listName: String
    @Binding var cartItems: [CartItem]

    // Define tax rates for different categories
    let taxRates: [String: Double] = [
        "Food": 0.05,         // 5% tax
        "Medication": 0.02,   // 2% tax
        "Cleaning": 0.08      // 8% tax
    ]

    var body: some View {
        VStack {
            Text("Cart for \(listName)")
                .font(.title)
                .padding()

            List {
                ForEach(cartItems.indices, id: \.self) { index in
                    HStack {
                        Text(cartItems[index].name)
                        Spacer()
                        Text("$\(cartItems[index].price, specifier: "%.2f")")
                        Spacer()
                        Button(action: { increaseQuantity(index: index) }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                        }
                        Text("\(cartItems[index].quantity)")
                        Button(action: { decreaseQuantity(index: index) }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .padding()

            // Display total price with tax
            VStack {
                Text("Total Price: $\(totalPrice(), specifier: "%.2f")")
                    .font(.headline)
                    .padding()

                Text("Tax Amount: $\(calculateTax(), specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("Final Total: $\(totalPrice() + calculateTax(), specifier: "%.2f")")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 5)
            }
            .padding()
        }
    }

    private func increaseQuantity(index: Int) {
        cartItems[index].quantity += 1
    }

    private func decreaseQuantity(index: Int) {
        if cartItems[index].quantity > 1 {
            cartItems[index].quantity -= 1
        }
    }

    private func totalPrice() -> Double {
        return cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }

    private func calculateTax() -> Double {
        return cartItems.reduce(0) { total, item in
            let taxRate = taxRates[item.category] ?? 0.05  // Default tax is 5% if category not found
            return total + (item.price * Double(item.quantity) * taxRate)
        }
    }
}
