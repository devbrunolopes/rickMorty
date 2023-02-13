//
//  RegisterVC.swift
//  rickAndMorty
//
//  Created by Franklin  Stilhano on 2/2/23.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore

class RegisterVC: UIViewController {
    
    var screen: RegisterScreen?
    //    var alert: Alert?
    var auth: Auth?
    var user = Auth.auth().currentUser
    var firestore: Firestore?
    var db = Firestore.firestore()
    
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextField(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func createUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            completion(error)
        }
    }
    func createDadosDatabse(){
    }
}
// MARK: Extension ActionButton

extension RegisterVC: RegisterScreenProtocol {
    func actionButtonBack() {
        
    }
    
    func actionRegisterButton() {
        screen?.configCheckPassword()
        
        
        let name: String = screen?.nameTextField.text ?? ""
        let email: String = screen?.emailTextField.text ?? ""
        let senha: String = screen?.passwordTextField.text ?? ""
        
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
                        } else {
                            print("foi")
                        }
                    }
                }
            }
        }
    }
}

// MARK: Extension ConfigTextField

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.configOnButton()
    }
}

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
}


