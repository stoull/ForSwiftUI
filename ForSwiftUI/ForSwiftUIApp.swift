//
//  ForSwiftUIApp.swift
//  ForSwiftUI
//
//  Created by Kevin on 2023/7/19.
//

import SwiftUI

@main
struct ForSwiftUIApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
