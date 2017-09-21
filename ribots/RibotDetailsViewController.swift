//
//  RibotDetailsView.swift
//  ribots
//
//  Created by Jano Amigo on 21/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit
import Kingfisher

class RibotDetailsViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
    
    
    public var ribot: Ribot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 5.0
        
        if ribot != nil {
            setRibot(ribot: ribot!)
        }
    }
    
    public func setRibot(ribot: Ribot) {
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width/2
        
        backgroundColorView.backgroundColor = UIColor(hex: ribot.hexColor!)
        
        containerView.layer.borderColor = UIColor(hex: ribot.hexColor!)?.cgColor
        
        if let imageUrl = ribot.avatar {
            print(imageUrl)
            avatarImageView.kf.setImage(with: URL(string: imageUrl))
        }
        else {
            avatarImageView.image = #imageLiteral(resourceName: "profile_placeholder")
        }
        
        nameLabel.text = ribot.name.firstName! + " " + ribot.name.lastName!
        emailLabel.text = ribot.email
        birthdayLabel.text = ribot.dateOfBirth
        bioTextView.text = ribot.bio
        
    }
    
    @IBAction func closePressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
