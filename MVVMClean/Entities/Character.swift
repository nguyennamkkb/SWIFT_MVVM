//
//  Character.swift
//  MVVMClean
//
//  Created by Mac mini on 15/07/2024.
//

import Foundation

// MARK: - Characters
struct Characters: Codable {
    let characters: [Character]?
    let currentPage, pageSize, total: Int?
}

// MARK: - Character
struct Character: Codable {
    let id: Int?
    let name: String?
    let images: [String]?
    let debut: Debut?
    let family: Family?
    let jutsu, natureType: [String]?
    let personal: Personal?
    let rank: Rank?
    let tools: [String]?
    let voiceActors: VoiceActors?
}

// MARK: - Debut
struct Debut: Codable {
    let manga, anime, novel, movie: String?
    let game, ova, appearsIn: String?
}

// MARK: - Family
struct Family: Codable {
    let father, mother, son, daughter: String?
    let wife, adoptiveSon, godfather: String?

    enum CodingKeys: String, CodingKey {
        case father, mother, son, daughter, wife
        case adoptiveSon = "adoptive son"
        case godfather
    }
}

// MARK: - Personal
struct Personal: Codable {
    let birthdate, sex: String?
    let age: Age?
    let height: Height?
    let weight: Weight?
    let bloodType: String?
    let kekkeiGenkai, classification: [String]?
    let tailedBeast: String?
    let occupation, affiliation, team: [String]?
    let clan: String?
    let titles: [String]?
}

// MARK: - Age
struct Age: Codable {
    let partI, partII, academyGraduate: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
        case academyGraduate = "Academy Graduate"
    }
}

// MARK: - Height
struct Height: Codable {
    let partI, partII, blankPeriod: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
        case blankPeriod = "Blank Period"
    }
}

// MARK: - Weight
struct Weight: Codable {
    let partI, partII: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
    }
}

// MARK: - Rank
struct Rank: Codable {
    let ninjaRank: NinjaRank?
    let ninjaRegistration: String?
}

// MARK: - NinjaRank
struct NinjaRank: Codable {
    let partI, gaiden: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case gaiden = "Gaiden"
    }
}

// MARK: - VoiceActors
struct VoiceActors: Codable {
    let japanese, english: [String]?
}
