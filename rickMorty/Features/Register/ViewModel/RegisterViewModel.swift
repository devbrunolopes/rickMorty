//
//  RegisterModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/9/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase

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
        
        Auth.auth().createUser(withEmail: email, password: senha, completion: { result, error in
            if error != nil {
                print(error?.localizedDescription)
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
    }
    
    func checkEmailFirebase(email: String, label: UILabel) {
        Auth.auth().fetchSignInMethods(forEmail: email) { (methods, error) in
            if let error = error {
                print("Erro ao verificar o e-mail: \(error.localizedDescription)")
            } else if let methods = methods {
                if methods.isEmpty {
                    print("deu certo")
                } else {
                    label.textColor = .red
                }
            } else {
                label.textColor = .clear
            }
        }
    }
}
