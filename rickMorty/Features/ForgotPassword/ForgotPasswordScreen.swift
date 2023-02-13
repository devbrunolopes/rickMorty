//
//  ForgotPasswordScreen.swift
//  rickAndMorty
//
//  Created by Lorena on 07/02/23.
//

import UIKit

protocol ForgotPasswordDelegate: AnyObject {
    func tappedBackButton()
    func tappedSendButton()
}

class ForgotPasswordScreen: UIView {
    
    private weak var delegate: ForgotPasswordDelegate?
    
    public func delegate(delegate: ForgotPasswordDelegate?) {
        self.delegate = delegate
    }
    
    lazy var ForgotPasswordImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "rick")
        return imageView
    }()
    
    lazy var emailForgotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        return label
    }()
    
    lazy var emailForgotTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .gray
        textField.placeholder = "Digite seu email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back-button"), for: .normal)
        button.tintColor = .blue
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)

        return button
        }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Enviar", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        constraintSettings()
        configButtonEnable(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedBackButton(){
        delegate?.tappedBackButton()
    }
    
    @objc func tappedSendButton(){
        delegate?.tappedSendButton()
    }
    
    func configTextField(delegate: UITextFieldDelegate){
        emailForgotTextField.delegate = delegate
    }
    
    func configButtonEnable(_ enable:Bool){
        if enable {
            self.sendButton.setTitleColor(.white, for: .normal)
            self.sendButton.isEnabled = true
        }else{
            self.sendButton.setTitleColor(.lightGray, for: .normal)
            self.sendButton.isEnabled = false
        }
    }
    
    func validarTextField(){
        let email = emailForgotTextField.text ?? ""
        
        if !email.isEmpty {
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
    }
    
    private func addViews(){
        addSubview(ForgotPasswordImageView)
        addSubview(emailForgotLabel)
        addSubview(emailForgotTextField)
        addSubview(sendButton)
        addSubview(backButton)
    }
    
    private func constraintSettings(){
        NSLayoutConstraint.activate([
        
            ForgotPasswordImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            ForgotPasswordImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ForgotPasswordImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ForgotPasswordImageView.heightAnchor.constraint(equalToConstant: 270),
            ForgotPasswordImageView.widthAnchor.constraint(equalToConstant: 90),
            
            emailForgotLabel.topAnchor.constraint(equalTo: ForgotPasswordImageView.bottomAnchor),
            emailForgotLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            emailForgotTextField.topAnchor.constraint(equalTo: emailForgotLabel.bottomAnchor, constant: 5),
            emailForgotTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailForgotTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailForgotTextField.heightAnchor.constraint(equalToConstant: 45),
            
            sendButton.topAnchor.constraint(equalTo: emailForgotTextField.bottomAnchor, constant: 20),
            sendButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -55),
            sendButton.heightAnchor.constraint(equalToConstant: 55),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
  



}


