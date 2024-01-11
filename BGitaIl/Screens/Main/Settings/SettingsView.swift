//
//  SettingsView.swift
//  BGitaIl
//
//  Created by Иван Легенький on 11.01.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @EnvironmentObject var appState: AppState
    @Environment(\.presentationMode) private var presentationMode

    @State private var selectedLanguage: SupportedLanguage = .english

    var body: some View {
        VStack {
            ForEach(SupportedLanguage.allCases, id: \.self) { language in
                Button {
                    selectedLanguage = language
                } label: {
                    HStack {
                        Text(language.rawValue)
                            .foregroundColor(.black)
                            .padding()

                        Spacer()

                        if language == selectedLanguage {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                                .foregroundColor(Color.customColor.primaryOrange)
                        }
                    }
                }
            }
            Spacer()

            Button {
                languageManager.setLocale(language: selectedLanguage)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save settings")
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.customColor.primaryOrange)
            .padding()
            .cornerRadius(8)
        }
        .onAppear {
            if languageManager.locale.identifier.contains("uk") {
                selectedLanguage = .ukrainian
            } else {
                selectedLanguage = .english
            }
        }
    }
}

#Preview {
    SettingsView()
}
