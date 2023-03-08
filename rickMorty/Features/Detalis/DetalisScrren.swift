//
//  DetalisScrren.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/25/23.
//

import UIKit

class DetalisScrren: UIView {
    
    lazy var imagePerson: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imageHome")
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
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
        label.text = "Nome: Rick Morty"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
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
}

//MARK: - Extension ViewCode

extension DetalisScrren: ViewCode {
    func configElements() {
        addSubview(imagePerson)
        addSubview(descriptionLabel)
        addSubview(nameLabel)
        addSubview(spaceLabel)
        addSubview(localizinonLabel)
        addSubview(statusLabel)
    }
    
    func configConstraint() {
            NSLayoutConstraint.activate([
                
                imagePerson.topAnchor.constraint(equalTo: topAnchor),
                imagePerson.leadingAnchor.constraint(equalTo: leadingAnchor),
                imagePerson.trailingAnchor.constraint(equalTo: trailingAnchor),
                imagePerson.heightAnchor.constraint(equalToConstant: 350),
                
                descriptionLabel.topAnchor.constraint(equalTo: imagePerson.bottomAnchor,constant: 35),
                descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
                
                nameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 70),
                nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
                
                spaceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 15),
                spaceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                
                localizinonLabel.topAnchor.constraint(equalTo: spaceLabel.bottomAnchor,constant: 15),
                localizinonLabel.leadingAnchor.constraint(equalTo: spaceLabel.leadingAnchor),
                
                statusLabel.topAnchor.constraint(equalTo: localizinonLabel.bottomAnchor,constant: 15),
                statusLabel.leadingAnchor.constraint(equalTo: localizinonLabel.leadingAnchor),
               
                
                
            ])
    }
}
