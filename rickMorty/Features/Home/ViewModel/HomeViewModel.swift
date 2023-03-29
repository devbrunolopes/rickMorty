//
//  HomeViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/21/23.
//

import UIKit

class HomeViewModel: UIViewController {
    
    var data: [Result] = []
    var service: HomeList = HomeList()
    var isError: Bool = false
    
    var numberOfRowsInSection: Int{
        return data.count
    }
    
    func fetchHome(tableView: UITableView) {
        service.getHome { result, failure in
            if let result = result{
                self.data = result
                self.isError = false
            } else {
                self.isError = true
            }
            
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    func getCaracterId(indexPath: IndexPath) -> Int {
        let id = data[indexPath.row].id ?? 1
        return id
    }
    
}
