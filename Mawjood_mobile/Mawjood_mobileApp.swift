//
//  Mawjood_mobileApp.swift
//  Mawjood_mobile
//
//  Created by Omar Alibrahim on 24/07/2021.
//

import SwiftUI

@main
struct Mawjood_mobileApp: App {
    var body: some Scene {
        WindowGroup {
            Router()
                .environmentObject(NetworkEnv())
        }
    }
}
