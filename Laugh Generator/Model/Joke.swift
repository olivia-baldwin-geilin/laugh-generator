//
//  File.swift
//  Laugh Generator
//
//  Created by Olivia Baldwin-Geilin on 3/10/23.
//

import Foundation

struct JokeSummary: Codable {
    let results: [Joke]?
}

struct Joke: Hashable, Codable, Identifiable {
    var id: String
    var body: String
    var rating: Int
}

struct Response: Codable {
    let message: String?
}

var test_joke = Joke(id: "01", body: "This is a test joke", rating: 1)
var test_joke_list = [test_joke]

func test_update(rating: Int) {
    
}
