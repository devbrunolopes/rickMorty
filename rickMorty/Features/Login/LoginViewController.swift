//
//  LoginViewController.swift
//  rickAndMorty
//
//  Created by Lorena on 01/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel = LoginViewModel()
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        settingAndColors()
        screen?.delegate(delegate: self)
        screen?.settingsTextField(delegate: self)
        screen?.singinButton.isEnabled = false
        viewModel.setupDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        screen?.emailTextField.text = ""
        screen?.passwordTextField.text = ""
    }
    
    func settingAndColors() {
        view.backgroundColor = .black
    }
}

//MARK: - LoginDelegate

extension LoginViewController: LoginDelegate {
    func tappedSinginButton() {
        viewModel.loginFirebase(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
        screen?.hideErrorLabel()
    }
    
    func tappedRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedForgotPasswordButton() {
        let vc: ForgotPasswordViewController = ForgotPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
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

extension LoginViewController: LoginViewModelProtocol{
    func sucess() {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func error() {
        screen?.showErrorLabel()
    }
    
}
