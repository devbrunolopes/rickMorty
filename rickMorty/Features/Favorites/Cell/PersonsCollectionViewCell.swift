//
//  PersonsCollectionViewCell.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/10/23.
//

import UIKit

class PersonsCollectionViewCell: UICollectionViewCell {
    
    lazy var contentViewFavorite: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var imagePerson: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imageHome")
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .white
        // action
        return button
    }()

    static let identifier:String = "Nome do arquivo"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViewCode()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}

extension PersonsCollectionViewCell: ViewCode {
    func configElements() {
        addSubview(contentViewFavorite)
        contentViewFavorite.addSubview(imagePerson)
        contentViewFavorite.addSubview(heartButton)
    }
    
    func configConstraint() {
            NSLayoutConstraint.activate([
                
                contentViewFavorite.topAnchor.constraint(equalTo: topAnchor),
                contentViewFavorite.leadingAnchor.constraint(equalTo: leadingAnchor),
                contentViewFavorite.trailingAnchor.constraint(equalTo: trailingAnchor),
                contentViewFavorite.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                imagePerson.topAnchor.constraint(equalTo: contentViewFavorite.topAnchor),
                imagePerson.leadingAnchor.constraint(equalTo: contentViewFavorite.leadingAnchor),
                imagePerson.trailingAnchor.constraint(equalTo: contentViewFavorite.trailingAnchor),
                imagePerson.bottomAnchor.constraint(equalTo: contentViewFavorite.bottomAnchor),
                
                heartButton.topAnchor.constraint(equalTo: topAnchor,constant: 12),
                heartButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12),
                
                
                
            ])
    }
    
    
}
