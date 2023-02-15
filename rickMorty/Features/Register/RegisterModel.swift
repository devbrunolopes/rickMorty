//
//  RegisterModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/9/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
    
    func createUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            completion(error)
        }
    }
    
    func createUserDados(name: String, email: String, senha: String){
        
        createUser(email: email, password: senha) { error in
            if let error = error{
                print(error.localizedDescription)
                
            } else {
                DispatchQueue.global(qos: .userInitiated).async {
                    let data = ["name": name,
                                "email": email,]
                    self.db.collection("usuarios").addDocument(data: data) { (error) in
                        if error != nil {
                            print("erro")
                            self.delegate?.error()
                        } else {
                            print("foi")
                            self.delegate?.sucess()
                        }
                    }
                }
            }
        }
    }
}
