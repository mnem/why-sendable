//
//  Votes.swift
//  why-sendable
//
//  Created by David Wagner on 21/10/2022.
//

import Foundation

final class Votes {
    private(set) var total = 0
    
    func upVote() {
        total += 1
    }
    
    func downVote() {
        total -= 1
    }
}
