//
//  UIImageView + Extension.swift
//  Cardoc
//
//  Created by 심영민 on 2021/11/11.
//

import Foundation
import Kingfisher

extension UIImageView {
    func load(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                self.kf.setImage(with: url)
            }
        }
    }
}
