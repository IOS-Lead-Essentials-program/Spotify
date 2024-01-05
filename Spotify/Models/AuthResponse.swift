//
//  AuthResponse.swift
//  Spotify
//
//  Created by Neddy Ksenia Gonzalez Siles on 4/10/23.
//

import Foundation
//Success: {
//    "access_token" = "BQB3Esghp3-Xtotm8Kl1555gfLC8O0aADgYxas9Lnr9Sz4npFZlrVJX4MCzeGFymcCaMm9P7R2uM87NrzJi-qy26EVulRsm8W0_bcZt9pN71f8nD_Yxm56p-P1Y_7lxz0Njr7e_CSaVpJN3lUZhCJoSvKv3x4hOaa6Tg9yhaqYW4kCAlUFZA961xSVGwqQaqdZuhJSaIGbzUZ2p8rcU";
//    "expires_in" = 3600;
//    "refresh_token" = "AQBF9alGCi1uA4_t0B1kE1lVTasmt-wuMkznrzpUlrulVJgER0PAtaEq3x20HES8Eq64_ySxtLlNFqHhiYYCofcD8bltCKLLbiZ-d1Pv4IcE0TkXvowquv_trdIXFue_rEA";
//    scope = "user-read-private";
//    "token_type" = Bearer;
//}

struct AuthResponse: Codable {
    let accessToken: String
    let expiresIn: Int
    let refreshToken: String?
    let scope: String
    let tokenType: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope
        case tokenType = "token_type"
    }
}
