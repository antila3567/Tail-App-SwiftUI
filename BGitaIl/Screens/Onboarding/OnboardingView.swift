//
//  OnboardingView.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var vm = OnboardingViewModel()

    @State private var currentIndex: Int = 0
    @State private var showPopup: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $currentIndex) {
                ForEach(0 ..< vm.onboardingData.count, id: \.self) { index in
                    OnboardingContentView(onboardingModel: vm.onboardingData[index])
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .allowsHitTesting(currentIndex < vm.onboardingData.count - 1)

            VStack {
                Spacer()
                    .padding()
                Spacer()
                    .frame(height: 60)
                if currentIndex < vm.onboardingData.count - 1 {
                    HStack {
                        Button {
                            currentIndex = vm.onboardingData.count - 1
                        } label: {
                            Text("Skip")
                                .foregroundColor(.gray)
                        }
                        PageControl(
                            currentPage: $currentIndex,
                            numberOfPages: vm.onboardingData.count
                        )
                        .padding(.horizontal, 40)
                        Button {
                            withAnimation(.easeInOut(duration: 0.8)) {
                                currentIndex += 1
                            }
                        } label: {
                            Text("Next")
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(20)
                } else {
                    HStack {
                        Button {
                            showPopup = true
                        } label: {
                            Text("Start")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                        }
                        .background(Color.orange)
                        .cornerRadius(4)
                        .padding(20)
                    }
                }

                Spacer()
                    .frame(height: 20)
            }
        }

        .overlay(
            Group {
                if showPopup {
                    Color.black.opacity(0.5)

                    VStack {
                        Spacer()
                        LanguagePopup(showPopup: $showPopup)
                        Spacer()
                    }
                }
            }
        )
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            showPopup = false
        }
    }
}

#Preview {
    OnboardingView()
}
