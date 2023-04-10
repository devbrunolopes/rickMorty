//
//  RegisterModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/9/23.
//

import UIKit
import Firebase

protocol RegisterViewModelProtocol: AnyObject {
    func sucess()
    func error()
}

class RegisterViewModel {
    
    var delegate: RegisterViewModelProtocol?
    func delegate(delegate: RegisterViewModelProtocol){
        self.delegate = delegate
    }
    
    var auth: Auth?
    var db = Firestore.firestore()
    var userId = Auth.auth().currentUser
    
    func createUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            //criar alert
        }
    }
    
    func createUserDados(name: String, email: String, senha: String){
        
        Auth.auth().createUser(withEmail: email, password: senha, completion: { result, error in
            if error != nil {
                self.delegate?.error()
            } else {
                self.savedUserData(email: email, name: name, id: result?.user.uid ?? "")
                self.delegate?.sucess()
            }
        })
    }
    
    func savedUserData(email: String, name: String, id: String){
        let dataPath = "users/\(id)"
        let docRef = db.document(dataPath)
        docRef.setData([
            "name": name,
            "email": email
        ])
        self.creatCollection(id: id)
    }
    
    func checkEmailFirebase(email: String, label: UILabel) {
        Auth.auth().fetchSignInMethods(forEmail: email) { (methods, error) in
            if let error = error {
            } else if let methods = methods {
                if !methods.isEmpty {
                    label.textColor = .red
                }
            } else {
                label.textColor = .clear
            }
        }
    }
    
    func creatCollection(id:String){
        let dataPath = "favortios/\(id)"
        let docRef = db.document(dataPath)
        docRef.setData([
            "id": []
            ])
        }
    }
    

