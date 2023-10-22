//
//  EndViewController.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import UIKit
import Foundation

class EndViewController: UIViewController {

    lazy var contentView = EndView()

    init() {
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
        navigationItem.title = "Fim do fluxo"
    }
}
