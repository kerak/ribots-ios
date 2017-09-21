//
//  MainCell.swift
//  ribots
//
//  Created by Jano Amigo on 20/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit
import FoldingCell

//class MainCell: FoldingCell {
//
//    override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
//        let durations = [0.26, 0.2, 0.2]
//        return durations[itemIndex]
//    }
//}

class MainCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "Cell"
    
    lazy var top: NSLayoutConstraint = self.background.topAnchor.constraint(equalTo: self.contentView.topAnchor)
    lazy var left: NSLayoutConstraint = self.background.leftAnchor.constraint(equalTo: self.contentView.leftAnchor)
    lazy var bottom: NSLayoutConstraint = self.background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
    lazy var right: NSLayoutConstraint = self.background.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
    lazy var background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 300 / 2
        view.clipsToBounds = true
        
        return view
    }()
    
    func setCell(ribot: Ribot) {
        background.backgroundColor = UIColor(hue: <#T##CGFloat#>, saturation: <#T##CGFloat#>, brightness: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = nil
        contentView.addSubview(background)
        
        NSLayoutConstraint.activate([top, left, bottom, right])
        
        
    }
}
