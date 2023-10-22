//
//  MangaDetailViewController.swift
//  AnimeListLuciana
//
//  Created by  Luciana Fernandes de Oliveira on 21/10/23.
//

import UIKit
import Foundation

class MangaDetailViewController: UIViewController {

    lazy var contentView = MangaDetailView(model: self.model, delegate: self)

    private var model: MangaDetailResponse
    
    init(model: MangaDetailResponse) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Detalhes do Anime"
    }
}

extension MangaDetailViewController: MangaDetailViewProtocol {
    func openView() {
        navigationController?.present(EndViewController(), animated: true)
    }
}
