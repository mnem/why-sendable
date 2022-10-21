//
//  Votes.swift
//  why-sendable
//
//  Created by David Wagner on 21/10/2022.
//

import Foundation

final class Votes: @unchecked Sendable {
    private var lock = NSLock()
    private(set) var total = 0
    
    func upVote() {
        lock.lock()
        defer { lock.unlock() }
        total += 1
    }
    
    func downVote() {
        lock.lock()
        defer { lock.unlock() }
        total -= 1
    }
}
