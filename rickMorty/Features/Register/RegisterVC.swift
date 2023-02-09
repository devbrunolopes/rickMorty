//
//  RegisterVC.swift
//  rickAndMorty
//
//  Created by Franklin  Stilhano on 2/2/23.
//

import UIKit

class RegisterVC: UIViewController {
    
    var screen: RegisterScreen?
    
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
    }
    
}

// MARK: Extension ConfigTextField

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
