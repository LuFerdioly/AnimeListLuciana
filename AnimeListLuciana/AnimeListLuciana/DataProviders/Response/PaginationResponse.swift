//
//  PaginationResponse.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import Foundation

// MARK: - Pagination
struct PaginationResponse: Codable {
    let lastVisiblePage: Int?
    let hasNextPage: Bool?

    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
    }
}
