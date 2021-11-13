//
//  DetailRepositoryHeaderView.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/13.
//

import UIKit

protocol CustomHeaderViewDelegate: AnyObject {
    func buttonTouched()
}

class DetailRepositoryHeaderView: UIView {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryLinkButton: UIButton!
    
    weak var delegate: CustomHeaderViewDelegate?
    
    internal func configure(with detailUser: DetailUser) {
        avatarImageView.load(url: detailUser.owner.avatarUrl)
        userNameLabel.text = detailUser.owner.login
        repositoryNameLabel.text = detailUser.name
        repositoryLinkButton.setTitle(detailUser.htmlUrl, for: .normal)
    }
    
    @IBAction func repositoryLinkButtonTouched(_ sender: UIButton) {
        delegate?.buttonTouched()
    }
}
