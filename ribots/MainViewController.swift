//
//  MainCollectionViewController.swift
//  ribots
//
//  Created by Jano Amigo on 20/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit
import BouncyLayout

class MainViewController: UIViewController {
    
    public var ribots : [Ribot] = [Ribot]()
    
    let cellSize = UIScreen.main.bounds.width*0.75
    
    let numberOfItems = 100
    var randomFloat: CGFloat { return max(45, CGFloat(arc4random_uniform(100))) }
    
    lazy var topOffset: [CGFloat] = { (0..<self.numberOfItems).map { _ in CGFloat(arc4random_uniform(250)) } }()
    
    var insets: UIEdgeInsets = UIEdgeInsets(top: 200, left: 0, bottom: 200, right: 0)
    
    var additionalInsets: UIEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    
    lazy var layout = BouncyLayout(style: .regular)
    
    lazy var collectionView: UICollectionView = {
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delaysContentTouches = false
        view.alwaysBounceVertical = true
        view.alwaysBounceHorizontal = false
        view.backgroundColor = nil
        view.isOpaque = false
        view.delegate = self
        view.dataSource = self
        view.register(UINib(nibName: "MainCell", bundle: nil), forCellWithReuseIdentifier: MainCell.reuseIdentifier)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.clipsToBounds = true
        
        collectionView.contentInset = UIEdgeInsets(top: insets.top + additionalInsets.top, left: insets.left + additionalInsets.left, bottom: insets.bottom + additionalInsets.bottom, right: insets.right + additionalInsets.right)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: insets.top, left: insets.left, bottom: insets.bottom, right: insets.right)
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

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ribots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseIdentifier, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? MainCell else { return }
        cell.setCell(ribot: self.ribots[indexPath.row])
    }

}

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
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "details") as! RibotDetailsViewController
        controller.modalPresentationStyle = .overCurrentContext
        controller.ribot = ribots[indexPath.row]
        self.present(controller, animated: true, completion: nil)
    }
    
}
