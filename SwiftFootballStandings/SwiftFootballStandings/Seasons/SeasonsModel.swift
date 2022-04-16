//
//  SeasonsModel.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import Foundation

struct SeasonsResponse: Decodable {
    let status: Bool?
    let data: SeasonsModel?
}

struct SeasonsModel: Decodable {
    let desc: String?
    let seasons: [DetailSeason]?
}

struct DetailSeason: Decodable {
    let year: Int?
    let startDate: String?
    let endDate: String?
    let displayName: String?
    let types: [TypeDetailSeason]?
}

struct TypeDetailSeason: Decodable {
    let id: String?
    let name: String?
    let abbreviation: String?
    let startDate: String?
    let endDate: String?
    let hasStandings: Bool?
}
