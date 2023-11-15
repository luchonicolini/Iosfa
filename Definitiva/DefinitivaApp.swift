//
//  DefinitivaApp.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 30/10/2023.
//

import SwiftUI

@main
struct DefinitivaApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
