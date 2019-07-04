//
//  CPokemonCellollectionViewCell.swift
//  PokedexMEL
//
//  Created by Gabriel Palhares on 04/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import Foundation
import UIKit

class CPokemonCellollectionViewCell: UICollectionViewCell {
    
    var pokemon: Pokemon! {
        didSet {
            pokemonImage.image = pokemon.image.rotate(radians: .pi/2)
            pokemonLabel.text = pokemon.name
        }
    }
    
    let pokemonImage: UIImageView = {
        let pokemon = UIImageView()
        pokemon.contentMode = .scaleAspectFill
        pokemon.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        pokemon.translatesAutoresizingMaskIntoConstraints = false
        pokemon.layer.cornerRadius = 16
        pokemon.clipsToBounds = true
        return pokemon
    }()
    
    lazy var pokemonLabel: UILabel = {
        let pokemon = UILabel()
        pokemon.textAlignment = .center
        pokemon.numberOfLines = 0
        pokemon.font = UIFont.boldSystemFont(ofSize: 20)
        pokemon.textColor = .white
        pokemon.text = "Pokemon Name"
        pokemon.translatesAutoresizingMaskIntoConstraints = false
        return pokemon
    }()
    
    lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return view
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(pokemonImage)
        addSubview(blurView)
        addSubview(pokemonLabel)
        NSLayoutConstraint.activate([
            pokemonImage.topAnchor.constraint(equalTo: topAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonImage.leftAnchor.constraint(equalTo: leftAnchor),
            pokemonImage.rightAnchor.constraint(equalTo: rightAnchor),
            pokemonLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonLabel.leftAnchor.constraint(equalTo: leftAnchor),
            pokemonLabel.rightAnchor.constraint(equalTo: rightAnchor),
            blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error on init")
    }
}


extension UIImage {
    
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
    
}
