//
//  NewsManga.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import Foundation
import Alamofire

protocol NewsMangaProtocol: GenericMangaProtocol {
    func fetchMangaNews(completion: @escaping completion<[MangaDetailResponse]?>)
}

class NewsManga: GenericMangaRequest, NewsMangaProtocol {
    
    private var decoder = JSONDecoder()
    
    override init() {
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchMangaNews(completion: @escaping completion<[MangaDetailResponse]?>) {
        AF.request("\(MangaApi.baseUrl)\(MangaApi.news)", method: .get).response { response in
            guard let data = response.data else {
                completion(nil, self.error)
                return
            }
            if let error = response.error {
                completion(nil, error)
                return
            }
            do {
                let object = try self.decoder.decode(MangaResponse.self, from: data)
                completion(object.data, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
