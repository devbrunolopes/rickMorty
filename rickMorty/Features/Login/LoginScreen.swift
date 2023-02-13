//
//  LoginScreen.swift
//  rickAndMorty
//
//  Created by Lorena on 02/02/23.
//

import UIKit

protocol LoginDelegate: AnyObject {
    func tappedForgotPasswordButton()
    func tappedSinginButton()
    func tappedRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginDelegate?
    
    public func delegate(delegate: LoginDelegate?) {
        self.delegate = delegate
    }
    
    lazy var rickAndMortyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Rick-And-Morty-Logo")
        return imageView
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Insira seu email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .gray
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Insira sua senha"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 15
        textField.backgroundColor = .gray
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var singinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(tappedSinginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu Senha?", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(tappedForgotPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(tappedregisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedForgotPasswordButton(){
        delegate?.tappedForgotPasswordButton()
    }
    
    @objc func tappedregisterButton(){
        delegate?.tappedRegisterButton()
    }
    
    @objc func tappedSinginButton(){
        delegate?.tappedSinginButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addViews()
        constraintsSettings()
    }
    
    private func addViews(){
        addSubview(rickAndMortyImageView)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(singinButton)
        addSubview(forgotPasswordButton)
        addSubview(registerButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraintsSettings(){
        NSLayoutConstraint.activate([
        
            rickAndMortyImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            rickAndMortyImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            rickAndMortyImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            rickAndMortyImageView.heightAnchor.constraint(equalToConstant: 140),
//            rickAndMortyImageView.widthAnchor.constraint(equalToConstant: 120),
            
            emailLabel.topAnchor.constraint(equalTo: rickAndMortyImageView.bottomAnchor, constant: 15),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.topAnchor, constant: 50),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 45),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            singinButton.topAnchor.constraint(equalTo: forgotPasswordButton.topAnchor, constant: 55),
            singinButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            singinButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            singinButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor , constant: 15),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        
        
        ])
    }
    
    
}
