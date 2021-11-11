//
//  UserListCell.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import UIKit

class UserListCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private (set) static var identifier = "UserListCell"
    
    func configure(with item: Item) {
        self.avatarImageView.load(url: item.avatarUrl)
        self.nameLabel.text = item.login
    }
}
