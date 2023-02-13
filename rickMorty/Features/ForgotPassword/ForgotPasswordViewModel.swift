//
//  ForgotPasswordViewModel.swift
//  rickAndMorty
//
//  Created by Lorena on 07/02/23.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewModel {
    
    var auth: Auth?

    func sendPassword(email: String){
        self.auth?.sendPasswordReset(withEmail: email)
    }
    
}
