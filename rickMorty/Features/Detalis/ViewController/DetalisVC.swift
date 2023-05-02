//
//  DetalisVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/25/23.
//

import UIKit

protocol FavoritosButton: AnyObject {
    func actionFavortiosButton(cell: UICollectionViewCell, isActive: Bool)
}

class DetalisVC: UIViewController {
    
    var screen: DetalisScrren?
    var viewModel: DetalisViewModel = DetalisViewModel()
    var service: DetalisList = DetalisList()
    var id: Int = 100
    var isFavorito = false
    var delegate: FavoritosButton?
    
    override func loadView() {
        screen = DetalisScrren()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        viewModel.fetcDetails(id: id)
        viewModel.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoritosFull(isFavorite: isFavorito)
    }
    
    func favoritosFull(isFavorite: Bool){
        if isFavorite {
            screen?.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            screen?.buttonFavoritos = true
        }
    }
}

//MARK: - DetalisScrrenProtocol

extension DetalisVC: DetalisScrrenProtocol {
    func actionButtonFavoritos() {
        screen?.actionHeartButton()
        if screen?.buttonFavoritos == true {
            viewModel.saveFovrites(id: id)
        } else {
            viewModel.removeFavorites(id: id)
        }
    }
    
    func actionButtonBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK: - DetalisViewModelProtocol

extension DetalisVC: DetalisViewModelProtocol{
    func requisicaoError() {
        DispatchQueue.main.async {
            let vc: ErrorGenericVC = ErrorGenericVC()
            vc.errorGenericProtocol = self
            self.present(vc, animated: true)
        }
    }
    
    func requisicaoSucces() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.screen?.setupView(data: self.viewModel.data)
            self.screen?.activityIndicator.stopAnimating()
        }
    }
}

//MARK: - ErrorGenericScreenProtocol

extension DetalisVC: ErrorGenericScreenProtocol{
    func actionReloadHome() {
        viewModel.fetcDetails(id: id)
        dismiss(animated: true)
    }
}
