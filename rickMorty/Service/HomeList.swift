//
//  HomeList.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/27/23.
//

import Foundation


protocol HomeListProtocol: GenericService {
    func getHome(completion: @escaping completion<[Result]?>)
}

class HomeList: HomeListProtocol {
    func getHome(completion: @escaping completion<[Result]?>) {
        let urlString: String = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(RickAndMorty.self, from: data)
                completion(result.results, nil)
            } catch {
                completion(nil, Error.errorDescription(message: "deuRuim", Error: error))
            }
        }
        task.resume()
    }
}
