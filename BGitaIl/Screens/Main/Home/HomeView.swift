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
    
    @ObservedObject private var vm = HomeViewModel(chaptersRepository: ChaptersRepository())

    var body: some View {
        NavigationView {
            VStack {
                Text("HomeView")
                    .font(.largeTitle)
                if vm.isFetching {
                    ProgressView()
                } else {
                    ScrollView {
                        ForEach(vm.chapters) { chapter in
                            Text(chapter.name)
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                    }
                    .refreshable {
                        vm.fetchChapters()
                    }
                }
            }
            .navigationTitle("Welcome back")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView(), label: {
                        Image(systemName: "gear")
                            .foregroundColor(.orange)
                    })
                }
            }
        }
        .onAppear {
                if vm.chapters.isEmpty {
                    vm.fetchChapters()
                }
            
        }

    }
}
