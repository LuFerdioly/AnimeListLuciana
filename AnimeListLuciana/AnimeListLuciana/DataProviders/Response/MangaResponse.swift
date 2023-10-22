//
//  MangaResponse.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import Foundation

// MARK: - MangaModel
struct MangaResponse: Codable {
    let pagination: PaginationResponse?
    let data: [MangaDetailResponse]?
}
