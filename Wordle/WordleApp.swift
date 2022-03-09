//
//  WordleApp.swift
//  Wordle
//
//  Created by Preston Grisham on 3/9/22.
//

import SwiftUI

@main
struct WordleApp: App {
    @StateObject var dm = WordleDataModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
