//
//  FavoritesVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/8/23.
//

import UIKit

class FavoritesVC: UIViewController {
    
    var screen: FavoritesScreen?
    var viewModel: FavoritosViewModel = FavoritosViewModel()
    var id: [Int] = []
    
    override func loadView() {
        screen = FavoritesScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configCollectionView(delegate: self, Source: self)
        viewModel.delegate(delegate: self)
        viewModel.testeFirebase()
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
}

//MARK:  - UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource

extension FavoritesVC: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSectionPopularFavotitos
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        viewModel.userShouldInteractWithCollection(collectionView: collectionView)
        return viewModel.whichCellShouldShow(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.sizeForItemAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc: DetalisVC = DetalisVC()
        vc.id = viewModel.getCaracterId(indexPath: indexPath)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:  - FavoritosViewModelProtocol

extension FavoritesVC: FavoritosViewModelProtocol {
    func succes() {
        DispatchQueue.main.async {
            self.screen?.collectionView.reloadData()
        }
    }
    
    func error() {
        
    }
}
