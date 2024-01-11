//
//  AboutView.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    Image("onboard-image-1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(Color.orange)
                    Text("About Tail")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                }

                Text("A practical guide to life, leading you towards ultimate joy.")
                    .foregroundColor(Color.customColor.primaryOrange)
                    .padding([.top, .horizontal], 20)
                    .multilineTextAlignment(.center)
                    .font(.custom("HelveticaNeue-Bold", size: 23))

                Text(LocalizedStringKey("about-description"))
                    .padding(20)
                    .font(.title3)
            }
        }
    }
}

#Preview {
    AboutView()
}
