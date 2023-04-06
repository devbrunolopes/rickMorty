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
    
    static let identifier:String = "PersonsCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(data: Result){
        let url = URL(string: "\(data.image ?? "")") ?? URL(fileURLWithPath: "")
        imagePerson.af.setImage(withURL: url)
    }
}

//MARK: - ViewCode

extension PersonsCollectionViewCell: ViewCode {
    func configElements() {
        addSubview(contentViewFavorite)
        contentViewFavorite.addSubview(imagePerson)
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
            imagePerson.bottomAnchor.constraint(equalTo: contentViewFavorite.bottomAnchor)
        ])
    }
}
