// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let characters = try? JSONDecoder().decode(Characters.self, from: jsonData)

import Foundation

// MARK: - Characters
struct Characters: Codable {
    var characters: [Character]?
    var currentPage, pageSize, total: Int?
}

// MARK: - Character
struct Character: Codable {
    var id: Int?
    var name: String?
    var images: [String]?
    var debut: Debut?
    var family: Family?
    var jutsu, natureType: [String]?
    var personal: Personal?
    var rank: Rank?
    var tools: [String]?
    var voiceActors: VoiceActors?
    var uniqueTraits: [String]?
}

// MARK: - Debut
struct Debut: Codable {
    var manga, anime, novel, movie: String?
    var game, ova: String?
    var appearsIn: AppearsIn?
}

enum AppearsIn: String, Codable {
    case animeMangaGame = "Anime, Manga, Game"
    case animeMangaGameMovie = "Anime, Manga, Game, Movie"
    case animeMangaNovelGameMovie = "Anime, Manga, Novel, Game, Movie"
}

// MARK: - Family
struct Family: Codable {
    var father, mother, son, daughter: String?
    var wife, adoptiveSon, godfather, brother: String?
    var cloneSon, familyGrandmother, sister, nephew: String?
    var uncle, adoptiveMother, adoptiveSons, adoptiveBrother: String?
    var clone, godson, greatGrandfather, grandfather: String?
    var grandmother, cousin, geneticTemplateParent, cloneBrother: String?
    var pet, grandson, granddaughter, granduncle: String?
    var aunt, firstCousinOnceRemoved, host, niece: String?
    var lover, creator, geneticTemplate: String?

    enum CodingKeys: String, CodingKey {
        case father, mother, son, daughter, wife
        case adoptiveSon = "adoptive son"
        case godfather, brother
        case cloneSon = "clone/son"
        case familyGrandmother = "grandmother "
        case sister, nephew, uncle
        case adoptiveMother = "adoptive mother"
        case adoptiveSons = "adoptive sons"
        case adoptiveBrother = "adoptive brother"
        case clone, godson
        case greatGrandfather = "great-grandfather"
        case grandfather, grandmother, cousin
        case geneticTemplateParent = "genetic template/parent"
        case cloneBrother = "clone/brother"
        case pet = "pet "
        case grandson, granddaughter, granduncle, aunt
        case firstCousinOnceRemoved = "first cousin once removed"
        case host, niece, lover, creator
        case geneticTemplate = "genetic template"
    }
}

// MARK: - Personal
struct Personal: Codable {
    var birthdate: String?
    var sex: Sex?
    var age: Age?
    var height: Height?
    var weight: Weight?
    var bloodType: BloodType?
    var kekkeiGenkai, classification: Clan?
    var tailedBeast: String?
    var occupation: Clan?
    var affiliation: [String]?
    var team, clan: Clan?
    var titles: [String]?
    var status, kekkeiMōra: String?
    var partner: Clan?
    var species: String?
}

// MARK: - Age
struct Age: Codable {
    var partI, partII, academyGraduate, chuninPromotion: String?
    var blankPeriod, borutoMovie, borutoManga: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
        case academyGraduate = "Academy Graduate"
        case chuninPromotion = "Chunin Promotion"
        case blankPeriod = "Blank Period"
        case borutoMovie = "Boruto Movie"
        case borutoManga = "Boruto Manga"
    }
}

enum BloodType: String, Codable {
    case a = "A"
    case ab = "AB"
    case b = "B"
    case o = "O"
}

enum Clan: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Clan.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Clan"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Height
struct Height: Codable {
    var partI, partII, blankPeriod, gaiden: String?
    var borutoMovie, borutoManga: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
        case blankPeriod = "Blank Period"
        case gaiden = "Gaiden"
        case borutoMovie = "Boruto Movie"
        case borutoManga = "Boruto Manga"
    }
}

enum Sex: String, Codable {
    case female = "Female"
    case fileGenderVariousSVGVarious = "File:Gender Various.svg Various"
    case male = "Male"
}

// MARK: - Weight
struct Weight: Codable {
    var partI, partII: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case partII = "Part II"
    }
}

// MARK: - Rank
struct Rank: Codable {
    var ninjaRank: NinjaRank?
    var ninjaRegistration: String?
}

// MARK: - NinjaRank
struct NinjaRank: Codable {
    var partI, gaiden, blankPeriod, partII: String?

    enum CodingKeys: String, CodingKey {
        case partI = "Part I"
        case gaiden = "Gaiden"
        case blankPeriod = "Blank Period"
        case partII = "Part II"
    }
}

// MARK: - VoiceActors
struct VoiceActors: Codable {
    var japanese, english: Clan?
}
