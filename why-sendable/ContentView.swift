//
//  ContentView.swift
//  why-sendable
//
//  Created by David Wagner on 21/10/2022.
//

import SwiftUI

struct ContentView: View {
    let ideas: IdeaList
    @State private var idea: String = "🐸's are cute"
    @State private var numVotes = 0
    @State private var processing = false
    
    var body: some View {
        VStack {
            TextField(
                "Idea",
                text: $idea
            )
            .multilineTextAlignment(.center)
            .padding()
            Button("Vote!") {
                processing = true
                Task {
                    await ideas.add(idea: idea)
                    numVotes = await withTaskGroup(of: Int.self, body: { group in
                        guard let votes = try? await ideas.vote(on: idea) else {
                            return Int.min
                        }
                        for _ in 0..<1_000 {
                            group.addTask(priority: .high) {
                                votes.upVote()
                                return 0
                            }
                        }
                        for _ in 0..<1_000 {
                            group.addTask(priority: .low) {
                                votes.downVote()
                                return 0
                            }
                        }
                        await group.waitForAll()
                        processing = false
                        return votes.total
                    })
                }
            }
            .disabled(processing == true)
            Spacer()
            Text("Idea votes: \(numVotes)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ideas: IdeaList())
    }
}
