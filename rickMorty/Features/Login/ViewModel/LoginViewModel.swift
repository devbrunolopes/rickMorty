//
//  LoginViewModel.swift
//  rickMorty
//
//  Created by Lorena on 14/02/23.
//

import UIKit
import Firebase

protocol LoginViewModelProtocol: AnyObject{
    func sucess()
    func error()
}

class LoginViewModel {
    
    weak var delegate: LoginViewModelProtocol?
    
    func setupDelegate(delegate: LoginViewModelProtocol){
        self.delegate = delegate
    }
    
    func loginFirebase(email: String , password: String){
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.delegate?.sucess()
                print("ok")
            } else {
                self.delegate?.error()
                print("ops")
            }
        }
    }
}
