//
//  HomeViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/21/23.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func requisicaoError()
    func requisicaoSucces()
}

class HomeViewModel: UIViewController {
    var delegate: HomeViewModelProtocol?
    func delegate(delegate: HomeViewModelProtocol){
        self.delegate = delegate
    }
    
    var data: [Result] = []
    var service: HomeList = HomeList()

    var numberOfRowsInSection: Int{
        return data.count
    }
    
    func fetchHome(tableView: UITableView) {
        service.getHome { result, failure in
            if let result = result{
                self.data = result
                self.delegate?.requisicaoSucces()
            } else {
                self.delegate?.requisicaoError()
            }
        }
    }
    
    func getCaracterId(indexPath: IndexPath) -> Int {
        let id = data[indexPath.row].id ?? 1
        return id
    }
}
