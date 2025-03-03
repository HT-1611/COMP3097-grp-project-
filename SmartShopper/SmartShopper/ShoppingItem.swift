//
//  ShoppingItem.swift
//  SmartShopper
//
//  Created by Jayesh Patel on 2025-02-15.
//

import Foundation

struct ShoppingItem: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
}
