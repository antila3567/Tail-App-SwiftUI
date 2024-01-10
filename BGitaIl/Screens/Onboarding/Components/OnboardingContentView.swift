//
//  OnboardingContentView.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI

struct OnboardingContentView: View {
    var onboardingModel: OnboardingModel
    @State private var isAnimated: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Image(onboardingModel.image)
                .resizable()
                .scaledToFit()
                .scaleEffect(isAnimated ? 0.7 : 0.3)

            Text(LocalizedStringKey(onboardingModel.title))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .font(.title2)
                .font(Font.system(size: 18.0, weight: .heavy))
                .padding(.horizontal, 16)

            Text(LocalizedStringKey(onboardingModel.detail))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .font(.title3)
                .padding(.horizontal, 16)
            Spacer()
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimated = true
            }
        }
    }
}

#Preview {
    OnboardingView()
}
