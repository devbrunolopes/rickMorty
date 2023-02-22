//
//  HomeView.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/21/23.
//

import UIKit

class HomeView: UIView {
    
    lazy var imagePerson: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "name"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "status"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var specieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "specie"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var localizionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "localizion"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    init(name: String, status: String, specie: String, localizion: String) {
        super.init(frame: .zero)
        nameLabel.text = name
        statusLabel.text = status
        specieLabel.text = specie
        localizionLabel.text = localizion
        setupViewCode()
        backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: Extension ViewCode

extension HomeView: ViewCode {
    func configElements() {
        addSubview(imagePerson)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(specieLabel)
        addSubview(localizionLabel)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            imagePerson.topAnchor.constraint(equalTo: topAnchor),
            imagePerson.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagePerson.bottomAnchor.constraint(equalTo: bottomAnchor),
            imagePerson.heightAnchor.constraint(equalToConstant: 120),
            imagePerson.widthAnchor.constraint(equalToConstant: 90),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: imagePerson.trailingAnchor, constant: 20),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            specieLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 10),
            specieLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            
            localizionLabel.topAnchor.constraint(equalTo: specieLabel.bottomAnchor,constant: 10),
            localizionLabel.leadingAnchor.constraint(equalTo: specieLabel.leadingAnchor),
            
        ])
    }
}
