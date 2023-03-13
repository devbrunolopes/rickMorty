//
//  FavoritesScreen.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/8/23.
//

import UIKit

class FavoritesScreen: UIView {
    
    lazy var favoritesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favoritos 😝"
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
        collectionView.register(PersonsCollectionViewCell.self, forCellWithReuseIdentifier: PersonsCollectionViewCell.identifier)
        collectionView.register(EmptyCollectionViewCell.self, forCellWithReuseIdentifier: EmptyCollectionViewCell.identifier)
        collectionView.register(ErrorCollectionViewCell.self, forCellWithReuseIdentifier: ErrorCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        collectionView.setCollectionViewLayout(layout, animated: false)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
        backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCollectionView(delegate: UICollectionViewDelegate, Source: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = Source
    }
    
}

extension FavoritesScreen: ViewCode {
    func configElements() {
        addSubview(favoritesLabel)
        addSubview(collectionView)
    }
    
    func configConstraint() {
            NSLayoutConstraint.activate([
                
                favoritesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                favoritesLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
                favoritesLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
                
                collectionView.topAnchor.constraint(equalTo: favoritesLabel.bottomAnchor,constant: 30),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }
    
    
}
