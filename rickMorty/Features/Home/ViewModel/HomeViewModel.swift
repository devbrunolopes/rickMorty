//
//  HomeViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/21/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
    var db = Firestore.firestore()
    var userId = Auth.auth().currentUser?.uid
    var favoriteIds: [Int] = []
    var dataSearchBar: [Result] = []
    
    var numberOfRowsInSection: Int{
        if dataSearchBar.count == 0 {
            return 1
        }
        return dataSearchBar.count
    }
    
    func whichCellShouldShow(tableview: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if dataSearchBar.count == 0 {
            let cell: HomeTableViewErrorTableViewCell? = tableview.dequeueReusableCell(withIdentifier: HomeTableViewErrorTableViewCell.identifier, for: indexPath) as? HomeTableViewErrorTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell: HomeTableViewCell? = tableview.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
            cell?.setupCell(data: dataSearchBar[indexPath.row])
            return cell ?? UITableViewCell()
            
        }
        
    }
    
    func fetchHome(tableView: UITableView) {
        service.getHome { result, failure in
            if let result = result{
                self.data = result
                self.dataSearchBar = self.data
                self.delegate?.requisicaoSucces()
            } else {
                self.delegate?.requisicaoError()
            }
        }
    }
    
    func getCaracterId(indexPath: IndexPath) -> Int {
        let id = dataSearchBar[indexPath.row].id ?? 1
        return id
    }
    
    func savedButtonFavoritos(){
        let docRef = db.collection("favortios").document(userId ?? "")
        
        docRef.getDocument { (document, error) in
            if let document = document {
                let data = document.data()
                self.favoriteIds = data?["id"] as? [Int] ?? []
            }
        }
    }
    
    func searchBarPesquisa(searchText: String, tableView: UITableView){
        dataSearchBar = []
        if searchText.isEmpty {
            fetchHome(tableView: tableView)
        } else {
            for value in data {
                if value.name?.contains(searchText) ?? true {
                    dataSearchBar.append(value)
                }
                tableView.reloadData()
            }
        }
    }
}

