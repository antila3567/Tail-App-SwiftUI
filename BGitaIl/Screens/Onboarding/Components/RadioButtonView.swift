//
//  RadioButtonView.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI

struct RadioButtonView: View {
    var currentLanguage: SupportedLanguage
    var text: String

    @Binding var selectedLanguage: SupportedLanguage

    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        Button {
            languageManager.setLocale(language: currentLanguage)
            selectedLanguage = currentLanguage
        } label: {
            HStack(spacing: 20) {
                Image(systemName: selectedLanguage == currentLanguage ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.orange)

                Text(text)
                    .foregroundColor(.black)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
}
