//
//  BGTabView.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI

struct BGTabView: View {
    @StateObject var appState = AppState()

    var body: some View {
        TabView(selection: createTabBinding()) {
            HomeView()
                .tag(BGViewTab.home)
                .tabItem {
                    Image(systemName: "house")

                    Text("Home")
                }
            QuotesView()
                .tag(BGViewTab.quotes)
                .tabItem {
                    Image(systemName: "text.quote")

                    Text("Quotes")
                }

            SavedView()
                .tag(BGViewTab.saved)
                .tabItem {
                    Image(systemName: "folder")

                    Text("Saved")
                }

            AboutView()
                .tag(BGViewTab.about)
                .tabItem {
                    Image(systemName: "info.circle")

                    Text("About")
                }
        }
        .accentColor(Color.customColor.primaryOrange)
        .environmentObject(appState)
    }

    private func createTabBinding() -> Binding<BGViewTab> {
        Binding<BGViewTab>(
            get: { appState.selectedTab },
            set: { selectedTab in
                if selectedTab == appState.selectedTab {
                    switch selectedTab {
                    case .home:
                        if !appState.homeNavigation.isEmpty {
                            withAnimation {
                                appState.homeNavigation = []
                            }
                        }
                    case .saved:
                        if !appState.savedNavigation.isEmpty {
                            withAnimation {
                                appState.savedNavigation = []
                            }
                        }
                    case .quotes:
                        if !appState.quotesNavigation.isEmpty {
                            withAnimation {
                                appState.quotesNavigation = []
                            }
                        }
                    case .about:
                        break
                    }
                }
                appState.selectedTab = selectedTab
            }
        )
    }
}

#Preview {
    BGTabView()
}

class AppState: ObservableObject {
    @Published var selectedTab: BGViewTab = .home
    @Published var homeNavigation: [HomeNavDest] = []
    @Published var savedNavigation: [SavedNavDest] = []
    @Published var quotesNavigation: [QuotesNavDest] = []
}

enum BGViewTab {
    case home
    case about
    case saved
    case quotes
}

enum HomeNavDest {
    case settings
}

enum SavedNavDest {
    case details2
}

enum QuotesNavDest {
    case details3
}
