//
//  SettingsView.swift
//  SmartShopper
//
//  Created by Jayesh Patel on 2025-02-15.
//

import SwiftUI

struct SettingsView: View {
    @State private var taxRates: [String: Double] = [
        "Food": 5.0,
        "Medication": 0.0,
        "Cleaning Products": 13.0
    ]
    
    var body: some View {
        Form {
            Section(header: Text("🧾 Tax Rates").font(.headline)) {
                ForEach(taxRates.keys.sorted(), id: \.self) { category in
                    HStack {
                        Text(category)
                            .font(.body)
                        Spacer()
                        Slider(value: Binding(
                            get: { self.taxRates[category] ?? 0 },
                            set: { self.taxRates[category] = $0 }
                        ), in: 0...20, step: 0.5)
                        Text("\(taxRates[category]!, specifier: "%.1f")%")
                            .font(.body)
                    }
                }
            }
        }
        .navigationTitle("⚙️ Settings")
    }
}
