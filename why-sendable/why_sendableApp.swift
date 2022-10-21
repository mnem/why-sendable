//
//  why_sendableApp.swift
//  why-sendable
//
//  Created by David Wagner on 21/10/2022.
//

import SwiftUI

@main
struct why_sendableApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(ideas: IdeaList())
        }
    }
}
