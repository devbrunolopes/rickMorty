//
//  ForgotPasswordViewController.swift
//  rickAndMorty
//
//  Created by Lorena on 07/02/23.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    
    var screen: ForgotPasswordScreen?
    var auth: Auth?
    
    override func loadView() {
        screen = ForgotPasswordScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextField(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

//MARK: -Extensão ActionButton

extension ForgotPasswordViewController: ForgotPasswordDelegate {
    func tappedSendButton() {
        let email: String = screen?.emailForgotTextField.text ?? ""
        self.auth?.sendPasswordReset(withEmail: email)
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: Extension TextFields

extension ForgotPasswordViewController: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validarTextField()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
