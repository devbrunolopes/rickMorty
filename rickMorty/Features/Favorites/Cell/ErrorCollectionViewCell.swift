//
//  ErrorCollectionViewCell.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/13/23.
//

import UIKit

class ErrorCollectionViewCell: UICollectionViewCell {
    
    lazy var contentViewFavorite: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Erro ao carregar. Tente Novamente!"
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageError: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "exclamationmark.circle")
        image.tintColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        return image
    }()
    
    static let identifier:String = "ErrorCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: ViewCode

extension ErrorCollectionViewCell: ViewCode {
    func configElements() {
        addSubview(contentViewFavorite)
        contentViewFavorite.addSubview(errorLabel)
        contentViewFavorite.addSubview(imageError)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            contentViewFavorite.topAnchor.constraint(equalTo: topAnchor),
            contentViewFavorite.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentViewFavorite.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentViewFavorite.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: contentViewFavorite.safeAreaLayoutGuide.topAnchor,constant: 30),
            errorLabel.leadingAnchor.constraint(equalTo: contentViewFavorite.leadingAnchor,constant: 20),
            errorLabel.trailingAnchor.constraint(equalTo: contentViewFavorite.trailingAnchor,constant: -20),
            
            imageError.topAnchor.constraint(equalTo: errorLabel.bottomAnchor,constant: 20),
            imageError.heightAnchor.constraint(equalToConstant: 150),
            imageError.widthAnchor.constraint(equalToConstant: 150),
            imageError.centerXAnchor.constraint(equalTo: contentViewFavorite.centerXAnchor)
        ])
    }
}
