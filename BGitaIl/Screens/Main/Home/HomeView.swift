//
//  HomeView.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @State private var isActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("HomeView")
                    .font(.largeTitle)

                NavigationLink(destination: HomeDetails(), isActive: $isActive) {
                    Text("Open details")
                }
            }
        }
        .onAppear {
            if appState.homeNavigation.contains(.details) {
                isActive = true
                appState.homeNavigation = []
            }
        }
    }
}
