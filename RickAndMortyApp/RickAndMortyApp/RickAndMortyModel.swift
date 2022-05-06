//
//  RickAndMortyModel.swift
//  RickAndMortyApp
//
//  Created by Pınar Macit on 1.05.2022.
//

import Foundation

// MARK: - Welcome
struct RickandMorty: Codable {
    let info: CharacterInfo
    let results: [Result]
}

// MARK: - Info
struct CharacterInfo: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
