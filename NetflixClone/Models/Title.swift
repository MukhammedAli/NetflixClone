//
//  Movie.swift
//  NetflixClone
//
//  Created by  Mukhammed Ali Khamzayev on 08.02.2023.
//

import Foundation


struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
    
    enum CodingKeys: String,CodingKey {
        case id = "id"
        case media_type = "media_type"
        case original_name = "original_name"
        case original_title = "original_title"
        case poster_path = "poster_path"
        case overview = "overview"
        case vote_count = "vote_count"
        case release_date = "release_date"
        case vote_average = "vote_average"
    }
}


