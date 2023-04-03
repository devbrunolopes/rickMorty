//
//  FavoritosViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/13/23.
//

import UIKit

class FavoritosViewModel: UIViewController {
    
    var dataPopular: [Result] = []
    
    var numberOfRowsInSectionPopularFavotitos: Int{
        if dataPopular.count == 0 {
            return 1
        } else {
            return dataPopular.count
        }
    }
    
    func whichCellShouldShow(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if dataPopular.count == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.identifier, for: indexPath)
            return cell
        }  else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonsCollectionViewCell.identifier, for: indexPath)
            return cell
        }
    }
    
    func sizeForItemAt() -> CGSize {
        if dataPopular.count != 0 {
            return CGSize(width: 130, height: 130)
        } else {
            return CGSize(width: 300, height: 400)
        }
    }
    
    func userShouldInteractWithCollection(collectionView: UICollectionView) {
        if dataPopular.count == 0 {
            collectionView.isUserInteractionEnabled = false
        } else {
            collectionView.isUserInteractionEnabled = true
        }
    }
}


