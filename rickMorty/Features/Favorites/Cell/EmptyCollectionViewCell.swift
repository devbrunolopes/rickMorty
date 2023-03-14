//
//  EmptyCollectionViewCell.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/11/23.
//

import UIKit

class EmptyCollectionViewCell: UICollectionViewCell {
    
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
        image.image = UIImage(named: "rickEmpty")
        return image
    }()
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No momento não há nenhum favotiros salvo"
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    static let identifier:String = "EmptyCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViewCode()
        backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: ViewCode

extension EmptyCollectionViewCell: ViewCode {
    func configElements() {
        addSubview(contentViewFavorite)
        contentViewFavorite.addSubview(imagePerson)
        contentViewFavorite.addSubview(emptyLabel)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            contentViewFavorite.topAnchor.constraint(equalTo: topAnchor),
            contentViewFavorite.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentViewFavorite.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentViewFavorite.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            emptyLabel.topAnchor.constraint(equalTo: contentViewFavorite.topAnchor, constant: 60),
            emptyLabel.leadingAnchor.constraint(equalTo: contentViewFavorite.leadingAnchor,constant: 20),
            emptyLabel.trailingAnchor.constraint(equalTo: contentViewFavorite.trailingAnchor,constant: -20),
            
            imagePerson.topAnchor.constraint(equalTo: emptyLabel.bottomAnchor,constant: 30),
            imagePerson.leadingAnchor.constraint(equalTo: contentViewFavorite.leadingAnchor),
            imagePerson.trailingAnchor.constraint(equalTo: contentViewFavorite.trailingAnchor),
            imagePerson.bottomAnchor.constraint(equalTo: contentViewFavorite.bottomAnchor)
        ])
    }
}
