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
    var stringIds = ""
    var userId = Auth.auth().currentUser?.uid
    
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
    
    func fetchFirebase(){
        let docRef = Firestore.firestore().collection("favortios").document(self.userId ?? "")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let array = data?["id"] as? [Any] ?? []
                let intArray = array.compactMap { $0 as? Int }
                let stringArray = intArray.map { String($0) }
                self.stringIds = stringArray.joined(separator: ",")
                
                DispatchQueue.main.async {
                    self.fetcDetails(id: self.stringIds)
                }
            } else {
                print("Documento não encontrado")
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
