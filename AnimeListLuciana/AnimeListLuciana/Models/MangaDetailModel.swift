//
//  MangaDetailModel.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import Foundation

struct MangaDetailModel {
    let malID: Int?
    let url: String?
    let title: String?
    let date: String?
    let authorUsername: String?
    let authorURL, forumURL: String?
    let images: ImagesModel?
    let comments: Int?
    let excerpt: String?
}
