//
//  ForgotPasswordViewController.swift
//  rickAndMorty
//
//  Created by Lorena on 07/02/23.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    var screen: ForgotPasswordScreen?
    var viewModel: ForgotPasswordViewModel = ForgotPasswordViewModel()
    var alert: Alert?
    
    override func loadView() {
        screen = ForgotPasswordScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextField(delegate: self)
        viewModel.delegate(delegate: self)
        alert = Alert(controller: self)
    }
}

//MARK: -Extensão ActionButton

extension ForgotPasswordVC: ForgotPasswordDelegate {
    func tappedSendButton() {
        viewModel.checkEmailFirebase(email: screen?.emailForgotTextField.text ?? "", label: screen?.checkEmailLabel ?? UILabel())
        viewModel.sendPassword(email: screen?.emailForgotTextField.text ?? "")
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: Extension TextFields

extension ForgotPasswordVC: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validarTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: Extension ForgotPasswordViewModelProtocol

extension ForgotPasswordVC: ForgotPasswordViewModelProtocol {
    func alertSucess() {
        alert?.getAlert(titulo: "Sucess", mensagem: "Link para redefinir a senha enviado!")
    }
    
    func alertError() {
        alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao verificar email. Tente novamente!")
    }
}
