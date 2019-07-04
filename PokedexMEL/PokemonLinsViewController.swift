//
//  PokemonLinsViewController.swift
//  PokedexMEL
//
//  Created by Gabriel Palhares on 04/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class PokemonLinsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionview: UICollectionView!
    var cellId = "Cell"
    
    var cellSize: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 180
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CPokemonCellollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 25, bottom: 10, right: 25)
    }

    
    func setup()  {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: cellSize)
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.register(CPokemonCellollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionview)
        
        collectionview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
    }
    
    
    
    


}
