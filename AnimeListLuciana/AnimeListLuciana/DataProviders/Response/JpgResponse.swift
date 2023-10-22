//
//  JpgResponse.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import Foundation

// MARK: - Jpg
struct JpgResponse: Codable {
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}
