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
        image.image = UIImage(named: "6")
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
    
    lazy var contentViewDtalis: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
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
        addSubview(contentViewDtalis)
    }
    
    func configConstraint() {
            NSLayoutConstraint.activate([
                
                imagePerson.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                imagePerson.leadingAnchor.constraint(equalTo: leadingAnchor),
                imagePerson.trailingAnchor.constraint(equalTo: trailingAnchor),
                imagePerson.heightAnchor.constraint(equalToConstant: 270),
                
                descriptionLabel.topAnchor.constraint(equalTo: imagePerson.bottomAnchor,constant: 35),
                descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
                
                contentViewDtalis.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 40),
                contentViewDtalis.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
                contentViewDtalis.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
                contentViewDtalis.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -50),
                
                
            ])
    }
}
