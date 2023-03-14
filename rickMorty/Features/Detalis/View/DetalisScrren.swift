//
//  DetalisScrren.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/25/23.
//

import UIKit

protocol DetalisScrrenProtocol: AnyObject {
    func actionButtonBack()
}

class DetalisScrren: UIView {
    
    weak var delegate: DetalisScrrenProtocol?
    func delegate(delegate:DetalisScrrenProtocol){
        self.delegate = delegate
    }

    
    lazy var imagePerson: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imageHome")
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
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
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .white
        // action
        return button
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descricao do Personagem"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "------------------------------------------------------------------------------------------------------------------------------------"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var spaceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Space: Humano"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var localizinonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Localizacao: Planeta Terra"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Status: Vivo"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedBackButton(){
        delegate?.actionButtonBack()
    }
}

//MARK: - Extension ViewCode

extension DetalisScrren: ViewCode {
    func configElements() {
        addSubview(imagePerson)
        addSubview(backButton)
        addSubview(heartButton)
        addSubview(descriptionLabel)
        addSubview(nameLabel)
//        addSubview(spaceLabel)
//        addSubview(localizinonLabel)
//        addSubview(statusLabel)
    }
    
    func configConstraint() {
            NSLayoutConstraint.activate([
                
                imagePerson.topAnchor.constraint(equalTo: topAnchor),
                imagePerson.leadingAnchor.constraint(equalTo: leadingAnchor),
                imagePerson.trailingAnchor.constraint(equalTo: trailingAnchor),
                imagePerson.heightAnchor.constraint(equalToConstant: 350),
                
                backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
                backButton.heightAnchor.constraint(equalToConstant: 20),
                backButton.widthAnchor.constraint(equalToConstant: 20),
                
                heartButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                heartButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
                
                descriptionLabel.topAnchor.constraint(equalTo: imagePerson.bottomAnchor,constant: 35),
                descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
                
                nameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 70),
                nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
                nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
//                spaceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 15),
//                spaceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//
//                localizinonLabel.topAnchor.constraint(equalTo: spaceLabel.bottomAnchor,constant: 15),
//                localizinonLabel.leadingAnchor.constraint(equalTo: spaceLabel.leadingAnchor),
//
//                statusLabel.topAnchor.constraint(equalTo: localizinonLabel.bottomAnchor,constant: 15),
//                statusLabel.leadingAnchor.constraint(equalTo: localizinonLabel.leadingAnchor),
               
                
                
            ])
    }
}
