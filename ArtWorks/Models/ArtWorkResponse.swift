//
//  ArtWorkList.swift
//  ArtWorks
//
//  Created by Azza on 17/11/2021.
//

import Foundation

// MARK: - ArtWorkResponse
struct ArtWorkResponse: Codable {
    let pagination: Pagination?
    let artWorkList: [ArtWorkItem]?
    let artWorkInfo: ArtWorkInfo?
    let config: Config?
    
    enum CodingKeys: String, CodingKey {
        case pagination
        case artWorkList = "data"
        case artWorkInfo = "info"
        case config
    }
}

// MARK: - Config
struct Config: Codable {
    let iiifURL: String?
    let websiteURL: String?

    enum CodingKeys: String, CodingKey {
        case iiifURL = "iiif_url"
        case websiteURL = "website_url"
    }
}

// MARK: - ArtWorkItem
struct ArtWorkItem: Codable {
    let id: Int?
    let apiModel: APIModel?
    let apiLink: String?
    let isBoosted: Bool?
    let title: String?
    let altTitles: [String]?
    let thumbnail: Thumbnail?
    let mainReferenceNumber: String?
    let hasNotBeenViewedMuch: Bool?
    let boostRank: Int?
    let dateStart, dateEnd: Int?
    let dateDisplay: String?
    let dateQualifierTitle: String?
    let dateQualifierID: Int?
    let artistDisplay: String?
    let placeOfOrigin: String?
    let dimensions: String?
    let mediumDisplay: String?
    let inscriptions: String?
    let creditLine: String?
    let publicationHistory: String?
    let exhibitionHistory: String?
    let provenanceText: String?
    let publishingVerificationLevel: String?
    let internalDepartmentID: Int?
    let fiscalYear: Int?
    let fiscalYearDeaccession: String?
    let isPublicDomain: Bool?
    let isZoomable: Bool?
    let maxZoomWindowSize: Int?
    let copyrightNotice: String?
    let hasMultimediaResources: Bool?
    let hasEducationalResources: Bool?
    let colorfulness: Double?
    let color: Color?
    let latitude: Double?
    let longitude: Double?
    let latlon: String?
    let isOnView: Bool?
    let onLoanDisplay: String?
    let galleryTitle: String?
    let galleryID: Int?
    let artworkTypeTitle: String?
    let artworkTypeID: Int?
    let departmentTitle, departmentID: String?
    let artistID: Int?
    let artistTitle: String?
    let altArtistIDS: [Int]?
    let artistIDS: [Int]?
    let artistTitles, categoryIDS, categoryTitles: [String]?
    let artworkCatalogueIDS: [Int?]?
    let termTitles: [String]?
    let styleID, styleTitle: String?
    let altStyleIDS, styleIDS, styleTitles: [String]?
    let classificationID, classificationTitle: String?
    let altClassificationIDS, classificationIDS, classificationTitles: [String]?
    let subjectID: String?
    let altSubjectIDS, subjectIDS, subjectTitles: [String]?
    let materialID: String?
    let altMaterialIDS, materialIDS, materialTitles: [String]?
    let techniqueID: String?
    let altTechniqueIDS, techniqueIDS, techniqueTitles, themeTitles: [String]?
    let imageID: String?
    let altImageIDS: [String]?
    let documentIDS: [String]?
    let soundIDS: [String]?
    let videoIDS: [String]?
    let textIDS: [String]?
    let sectionIDS: [String]?
    let sectionTitles: [String]?
    let siteIDS: [Int]?
    let suggestAutocompleteAll: [SuggestAutocompleteAll]?
    let lastUpdatedSource: String?
    let lastUpdated: String?
    let timestamp: String?
    let suggestAutocompleteBoosted: String?

