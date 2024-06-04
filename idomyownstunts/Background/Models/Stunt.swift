//
//  Stunt.swift
//  idomyownstunts
//
//  Created by Jed Kutai on 6/4/24.
//

import Foundation

struct Stunt: Identifiable, Hashable, Codable {
    var id: String = UUID().uuidString
    
    var title: String
    var description: String
    var tally: Int = 0 // max of 37,000
    
    var lastUpdated: Date = Date.now
    var timestamp: Date = Date.now
}

extension Stunt {
    static var MOCK_STUNTS: [Stunt] = [
        .init(title: "Run", description: "Go for a run.", tally: 2400),
        .init(title: "Study", description: "Review my notes", tally: 23),
        .init(title: "Drink Water", description: "Drink water every morning", tally: 105),
        .init(title: "Run2", description: "Go for a run.", tally: 2400),
        .init(title: "Study2", description: "Review my notes", tally: 23),
        .init(title: "Drink Water2", description: "Drink water every morning", tally: 105),
        .init(title: "Run3", description: "Go for a run.", tally: 2400),
        .init(title: "Study3", description: "Review my notes", tally: 23),
        .init(title: "Drink Water3", description: "Drink water every morning", tally: 105),
        .init(title: "Run4", description: "Go for a run.", tally: 2400),
        .init(title: "Study4", description: "Review my notes", tally: 23),
        .init(title: "Drink Water4", description: "Drink water every morning", tally: 105),
        .init(title: "Run5", description: "Go for a run.", tally: 2400),
        .init(title: "Study5", description: "Review my notes", tally: 23),
        .init(title: "Drink Water5", description: "Drink water every morning", tally: 105),
    ]
}
