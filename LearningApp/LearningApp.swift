//
//  LearningApp.swift
//  LearningApp
//
//  Created by Athanasios Chatzikonstantinou on 02.06.21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
