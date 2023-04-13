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
    
    func savedButtonFavoritos(){
        let docRef = db.collection("favortios").document(userId ?? "")
        
        docRef.getDocument { (document, error) in
            if let document = document {
                let data = document.data()
                self.favoriteIds = data?["id"] as? [Int] ?? []
            }
        }
    }
}
