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
    var id: Int = 1
    var buttonFavoritos = false
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
            self.present(vc, animated: true)
        }
    }
    
    func requisicaoSucces() {
        DispatchQueue.main.async {
            self.screen?.setupView(data: self.viewModel.data)
        }
    }
}
