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
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}
