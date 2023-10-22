//
//  MangaViewModel.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import Foundation

struct MangaViewModel {
    private var service = NewsManga()
    var mangaNewsList: Observable<[MangaDetailResponse]?> = Observable(nil)
    
    init() {
        
    }
    
    func fetchMangaNews() {
        service.fetchMangaNews { result, failure in
            mangaNewsList.value = result
        }
    }
}
