//
//  SelectedSeasonModel.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import Foundation


struct SelectSeasonsResponse: Decodable {
    let status: Bool?
    let data: SelectSeasonsModel?
}

struct SelectSeasonsModel: Decodable {
    let abbreviation: String?
    let seasonDisplay: String?
    let standings: [Standing]?
}

struct Standing: Decodable {
    let team: Team?
    let stats: [Stat]?
    let note: Note?
}

struct Note: Decodable {

    let description: String?


}

struct Team: Decodable {
    let shortDisplayName: String? 
    let logos: [Logo]?
}

// MARK: - Logo
struct Logo: Decodable {
    let href: String?
}

// MARK: - Stat
struct Stat: Decodable {
    let name: String?
    let displayValue: String?
}