    enum CodingKeys: String, CodingKey {
        case id
        case apiModel = "api_model"
        case apiLink = "api_link"
        case isBoosted = "is_boosted"
        case title
        case altTitles = "alt_titles"
        case thumbnail
        case mainReferenceNumber = "main_reference_number"
        case hasNotBeenViewedMuch = "has_not_been_viewed_much"
        case boostRank = "boost_rank"
        case dateStart = "date_start"
        case dateEnd = "date_end"
        case dateDisplay = "date_display"
        case dateQualifierTitle = "date_qualifier_title"
        case dateQualifierID = "date_qualifier_id"
        case artistDisplay = "artist_display"
        case placeOfOrigin = "place_of_origin"
        case dimensions
        case mediumDisplay = "medium_display"
        case inscriptions
        case creditLine = "credit_line"
        case publicationHistory = "publication_history"
        case exhibitionHistory = "exhibition_history"
        case provenanceText = "provenance_text"
        case publishingVerificationLevel = "publishing_verification_level"
        case internalDepartmentID = "internal_department_id"
        case fiscalYear = "fiscal_year"
        case fiscalYearDeaccession = "fiscal_year_deaccession"
        case isPublicDomain = "is_public_domain"
        case isZoomable = "is_zoomable"
        case maxZoomWindowSize = "max_zoom_window_size"
        case copyrightNotice = "copyright_notice"
        case hasMultimediaResources = "has_multimedia_resources"
        case hasEducationalResources = "has_educational_resources"
        case colorfulness, color, latitude, longitude, latlon
        case isOnView = "is_on_view"
        case onLoanDisplay = "on_loan_display"
        case galleryTitle = "gallery_title"
        case galleryID = "gallery_id"
        case artworkTypeTitle = "artwork_type_title"
        case artworkTypeID = "artwork_type_id"
        case departmentTitle = "department_title"
        case departmentID = "department_id"
        case artistID = "artist_id"
        case artistTitle = "artist_title"
        case altArtistIDS = "alt_artist_ids"
        case artistIDS = "artist_ids"
        case artistTitles = "artist_titles"
        case categoryIDS = "category_ids"
        case categoryTitles = "category_titles"
        case artworkCatalogueIDS = "artwork_catalogue_ids"
        case termTitles = "term_titles"
        case styleID = "style_id"
        case styleTitle = "style_title"
        case altStyleIDS = "alt_style_ids"
        case styleIDS = "style_ids"
        case styleTitles = "style_titles"
        case classificationID = "classification_id"
        case classificationTitle = "classification_title"
        case altClassificationIDS = "alt_classification_ids"
        case classificationIDS = "classification_ids"
        case classificationTitles = "classification_titles"
        case subjectID = "subject_id"
        case altSubjectIDS = "alt_subject_ids"
        case subjectIDS = "subject_ids"
        case subjectTitles = "subject_titles"
        case materialID = "material_id"
        case altMaterialIDS = "alt_material_ids"
        case materialIDS = "material_ids"
        case materialTitles = "material_titles"
        case techniqueID = "technique_id"
        case altTechniqueIDS = "alt_technique_ids"
        case techniqueIDS = "technique_ids"
        case techniqueTitles = "technique_titles"
        case themeTitles = "theme_titles"
        case imageID = "image_id"
        case altImageIDS = "alt_image_ids"
        case documentIDS = "document_ids"
        case soundIDS = "sound_ids"
        case videoIDS = "video_ids"
        case textIDS = "text_ids"
        case sectionIDS = "section_ids"
        case sectionTitles = "section_titles"
        case siteIDS = "site_ids"
        case suggestAutocompleteAll = "suggest_autocomplete_all"
        case lastUpdatedSource = "last_updated_source"
        case lastUpdated = "last_updated"
        case timestamp
        case suggestAutocompleteBoosted = "suggest_autocomplete_boosted"
    }
}

enum APIModel: String, Codable {
    case artworks = "artworks"
}

// MARK: - Color
struct Color: Codable {
    let h: Int?
    let l: Int?
    let s: Int?
    let percentage: Double?
    let population: Int?
}

// MARK: - SuggestAutocompleteAll
struct SuggestAutocompleteAll: Codable {
    let input: [String]?
    let contexts: Contexts?
    let weight: Int?
}

// MARK: - Contexts
struct Contexts: Codable {
    let groupings: [Grouping]?
}

enum Grouping: String, Codable {
    case accession = "accession"
    case title = "title"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let lqip: String?
    let width: Int?
    let height: Int?
    let altText: String?

    enum CodingKeys: String, CodingKey {
        case lqip, width, height
        case altText = "alt_text"
    }
}

// MARK: - ArtWorkInfo
struct ArtWorkInfo: Codable {
    let licenseText: String?
    let licenseLinks: [String]?
    let version: String?

    enum CodingKeys: String, CodingKey {
        case licenseText = "license_text"
        case licenseLinks = "license_links"
        case version
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let total: Int?
    let limit: Int?
    let offset: Int?
    let totalPages: Int?
    let currentPage: Int?
    let nextURL: String?

    enum CodingKeys: String, CodingKey {
        case total, limit, offset
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextURL = "next_url"
    }
}
