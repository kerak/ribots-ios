//
//  MainCollectionViewController.swift
//  ribots
//
//  Created by Jano Amigo on 20/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit
import BouncyLayout
import Hero

class MainViewController: UIViewController {
    
    public var ribots : [Ribot] = [Ribot]()
    
    //Initialize the BouncyLayout
    private lazy var bouncyLayout = BouncyLayout(style: .regular)
    
    //Lazily create the collectionView
    private lazy var collectionView: UICollectionView = {
        //Create the CollectionView using our BouncyLayout
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.bouncyLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delaysContentTouches = false
        view.alwaysBounceVertical = true
        view.alwaysBounceHorizontal = false
        view.delegate = self
        view.dataSource = self
        view.register(UINib(nibName: "MainCell", bundle: nil), forCellWithReuseIdentifier: MainCell.reuseIdentifier)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hero is used to animate the presentation of the cells
        isHeroEnabled = true
        
        //Create and position the CollectionView (needs to be done manually in order to
        //use the bouncyLayout)
        let insets: UIEdgeInsets = UIEdgeInsets(top: 220, left: 0, bottom: 220, right: 0)
        collectionView.contentInset = insets
        view.addSubview(collectionView)
        view.sendSubview(toBack: collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -insets.top),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -insets.left),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: insets.right)
            ])
    }
}


// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ribots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseIdentifier, for: indexPath)
        
        cell.heroID = "image_\(indexPath.item)"
        cell.heroModifiers = [.fade, .scale(0.5)]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? MainCell else { return }
        cell.setCell(ribot: self.ribots[indexPath.row])
    }

}


// MARK: - <#UICollectionViewDelegateFlowLayout#>
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Open the details controller
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "details") as! RibotDetailsViewController
        controller.modalPresentationStyle = .overCurrentContext
        controller.ribot = ribots[indexPath.row]
        self.present(controller, animated: true, completion: nil)
    }
    
}
