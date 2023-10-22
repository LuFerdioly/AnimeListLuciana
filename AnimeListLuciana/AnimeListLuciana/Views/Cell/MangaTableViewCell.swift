//
//  MangaTableViewCell.swift
//  AnimeListLuciana
//
//  Created by Luciana Fernandes de Oliveira on 21/10/23.
//

import UIKit

class MangaTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(model: MangaDetailResponse){
        titleLabel.text = "Titulo: \(String(describing: model.title ?? String()))"
    }
}
