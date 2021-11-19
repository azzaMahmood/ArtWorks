//
//  Artist.swift
//  ArtWorks
//
//  Created by Azza on 17/11/2021.
//

import Foundation

// MARK: - Artist
struct Artist: Codable {
    let artistData: ArtistData?
    let info: artistInfo?
    let config: ArtistConfig?
    
    enum CodingKeys: String, CodingKey {
        case artistData = "data"
        case info
        case config
    }
}

// MARK: - ArtistConfig
struct ArtistConfig: Codable {
    let iiifURL: String?
    let websiteURL: String?

    enum CodingKeys: String, CodingKey {
        case iiifURL = "iiif_url"
        case websiteURL = "website_url"
    }
}

// MARK: - ArtistData
struct ArtistData: Codable {
    let id: Int?
    let apiModel: String?
    let apiLink: String?
    let title, sortTitle: String?
    let altTitles: [String]?
    let birthDate: Int?
    let birthPlace: String?
    let deathDate: Int?
    let deathPlace: String?
    let dataDescription: String?
    let isLicensingRestricted: String?
    let isArtist: Bool?
    let agentTypeTitle: String?
    let agentTypeID: Int?
    let artworkIDS: [Int]?
    let siteIDS: [Int]?
    let artistSuggestAutocompleteBoosted: ArtistSuggestAutocompleteBoosted?
    let artistSuggestAutocompleteAll: ArtistSuggestAutocompleteAll?
    let lastUpdatedSource: String?
    let lastUpdated: String?
    let timestamp: String?

    enum CodingKeys: String, CodingKey {
        case id
        case apiModel = "api_model"
        case apiLink = "api_link"
        case title
        case sortTitle = "sort_title"
        case altTitles = "alt_titles"
        case birthDate = "birth_date"
        case birthPlace = "birth_place"
        case deathDate = "death_date"
        case deathPlace = "death_place"
        case dataDescription = "description"
        case isLicensingRestricted = "is_licensing_restricted"
        case isArtist = "is_artist"
        case agentTypeTitle = "agent_type_title"
        case agentTypeID = "agent_type_id"
        case artworkIDS = "artwork_ids"
        case siteIDS = "site_ids"
        case artistSuggestAutocompleteBoosted = "suggest_autocomplete_boosted"
        case artistSuggestAutocompleteAll = "suggest_autocomplete_all"
        case lastUpdatedSource = "last_updated_source"
        case lastUpdated = "last_updated"
        case timestamp
    }
}

// MARK: - ArtistSuggestAutocompleteAll
struct ArtistSuggestAutocompleteAll: Codable {
    let input: [String]?
    let weight: Int?
    let artistContexts: ArtistContexts?
}

// MARK: - ArtistContexts
struct ArtistContexts: Codable {
    let groupings: [String]?
}

// MARK: - ArtistSuggestAutocompleteBoosted
struct ArtistSuggestAutocompleteBoosted: Codable {
    let input: [String]?
    let weight: Int?
}

// MARK: - artistInfo
struct artistInfo: Codable {
    let licenseText: String?
    let licenseLinks: [String]?
    let version: String?

    enum CodingKeys: String, CodingKey {
        case licenseText = "license_text"
        case licenseLinks = "license_links"
        case version
    }
}
