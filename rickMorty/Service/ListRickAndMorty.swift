//
//  ListRickAndMorty.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/27/23.
//

import Foundation

// MARK: - RickAndMorty
struct RickAndMorty: Codable {
    var info: Info?
    var results: [Result]?
}

// MARK: - Info
struct Info: Codable {
    var count, pages: Int?
    var next: String?
}

// MARK: - Result
struct Result: Codable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin, location: Location?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

// MARK: - Location
struct Location: Codable {
    var name: String?
    var url: String?
}
