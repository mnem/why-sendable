//
//  IdeaList.swift
//  why-sendable
//
//  Created by David Wagner on 21/10/2022.
//

import Foundation

actor IdeaList {
    enum Error: Swift.Error {
        case unknowmIdea
    }
    
    private var ideas = [String: Votes]()
    
    func add(idea: String) {
        guard ideas.keys.contains(idea) == false else { return }
        ideas[idea] = Votes()
    }
    
    func vote(on idea: String) throws -> Votes {
        guard let votes = ideas[idea] else {
            throw Error.unknowmIdea
        }
        return votes
    }
}
