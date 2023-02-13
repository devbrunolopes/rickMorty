//
//  RegisterVC.swift
//  rickAndMorty
//
//  Created by Franklin  Stilhano on 2/2/23.
//

import UIKit

class RegisterVC: UIViewController {
    
    var screen: RegisterScreen?
    var viewModel: RegisterViewModel = RegisterViewModel()
    
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
}

// MARK: Extension ActionButton

extension RegisterVC: RegisterScreenProtocol {
    
    func actionButtonBack() {
        
    }
    
    func actionRegisterButton() {
        screen?.configCheckPassword()
        viewModel.createUserDados(name: screen?.nameTextField.text ?? "", email: screen?.emailTextField.text ?? "", senha: screen?.passwordTextField.text ?? "")
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


