import SwiftUI

struct CheckoutView: View {
    let listName: String  // ✅ Accepts listName
    @Binding var cartItems: [CartItem]  // ✅ Uses Binding to reflect changes in CartView

    // Tax Rates for Different Categories
    let taxRates: [String: Double] = [
        "Food": 0.05,
        "Medication": 0.02,
        "Cleaning Products": 0.10,
        "Electronics": 0.15
    ]

    // Calculate total price before tax
    var subtotal: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }

    // Calculate tax for each category and total tax
    var totalTax: Double {
        cartItems.reduce(0) { total, item in
            let taxRate = taxRates[item.category] ?? 0.0
            return total + ((item.price * Double(item.quantity)) * taxRate)
        }
    }

    // Final total after tax
    var totalWithTax: Double {
        subtotal + totalTax
    }

    var body: some View {
        VStack {
            Text("Checkout - \(listName)")
                .font(.largeTitle)
                .bold()
                .padding()

            List {
                ForEach(cartItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text("Category: \(item.category)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Qty: \(item.quantity)")
                            Text("Price: $\(item.price * Double(item.quantity), specifier: "%.2f")")
                        }
                    }
                }
            }

            // 🚀 Tax Calculation Section
            VStack(spacing: 8) {
                Text("Subtotal: $\(subtotal, specifier: "%.2f")")
                    .font(.title2)
                    .bold()

                Text("Total Tax: $\(totalTax, specifier: "%.2f")")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.red)

                Text("Total with Tax: $\(totalWithTax, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}
