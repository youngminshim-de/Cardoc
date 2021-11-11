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
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    static private (set) var identifier = "DetailUserCell"
    
    func configure() {
        
    }
}
