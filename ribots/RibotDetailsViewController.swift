//
//  RibotDetailsView.swift
//  ribots
//
//  Created by Jano Amigo on 21/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit
import Kingfisher
import PullToDismiss

class RibotDetailsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
    public var ribot: Ribot?
    
    private var pullToDismiss : PullToDismiss?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 5.0
        
        //Set up the PullToDismiss library
        pullToDismiss = PullToDismiss(scrollView: scrollView)
        pullToDismiss?.backgroundEffect = nil
        
        if ribot != nil {
            setRibot(ribot: ribot!)
        }
    }
    
    override func viewDidLayoutSubviews() {
        //Make sure that the scrollView is scrollable
        DispatchQueue.main.async {
            self.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 1)
        }
    }
    
    public func setRibot(ribot: Ribot) {
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width/2
        
        backgroundColorView.backgroundColor = UIColor(hex: ribot.hexColor!)
        
        containerView.layer.borderColor = UIColor(hex: ribot.hexColor!)?.cgColor
        
        if let imageUrl = ribot.avatar {
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
    
}
