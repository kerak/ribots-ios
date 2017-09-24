//
//  SplashViewController.swift
//  ribots
//
//  Created by Jano Amigo on 22/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Animate the logo, this could also be done with the Hero library
        logoImageView.startRotating(duration: 5)
        logoImageView.fadeIn(duration: 0.5, completion: nil)
        
        //Wait for one second before making the request so users can enjoy the fancy logo animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            //Get the list of Ribots
            API.getRibots { (success, ribots) in
                self.logoImageView.fadeOut(duration: 0.5, completion: { (res) in
                    if success && ribots != nil {
                        self.openMain(ribots!)
                    }
                    else {
                        let alert = UIAlertController(title: "Oh no...", message: "Something bad happened and we couldn't retrieve ribots right now. Please come back later", preferredStyle: .alert)
                        self.present(alert, animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    func openMain(_ ribots : [Ribot]) {
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "main") as! MainViewController
        controller.ribots = ribots
        self.present(controller, animated: true, completion: nil)
    }
}
