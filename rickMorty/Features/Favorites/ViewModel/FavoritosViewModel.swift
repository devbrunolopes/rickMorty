//
//  FavoritosViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/13/23.
//

import UIKit
import FirebaseFirestore
import Firebase
import FirebaseAuth

protocol FavoritosViewModelProtocol: Any {
    func succes()
    func error()
}

class FavoritosViewModel: UIViewController {
    
    var delegate: FavoritosViewModelProtocol?
    func delegate(delegate: FavoritosViewModelProtocol){
        self.delegate = delegate
    }
    
    var dataPopular: [Result] = []
    var service: FavoritosList = FavoritosList()
    var dataArray = [[String: Any]]()
    var intArray = [Int]()
    var stringIds = ""
    
    var numberOfRowsInSectionPopularFavotitos: Int{
        if dataPopular.count == 0 {
            return 1
        } else {
            return dataPopular.count
        }
    }
    
    func whichCellShouldShow(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if dataPopular.count == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.identifier, for: indexPath)
            return cell
        }  else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonsCollectionViewCell.identifier, for: indexPath) as? PersonsCollectionViewCell
            cell?.setupCell(data: dataPopular[indexPath.row])
            return cell ?? UICollectionViewCell()
        }
    }
    
    func sizeForItemAt() -> CGSize {
        if dataPopular.count != 0 {
            return CGSize(width: 130, height: 130)
        } else {
            return CGSize(width: 300, height: 400)
        }
    }
    
    func userShouldInteractWithCollection(collectionView: UICollectionView) {
        if dataPopular.count == 0 {
            collectionView.isUserInteractionEnabled = false
        } else {
            collectionView.isUserInteractionEnabled = true
        }
    }
    
    func testeFirebase(){
        
        let db = Firestore.firestore()
        let collectionRef = db.collection("FavoritosCell")
        
        collectionRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let documents = querySnapshot?.documents else { return }
                for document in documents {
                    self.dataArray.append(document.data())
                }
                
                for data in self.dataArray {
                    if let intValue = data["id"] as? Int {
                        self.intArray.append(intValue)
                        let teste = self.intArray.map { String($0) }
                        self.stringIds = teste.joined(separator: ",")
                    }
                }
                
                DispatchQueue.main.async {
                    self.fetcDetails(id: self.stringIds)
                }
            }
        }
    }
    
    func fetcDetails(id: String){
        service.getDetalis(id: id) { result, failure in
            if let result {
                self.dataPopular = result
                self.delegate?.succes()
            } else {
                self.delegate?.error()
            }
        }
    }
    
    func getCaracterId(indexPath: IndexPath) -> Int {
        let id = dataPopular[indexPath.row].id ?? 1
        return id
    }
}
