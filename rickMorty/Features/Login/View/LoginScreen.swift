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
    
    lazy var fundoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "imageFundo")
        return imageView
    }()
    
    lazy var rickAndMortyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logoRick")
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
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
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
        textField.keyboardType = .default
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var singinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
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
    
    lazy var hiddenEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Usuário e/ou senha incorretos"
        label.textColor = .red
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
        hideErrorLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedForgotPasswordButton(){
        delegate?.tappedForgotPasswordButton()
    }
    
    @objc func tappedregisterButton(){
        delegate?.tappedRegisterButton()
    }
    
    @objc func tappedSinginButton(){
        delegate?.tappedSinginButton()
    }
    
    func settingsTextField(delegate: UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    func buttonDisabled(){
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            singinButton.setTitleColor(.black, for: .normal)
            singinButton.backgroundColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
            singinButton.isEnabled = true
        } else {
            singinButton.setTitleColor(.gray, for: .normal)
            singinButton.backgroundColor = .lightGray
            singinButton.isEnabled = false
        }
        
    }
    
    func hideErrorLabel(){
        hiddenEmailLabel.isHidden = true
    }
    
    func showErrorLabel(){
        hiddenEmailLabel.isHidden = false
    }
    
    func savedDadosUsers(){
        Utils.saveUserDefaults(value: emailTextField.text ?? "", key: "1")
        Utils.saveUserDefaults(value: passwordTextField.text ?? "", key: "2")
    }
    
}

//MARK: - ViewCode

extension LoginScreen: ViewCode {
    func configElements() {
        addSubview(fundoImageView)
        addSubview(rickAndMortyImageView)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(singinButton)
        addSubview(forgotPasswordButton)
        addSubview(registerButton)
        addSubview(hiddenEmailLabel)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            fundoImageView.topAnchor.constraint(equalTo: topAnchor),
            fundoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fundoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fundoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rickAndMortyImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            rickAndMortyImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            rickAndMortyImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            rickAndMortyImageView.heightAnchor.constraint(equalToConstant: 140),
            
            emailLabel.topAnchor.constraint(equalTo: rickAndMortyImageView.bottomAnchor, constant: 15),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            hiddenEmailLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            hiddenEmailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            passwordLabel.topAnchor.constraint(equalTo: hiddenEmailLabel.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 45),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            singinButton.topAnchor.constraint(equalTo: forgotPasswordButton.topAnchor, constant: 55),
            singinButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            singinButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            singinButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor , constant: 15),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
}
