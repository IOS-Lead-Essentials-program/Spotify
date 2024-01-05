//
//  UserProfile.swift
//  Spotify
//
//  Created by Neddy Ksenia Gonzalez Siles on 3/10/23.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let displayName: String
    let email: String
    let explicitContent: [String: Bool]
    let externalUrls: [String: String]
//    let followers: [String: Codable?]
    let id: String
    let product: String
    let userImages: [APIImage]
    
    private enum CodingKeys: String, CodingKey {
        case country
        case displayName = "display_name"
        case email
        case explicitContent = "explicit_content"
        case externalUrls = "external_urls"
        case id
        case product
        case userImages = "images"
    }
}

