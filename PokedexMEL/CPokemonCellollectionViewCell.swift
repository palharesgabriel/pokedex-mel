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
    
    let pokemonImage: UIImageView = {
        let pokemon = UIImageView()
        pokemon.contentMode = .scaleToFill
        pokemon.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        pokemon.translatesAutoresizingMaskIntoConstraints = false
        pokemon.layer.cornerRadius = 16
        pokemon.clipsToBounds = true
        return pokemon
    }()
    

    
    
    
    let pokemonLabel: UILabel = {
        let pokemon = UILabel()
        pokemon.textAlignment = .center
        pokemon.numberOfLines = 0
        pokemon.text = "Pokemon Name"
        pokemon.translatesAutoresizingMaskIntoConstraints = false
        return pokemon
    }()
    
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    func setup() {
        addSubview(pokemonImage)
        addSubview(pokemonLabel)
        NSLayoutConstraint.activate([
            pokemonImage.topAnchor.constraint(equalTo: topAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonImage.leftAnchor.constraint(equalTo: leftAnchor),
            pokemonImage.rightAnchor.constraint(equalTo: rightAnchor),
            pokemonLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            pokemonLabel.leftAnchor.constraint(equalTo: leftAnchor),
            pokemonLabel.rightAnchor.constraint(equalTo: rightAnchor)
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error on init")
    }
}
