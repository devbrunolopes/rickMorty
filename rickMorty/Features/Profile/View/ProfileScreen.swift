//
//  ProfileScreen.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/15/23.
//

import UIKit

protocol ProfileScreenProtocol: AnyObject {
    func actionEditButton()
    func actionEndButton()
}

class ProfileScreen: UIView {
    
    weak var delegate: ProfileScreenProtocol?
    func delegate(delegate: ProfileScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Perfil 🤪"
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageProfile: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.clipsToBounds = true
        image.layer.cornerRadius = 65
        image.tintColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        return image
    }()
    
    lazy var editarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pencil.line"), for: .normal)
        button.tintColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        button.addTarget(self, action: #selector(tappedEditButton), for: .touchUpInside)
        return button
    }()
    
    lazy var namelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.text = "Franklin Solano"
        textField.isEnabled = false
        return textField
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "franklin@gmail.com"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6)
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.isEnabled = false
        return textField
    }()
    
    lazy var endButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SAIR", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedEnd), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedEditButton(){
        delegate?.actionEditButton()
    }
    
    @objc func tappedEnd(){
        delegate?.actionEndButton()
    }
    
}

//MARK: Extension ViewCode

extension ProfileScreen: ViewCode {
    func configElements() {
        addSubview(profileLabel)
        addSubview(imageProfile)
        addSubview(editarButton)
        addSubview(namelLabel)
        addSubview(nameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(endButton)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            profileLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            profileLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            imageProfile.topAnchor.constraint(equalTo: profileLabel.bottomAnchor,constant: 60),
            imageProfile.heightAnchor.constraint(equalToConstant: 150),
            imageProfile.widthAnchor.constraint(equalToConstant: 150),
            imageProfile.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            editarButton.topAnchor.constraint(equalTo: imageProfile.bottomAnchor,constant: -8),
            editarButton.centerXAnchor.constraint(equalTo: imageProfile.centerXAnchor,constant: 40),
            
            namelLabel.topAnchor.constraint(equalTo: editarButton.bottomAnchor,constant: 30),
            namelLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            namelLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: namelLabel.bottomAnchor,constant: 5),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 22),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22),
            
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 25),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 22),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22),
            
            endButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 40),
            endButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            endButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            endButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
