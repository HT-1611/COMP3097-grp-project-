//
//  launchScreenView.swift
//  SmartShopper
//
//  Created by Jayesh Patel on 2025-02-15.
//
import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Text("SmartShopper")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("Team Member Names")
                .font(.body)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}
