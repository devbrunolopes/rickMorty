//
//  DetalisVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/25/23.
//

import UIKit

protocol DetalisVCFavoritosProtocol: AnyObject {
    func addFavoritos()
}

class DetalisVC: UIViewController {
    
    var delegate: DetalisVCFavoritosProtocol?
    var screen: DetalisScrren?
    var viewModel: DetalisViewModel = DetalisViewModel()
    var service: DetalisService = DetalisService()
    var id: Int = 1
    var heartFull = false
    
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
