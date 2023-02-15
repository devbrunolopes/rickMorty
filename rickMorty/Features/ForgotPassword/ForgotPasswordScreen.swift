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
        imageView.image = UIImage(named: "6")
        return imageView
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Insira o seu email abaixo!"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailForgotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    lazy var emailForgotTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        textField.placeholder = "Digite seu email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
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
        button.setTitle("Enviar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
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
            self.sendButton.setTitleColor(.black, for: .normal)
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
        addSubview(informationLabel)
        addSubview(emailForgotLabel)
        addSubview(emailForgotTextField)
        addSubview(sendButton)
        addSubview(backButton)
    }
    
    private func constraintSettings(){
        NSLayoutConstraint.activate([
            
            ForgotPasswordImageView.topAnchor.constraint(equalTo: topAnchor),
            ForgotPasswordImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ForgotPasswordImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ForgotPasswordImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            informationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 120),
            informationLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            informationLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            emailForgotLabel.topAnchor.constraint(equalTo: informationLabel.bottomAnchor,constant: 30),
            emailForgotLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            emailForgotTextField.topAnchor.constraint(equalTo: emailForgotLabel.bottomAnchor, constant: 5),
            emailForgotTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailForgotTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            sendButton.topAnchor.constraint(equalTo: emailForgotTextField.bottomAnchor, constant: 35),
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


