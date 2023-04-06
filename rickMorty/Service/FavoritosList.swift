//
//  FavoritosList.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 4/3/23.
//

import Foundation

protocol FavoritosListProtocol: GenericService {
    func getDetalis(id: String, completion: @escaping completion<[Result]?>)
}

class FavoritosList: FavoritosListProtocol {
    func getDetalis(id: String, completion: @escaping completion<[Result]?>) {
        let urlString: String = "https://rickandmortyapi.com/api/character/\(id)"
        print(urlString)
        guard let url = URL(string: urlString) else {
            return completion(nil, Error.errorDescription(message: "errorURL"))
            
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode([Result].self, from: data)
                completion(result, nil)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}



