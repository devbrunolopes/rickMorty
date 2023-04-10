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
import FirebaseAuth

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
    var service: DetalisList = DetalisList()
    var favoritosButton = false
    var userId = Auth.auth().currentUser
    let db = Firestore.firestore()
    
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
    
    func saveFovrites(id: Int) {
        let dockRef = db.collection("favortios").document(userId?.email ?? "")
        dockRef.updateData(["id": FieldValue.arrayUnion([id])])
        }
    
    func removeFavorites(id: Int) {
            db.collection("favortios").document(userId?.email ?? "").updateData(["id": FieldValue.arrayRemove([id])])
        }
}


