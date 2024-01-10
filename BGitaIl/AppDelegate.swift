//
//  AppDelegate.swift
//  BGitaIl
//
//  Created by Иван Легенький on 10.01.2024.
//

import Firebase
import Foundation

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}
