//
//  ErrorGenericScreen.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/30/23.
//

import UIKit
protocol ErrorGenericScreenProtocol: AnyObject {
    func actionReloadHome()
}

class ErrorGenericScreen: UIView {
    
    weak var delegate: ErrorGenericScreenProtocol?
    
    func delegate(delegate: ErrorGenericScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var imageError: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "exclamationmark.square.fill")
        image.tintColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        return image
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Erro ao carregar, Tente novamente!"
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tentar novamente", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedReloadButton), for: .touchUpInside)
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
    
    @objc func tappedReloadButton(){
        delegate?.actionReloadHome()
    }
}

//MARK: - ErrorGenericScreen

extension ErrorGenericScreen: ViewCode {
    func configElements() {
        addSubview(imageError)
        addSubview(errorLabel)
        addSubview(reloadButton)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            imageError.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 50),
            imageError.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageError.widthAnchor.constraint(equalToConstant: 100),
            imageError.heightAnchor.constraint(equalToConstant: 100),
            
            errorLabel.topAnchor.constraint(equalTo: imageError.bottomAnchor,constant: 15),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            reloadButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor,constant: 15),
            reloadButton.centerXAnchor.constraint(equalTo: imageError.centerXAnchor),
            reloadButton.widthAnchor.constraint(equalToConstant: 180)
        ])
    }
}
