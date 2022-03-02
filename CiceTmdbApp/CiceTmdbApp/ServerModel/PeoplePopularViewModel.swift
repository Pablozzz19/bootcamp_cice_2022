//
//  PeoplePopularViewModel.swift
//  CiceTmdbApp
//
//  Created by cice on 02/03/2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let peoplePopularServerModel = try? newJSONDecoder().decode(PeoplePopularServerModel.self, from: jsonData)

import Foundation

// MARK: - PeoplePopularServerModel
struct PeoplePopularServerModel: Codable {
    let page: Int?
    let results: [ResultModel]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultModel: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownFor: [KnownFor]?
    let knownForDepartment: KnownForDepartment?
    let name: String?
    let popularity: Double?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case knownFor = "known_for"
        case knownForDepartment = "known_for_department"
        case name = "name"
        case popularity = "popularity"
        case profilePath = "profile_path"
    }
}

// MARK: - KnownFor
struct KnownFor: Codable {
    let adult: Bool?
    let backdropPath: String?
    let firstAirDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let mediaType: MediaType?
    let name: String?
    let originCountry: [OriginCountry]?
    let originalLanguage: OriginalLanguage?
    let originalName: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?
    let originalTitle: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id = "id"
        case mediaType = "media_type"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginCountry: String, Codable {
    case ca = "CA"
    case jp = "JP"
    case us = "US"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
}

enum KnownForDepartment: String, Codable {
    case acting = "Acting"
    case writing = "Writing"
}

