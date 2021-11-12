//
//  DetailUserCell.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/11.
//

import UIKit

class DetailUserCell: UITableViewCell {
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    
    static private (set) var identifier = "DetailUserCell"
    
    func configure(with detailUser: DetailUser ) {
        self.repositoryNameLabel.text = detailUser.owner.login
        self.descriptionLabel.text = detailUser.description
        self.languageLabel.text = detailUser.language
        self.starCountLabel.text = String(detailUser.stargazersCount)
        
        
    }
}
