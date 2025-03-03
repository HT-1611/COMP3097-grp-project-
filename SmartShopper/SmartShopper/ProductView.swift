import SwiftUI

struct ProductView: View {
    let listName: String

    @State private var productName: String = ""
    @State private var productPrice: String = ""
    @State private var selectedCategory: String = "Food"  // ✅ Default category selection
    @State private var cartItems: [CartItem] = []

    let categories = ["Food", "Medication", "Cleaning Products", "Electronics"]

    var body: some View {
        VStack {
            Text("Products for \(listName)")
                .font(.largeTitle)
                .bold()
                .padding()

            // Product Name & Price Input Fields
            HStack {
                TextField("Product Name", text: $productName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Price", text: $productPrice)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }

            // Category Picker
            Picker("Select Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            // Add Product Button
            Button(action: addProduct) {
                HStack {
                    Image(systemName: "cart.badge.plus")
                    Text("Add Product")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()

            // List of Products in Cart
            List {
                ForEach(cartItems) { item in
                    HStack {
                        Text("\(item.name) (\(item.category))")
                            .font(.headline)
                        Spacer()
                        Text("$\(item.price, specifier: "%.2f")")
                            .bold()
                        Spacer()

                        // Decrease Quantity Button
                        Button(action: { decreaseQuantity(item: item) }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                        }

                        Text("\(item.quantity)")
                            .font(.headline)

                        // Increase Quantity Button
                        Button(action: { increaseQuantity(item: item) }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                }
            }

            // Go to Cart Button
            NavigationLink(destination: CartView(listName: listName, cartItems: $cartItems)) {
                HStack {
                    Image(systemName: "cart")
                    Text("Go to Cart")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }

    // ✅ Add Product to Cart
    private func addProduct() {
        guard let price = Double(productPrice), !productName.isEmpty else { return }
        let newProduct = CartItem(
            name: productName,
            category: selectedCategory,  // ✅ Fix: Category must come before quantity
            quantity: 1,
            price: price
        )
        cartItems.append(newProduct)
        productName = ""
        productPrice = ""
    }

    // ✅ Increase Quantity in Cart
    private func increaseQuantity(item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity += 1
        }
    }

    // ✅ Decrease Quantity in Cart (Minimum: 1)
    private func decreaseQuantity(item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }), cartItems[index].quantity > 1 {
            cartItems[index].quantity -= 1
        }
    }
}
