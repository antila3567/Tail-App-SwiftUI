//
//  LanguagePopup.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI

enum SupportedLanguage: String {
    case english
    case ukrainian
}

struct LanguagePopup: View {
    @Binding var showPopup: Bool

    @AppStorage("isFirstTime") var isFirstTime: Bool = true

    @State private var selectedLanguage = SupportedLanguage.english

    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack {
            Image("abc")
                .resizable()
                .frame(width: 120, height: 120)

            Text("Choose your preferred language")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.vertical, 30)

            Text("(Don't worry you can change it anytime you want)")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.7))

            HStack(spacing: 20) {
                RadioButtonView(
                    currentLanguage: .english,
                    text: "English",
                    selectedLanguage: $selectedLanguage
                )
                .padding(.leading, 20)
                RadioButtonView(
                    currentLanguage: .ukrainian,
                    text: "Ukrainian",
                    selectedLanguage: $selectedLanguage
                )
            }
            .padding(.top, 40)

            Button {
                showPopup = false
                isFirstTime = false
            } label: {
                Text("Enjoy this trip")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
            }
            .background(Color.orange)
            .cornerRadius(8)
            .padding(.horizontal, 40)
            .padding(.top, 40)
        }
        .onAppear {
            if languageManager.locale.identifier.contains("uk") {
                selectedLanguage = .ukrainian
            } else {
                selectedLanguage = .english
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding(15)
    }
}

#Preview {
    OnboardingView()
}
