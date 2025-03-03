//
//  CartItem.swift
//  SmartShopper
//
//  Created by Jayesh Patel on 2025-02-16.
//
import Foundation  // ✅ Required for UUID()

struct CartItem: Identifiable {
    let id = UUID()  // ✅ Generates a unique ID
    let name: String
    let category: String
    var quantity: Int
    let price: Double
}
