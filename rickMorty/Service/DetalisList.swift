//
//  DetalisList.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/27/23.
//

import Foundation

protocol DetalisListProtocol: GenericService {
    func getDetalis(id: Int, completion: @escaping completion<Result?>)
}

class DetalisService: DetalisListProtocol {
    func getDetalis(id: Int, completion: @escaping completion<Result?>) {
        
        let urlString: String = "https://rickandmortyapi.com/api/character/\(id)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Result.self, from: data)
                completion(result, nil)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}



