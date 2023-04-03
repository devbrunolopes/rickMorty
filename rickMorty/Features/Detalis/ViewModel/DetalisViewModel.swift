//
//  DetalisViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/27/23.
//

import UIKit
import Firebase
import AlamofireImage
import FirebaseStorage
import FirebaseFirestore

protocol DetalisViewModelProtocol: AnyObject {
    func requisicaoError()
    func requisicaoSucces()
}

class DetalisViewModel: UIViewController {
    var delegate: DetalisViewModelProtocol?
    func delegate(delegate:DetalisViewModelProtocol){
        self.delegate = delegate
    }
    
    var data: [Result] = []
    var service: DetalisService = DetalisService()
    var favoritosButton = false
    let storage = Storage.storage().reference()
    var db = Firestore.firestore()
    
    func fetcDetails(id: Int){
        service.getDetalis(id: id) { result, failure in
            if let result {
                self.data.append(result)
                self.delegate?.requisicaoSucces()
            } else {
                self.delegate?.requisicaoError()
            }
        }
    }
    
    func savedId(id: Int){
        let db = Firestore.firestore()
        let collectionRef = db.collection("FavoritosCell")
        
        let data = [
            "id": id
        ]
        collectionRef.addDocument(data: data) { err in
            if let err = err {
                print("Erro ao adicionar documento: \(err)")
            } else {
                print("Documento adicionado com sucesso!")
            }
        }

        
    }
}
