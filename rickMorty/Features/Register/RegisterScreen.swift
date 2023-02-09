//
//  RegisterScreen.swift
//  rickAndMorty
//
//  Created by Franklin  Stilhano on 2/2/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionButtonBack()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocol?
    func delegate(delegate:RegisterScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var imageLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "newLogo")
        return image
    }()
    
    lazy var imageFundo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "1")
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = UIColor(red: 237/255, green: 178/255, blue: 71/255, alpha: 1)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
   
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome:"
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
        tf.attributedPlaceholder = NSAttributedString(
        string: "Digite seu nome",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return tf
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
        tf.attributedPlaceholder = NSAttributedString(
        string: "Digite seu email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha:"
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
        tf.attributedPlaceholder = NSAttributedString(
        string: "Digite sua senha",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return tf
    }()
    
    lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirma Senha:"
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
        tf.attributedPlaceholder = NSAttributedString(
        string: "Digite sua senha novamente",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 237/255, green: 178/255, blue: 71/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3.0
        button.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
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
    
    func configOnButton(){
        
    }
    
    func configCheckPassword(){
        if passwordTextField.text != confirmPasswordTextField.text {
            checkPasswordLabel.textColor = .red
        } else {
            checkPasswordLabel.textColor = .clear
        }
    }
    
}

// MARK: Extension ViewCode

extension RegisterScreen: ViewCode {
    func configElements() {
        addSubview(imageFundo)
        addSubview(backButton)
        addSubview(imageLogo)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
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
                
                imageLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 30),
                imageLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
                imageLogo.trailingAnchor.constraint(equalTo: trailingAnchor),
                imageLogo.heightAnchor.constraint(equalToConstant: 180),
                
                backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
                backButton.heightAnchor.constraint(equalToConstant: 20),
                backButton.widthAnchor.constraint(equalToConstant: 20),
                
                nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 180),
                nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
                
                nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 10),
                nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 22),
                nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
                
                emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 25),
                emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                
                emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 10),
                emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
                emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
                
                passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 25),
                passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
                
                passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 10),
                passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
                passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
                
                confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 25),
                confirmPasswordLabel.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
                
                confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor,constant: 10),
                confirmPasswordTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
                confirmPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
                
                checkPasswordLabel.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor),
                checkPasswordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
                
                registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
                registerButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
                registerButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
                registerButton.heightAnchor.constraint(equalToConstant: 60),
                
            ])
        }
    }
    
    


