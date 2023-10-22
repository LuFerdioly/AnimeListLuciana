//
//  MangaDetailResponse.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import Foundation

// MARK: - Datum
struct MangaDetailResponse: Codable {
    let malID: Int?
    let url: String?
    let title: String?
    let date: String?
    let authorUsername: String?
    let authorURL, forumURL: String?
    let images: ImagesResponse?
    let comments: Int?
    let excerpt: String?

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url, title, date
        case authorUsername = "author_username"
        case authorURL = "author_url"
        case forumURL = "forum_url"
        case images, comments, excerpt
    }
}
