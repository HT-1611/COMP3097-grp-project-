import SwiftUI

struct HomeView: View {
    @State private var shoppingLists: [String] = []
    @State private var newListName: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Your Shopping Lists")
                    .font(.title)
                    .padding()

                HStack {
                    TextField("Enter list name", text: $newListName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: addShoppingList) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title)
                    }
                }

                List {
                    ForEach(shoppingLists, id: \.self) { list in
                        HStack {
                            NavigationLink(destination: ProductView(listName: list)) {
                                Text(list)
                                    .foregroundColor(.black)
                                    .padding()
                            }
                            Spacer()
                            Button(action: { removeShoppingList(list) }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle()) // Ensures button is clickable inside List
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Home")
        }
    }

    private func addShoppingList() {
        if !newListName.isEmpty {
            shoppingLists.append(newListName)
            newListName = ""
        }
    }

    private func removeShoppingList(_ list: String) {
        shoppingLists.removeAll { $0 == list }
    }
}
