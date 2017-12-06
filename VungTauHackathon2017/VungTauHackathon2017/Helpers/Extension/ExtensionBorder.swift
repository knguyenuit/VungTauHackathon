//
//  ExtensionBorder.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 12/6/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func customBorder(cornerRadius: CGFloat, borderWidth: CGFloat, color: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
}

extension UIImageView {
    override func customBorder(cornerRadius: CGFloat, borderWidth: CGFloat, color: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
}

