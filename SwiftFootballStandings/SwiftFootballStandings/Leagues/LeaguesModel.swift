//
//  AvailableLeaguesModel.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import Foundation

struct LeaguesResponse: Decodable {
    let status: Bool?
    let data: [LeaguesModel]?
}

struct LeaguesModel: Decodable {
    let id: String?
    let name: String?
    let slug: String?
    let abbr: String?
    let logos: LogosModel?
}

struct LogosModel: Decodable  {
    let light: String?
    let dark: String?
}
