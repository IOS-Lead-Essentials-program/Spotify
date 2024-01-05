//
//  FeaturedPlaylistResponse.swift
//  Spotify
//
//  Created by Neddy Ksenia Gonzalez Siles on 10/10/23.
//

import Foundation

struct FeaturedPlaylistResponse: Codable {
    let playlists: PlaylistResponse
}

struct PlaylistResponse: Codable {
    let items: [Playlist]
}

struct User: Codable {
    let display_name: String
    let external_urls: [String: String]
    let id: String
}
