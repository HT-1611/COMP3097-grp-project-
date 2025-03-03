import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Text("🛍️ SmartShopper")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Team Members:\n- Harshil Padsala - 101410137\n- Trisha Patel - 101412123\n- Smit Kothia - 101395481")
                .multilineTextAlignment(.center)
                .padding()

            NavigationLink(destination: HomeView()) {
                Text("Continue")
                    .font(.title2)
                    .padding()
                    .frame(width: 200)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
}

