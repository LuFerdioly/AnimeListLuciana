//
//  GenericManga.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import Foundation
import Alamofire

protocol GenericMangaProtocol {
    var error: Error { set get }
    typealias completion<T> = (_ result: T, _ failure: Error?) -> Void
}

class GenericMangaRequest: GenericMangaProtocol {
    var error = NSError(domain: "", code: 901, userInfo: [NSLocalizedDescriptionKey: "Error getting information"]) as Error
}
