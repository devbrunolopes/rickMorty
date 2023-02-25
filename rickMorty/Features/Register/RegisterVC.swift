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
    var alert: Alert?
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextField(delegate: self)
        viewModel.delegate(delegate: self)
        alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
}

// MARK: RegisterScreenProtocol

extension RegisterVC: RegisterScreenProtocol {
    
    func actionButtonBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        viewModel.createUserDados(name: screen?.nameTextField.text ?? "", email: screen?.emailTextField.text ?? "", senha: screen?.passwordTextField.text ?? "")
        viewModel.checkEmailFirebase(email: screen?.emailTextField.text ?? "", label: screen?.checkEmailLabel ?? UILabel())
    }
}

// MARK: UITextFieldDelegate

extension RegisterVC: UITextFieldDelegate {
    

    func textFieldDidChangeSelection(_ textField: UITextField) {
        screen?.configButtonEnable()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

//MARK: RegisterViewModelProtocol

extension RegisterVC: RegisterViewModelProtocol {
    func sucess() {
        self.alert?.getAlert(titulo: "Parabens", mensagem: "Usuario cadastrado com Sucesso!", completion: {
            let vc:HomeVC = HomeVC()
            self.navigationController?.pushViewController(vc, animated: false)
        })
    }
    
    func error() {
        self.alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao cadastrar. Tente novamente!")
    }
    
    
}


