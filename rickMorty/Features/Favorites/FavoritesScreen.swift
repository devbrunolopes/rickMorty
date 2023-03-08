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
        label.text = "Favoritos"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .darkGray
        // Register Cell
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
        backgroundColor = .lightGray
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
                
                favoritesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 30),
                favoritesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                collectionView.topAnchor.constraint(equalTo: favoritesLabel.bottomAnchor,constant: 30),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                
                
            ])
    }
    
    
}
