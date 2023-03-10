//
//  ForgotPasswordViewModel.swift
//  rickAndMorty
//
//  Created by Lorena on 07/02/23.
//

import UIKit
import FirebaseAuth

protocol ForgotPasswordViewModelProtocol: AnyObject {
    func alertError()
    func alertSucess()
}

class ForgotPasswordViewModel {
    
    var delegate: ForgotPasswordViewModelProtocol?
    func delegate(delegate: ForgotPasswordViewModelProtocol){
        self.delegate = delegate
    }
    var auth: Auth?
        
    func sendPassword(email: String){
        self.auth?.sendPasswordReset(withEmail: email)
    }
    
    func checkEmailFirebase(email: String, label: UILabel) {
        Auth.auth().fetchSignInMethods(forEmail: email) { (methods, error) in
            if error != nil {
                self.delegate?.alertError()
            } else if let methods = methods {
                if methods.isEmpty {
                    label.textColor = .red
                } else {
                    label.textColor = .clear
                    self.delegate?.alertSucess()
                }
            } else {
                label.textColor = .red
            }
        }
    }
}
