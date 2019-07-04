//
//  Database.swift
//  PokedexMEL
//
//  Created by Mario Matheus on 04/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit
import CoreData


class Database {
    
    static let core = Database()
    private let defaultPath = "pokes"
    var (container, mainContext): (NSPersistentContainer?, NSManagedObjectContext?) = {
        let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
        return (container, container?.viewContext)
    }()
    
    private init() { }
    
    var favoritesPokemon: [Pokemon] {
        var pokemons: [Pokemon] = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoritePoke")
        
        if let favorites = try? mainContext?.fetch(request) as? [FavoritePoke] {
            pokemons = favorites.compactMap({ parse(favoritePoke: $0) })
        }

        return pokemons
    }
    
    
    func add(pokemon: Pokemon) throws {
        guard let context = mainContext, let imagePath = saveImage(pokemon.image, withName: pokemon.name) else {
            throw mainContext == nil ? DatabaseError.contextNotFound : DatabaseError.errorInSaveImageOperation
        }
        
        let favoritePokemon = FavoritePoke(context: context)
        favoritePokemon.name = pokemon.name
        favoritePokemon.image_path = imagePath
    }
    
    private func saveImage(_ image: UIImage, withName imageName: String) -> String? {
        let path = "\(defaultPath)_\(imageName)"
        FileManagerHelper.saveImageInFileManager(image, at: path)
        
        return path
    }
    
    private func parse(favoritePoke: FavoritePoke) -> Pokemon? {
        guard let name = favoritePoke.name, let imagePath = favoritePoke.image_path, let image = FileManagerHelper.getImageFrom(path: imagePath)
            else {
                return nil
        }
        return Pokemon(name: name, image: image)
    }
    
}


enum DatabaseError: Error {
    case contextNotFound
    case errorInSaveImageOperation
}
