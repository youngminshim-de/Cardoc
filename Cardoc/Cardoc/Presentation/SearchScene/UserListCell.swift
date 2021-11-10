//
//  UserListCell.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/10.
//

import UIKit

class UserListCell: UITableViewCell {

    private (set) static var identifier = "UserListCell"
    
    func configure(with item: Item) {
        var content = self.defaultContentConfiguration()
        content.text = item.login
        self.contentConfiguration = content
    }

}
