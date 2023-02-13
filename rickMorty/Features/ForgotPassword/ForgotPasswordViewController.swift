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
    var viewModel: ForgotPasswordViewModel = ForgotPasswordViewModel()
    
    override func loadView() {
        screen = ForgotPasswordScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextField(delegate: self)
    }
}

//MARK: -Extensão ActionButton

extension ForgotPasswordViewController: ForgotPasswordDelegate {
    func tappedSendButton() {
        viewModel.sendPassword(email: screen?.emailForgotTextField.text ?? "")
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
