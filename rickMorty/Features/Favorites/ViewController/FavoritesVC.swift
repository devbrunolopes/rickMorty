//
//  FavoritesVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/8/23.
//

import UIKit

class FavoritesVC: UIViewController {
    
    var screen: FavoritesScreen?
    
    override func loadView() {
        screen = FavoritesScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configCollectionView(delegate: self, Source: self)
    }

}

extension FavoritesVC: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300 )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc: DetalisVC = DetalisVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
