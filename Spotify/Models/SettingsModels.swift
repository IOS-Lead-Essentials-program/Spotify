//
//  SettingsModels.swift
//  Spotify
//
//  Created by Neddy Ksenia Gonzalez Siles on 9/10/23.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
