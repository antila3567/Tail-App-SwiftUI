//
//  RootView.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import BGUtility
import SwiftUI

struct RootView: View {
    @ObservedObject var vm = RootViewModel()
    var count = "1203"
    var body: some View {
        NavigationView {
            Text(LocalizedStringKey("Greeting \(count)"))
                .onAppear {
                    vm.onApper()
                }
        }
    }
}

#Preview {
    RootView()
}
