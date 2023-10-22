//
//  MangaViewController.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import UIKit

class MangaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = MangaViewModel()
    private var mangaDetails: [MangaDetailResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        self.bindViewModel()
        viewModel.fetchMangaNews()
    }
    
    private func setup() {
        tableView.register(UINib(nibName: "MangaTableViewCell", bundle: nil), forCellReuseIdentifier: "MangaTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func bindViewModel() {
        viewModel.mangaNewsList.bind { mangaDetailResponse in
            guard let mangaDetail = mangaDetailResponse else { return }
            self.mangaDetails = mangaDetail
            self.tableView.reloadData()
        }
    }
}

extension MangaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mangaDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MangaTableViewCell", for: indexPath) as? MangaTableViewCell
        else {
            return UITableViewCell()
        }
        cell.setup(model: mangaDetails[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = mangaDetails[indexPath.row]
        let vc = MangaDetailViewController(model: item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
