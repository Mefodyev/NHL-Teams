//
//  DataFile.swift
//  NHL Teams
//
//  Created by Alexey Mefodyev on 11.07.2021.
//

import Foundation

let urlOfRoster = "https://statsapi.web.nhl.com/api/v1/teams/15/roster"

struct Person: Decodable {
    let id: Int
    let fullName: String
    let link: String
}

struct Position: Decodable {
    let code : String
    let name : String
    let type : String
    let abbreviation : String
}

struct Roster: Decodable {
    let person: Person
    let jerseyNumber: String
    let position: Position
}

struct FullRoster: Decodable {
    let copyright: String
    let roster: [Roster]
    let link: String
}
