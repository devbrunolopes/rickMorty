//
//  LoginViewController.swift
//  rickAndMorty
//
//  Created by Lorena on 01/02/23.
//

import UIKit

class LoginVC: UIViewController {
    
    var viewModel: LoginViewModel = LoginViewModel()
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.settingsTextField(delegate: self)
        screen?.singinButton.isEnabled = false
        viewModel.setupDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        screen?.buttonDisabled()
        screen?.passwordTextField.text = screen?.passwordGlobal
    }
}

//MARK: - LoginDelegate

extension LoginVC: LoginDelegate {
    func tappedSinginButton() {
        viewModel.loginFirebase(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
        screen?.hideErrorLabel()
    }
    
    func tappedRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedForgotPasswordButton() {
        let vc: ForgotPasswordVC = ForgotPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITextFieldDelegate

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.screen?.emailTextField){
            self.screen?.emailTextField.becomeFirstResponder()
            self.screen?.passwordTextField.becomeFirstResponder()
        }else{
            self.screen?.passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        screen?.buttonDisabled()
    }
    
}

//MARK: -LoginViewModelProtocol

extension LoginVC: LoginViewModelProtocol{
    func sucess() {
        let vc = TabbarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func error() {
        screen?.showErrorLabel()
    }
    
}
