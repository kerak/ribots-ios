//
//  MainCell.swift
//  ribots
//
//  Created by Jano Amigo on 20/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit
import Kingfisher

class MainCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "MainCell"

    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    /// Sets the content of the Cell
    ///
    /// - Parameter ribot: Ribot used to fill the cell content
    func setCell(ribot: Ribot) {
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width/2
        backgroundColorView.layer.cornerRadius = backgroundColorView.bounds.width/2
        
        backgroundColorView.backgroundColor = UIColor(hex: ribot.hexColor!)
        
        if let imageUrl = ribot.avatar {
            avatarImageView.kf.setImage(with: URL(string: imageUrl))
        }
        else {
            avatarImageView.image = #imageLiteral(resourceName: "profile_placeholder")
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
