//
//  RegisterScreen.swift
//  rickAndMorty
//
//  Created by Franklin  Stilhano on 2/2/23.
//

import UIKit
import FirebaseAuth
import Security

protocol RegisterScreenProtocol: AnyObject {
    func actionButtonBack()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocol?
    func delegate(delegate:RegisterScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var imageFundo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imageFundo")
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imageLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logoRick")
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        tf.placeholder = "Digite seu Nome:"
        return tf
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        tf.placeholder = "Digite seu Email:"
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var checkEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email ja cadastrado"
        label.textColor = .clear
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        tf.placeholder = "Digite sua Senha:"
        return tf
    }()
    
    lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirma Senha:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        tf.placeholder = "Digite novamente sua Senha:"
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    lazy var checkPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senhas divergentes, Tente Novamente!"
        label.textColor = .clear
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
        configButtonEnable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedBackButton(){
        delegate?.actionButtonBack()
    }
    
    @objc func tappedRegisterButton(){
        delegate?.actionRegisterButton()
    }
    
    func configTextField(delegate: UITextFieldDelegate){
        nameTextField.delegate = delegate
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
        confirmPasswordTextField.delegate = delegate
    }
    
    func configButtonEnable(){
        let emptyTextField = checkForEmptyTextField()
        let isPasswordEqual = configCheckPassword()
        
        if emptyTextField && isPasswordEqual {
            self.registerButton.setTitleColor(.black, for: .normal)
            self.registerButton.backgroundColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.setTitleColor(.gray, for: .normal)
            self.registerButton.backgroundColor = .lightGray
            self.registerButton.isEnabled = false
        }
    }
    
    func checkForEmptyTextField() -> Bool{
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        
        if !name.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func configCheckPassword()-> Bool{
        if passwordTextField.text != confirmPasswordTextField.text {
            checkPasswordLabel.textColor = .red
            return false
        } else {
            checkPasswordLabel.textColor = .clear
            return true
        }
    }
}

// MARK: - Extension ViewCode

extension RegisterScreen: ViewCode {
    func configElements() {
        addSubview(imageFundo)
        addSubview(backButton)
        addSubview(imageLogo)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(checkEmailLabel)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(confirmPasswordLabel)
        addSubview(confirmPasswordTextField)
        addSubview(registerButton)
        addSubview(checkPasswordLabel)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            imageFundo.topAnchor.constraint(equalTo: topAnchor),
            imageFundo.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageFundo.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageFundo.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            
            imageLogo.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: -15),
            imageLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageLogo.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 140),
            
            nameLabel.topAnchor.constraint(equalTo: imageLogo.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 22),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            checkEmailLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            checkEmailLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 10),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor,constant: 5),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            checkPasswordLabel.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor),
            checkPasswordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
