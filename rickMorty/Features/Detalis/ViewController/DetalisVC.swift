//
//  DetalisVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/25/23.
//

import UIKit

class DetalisVC: UIViewController {
    var screen: DetalisScrren?
    var viewModel: DetalisViewModel = DetalisViewModel()
    var service: DetalisService = DetalisService()
    var id: Int = 1
    
    override func loadView() {
        screen = DetalisScrren()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        fetcDetails()
    }
    
    func fetcDetails(){
        service.getDetalis(id: id) { result, failure in
            if let result {
                self.viewModel.data.append(result)
            } else {
                
            }
            DispatchQueue.main.async {
                self.screen?.setupView(data: self.viewModel.data)
            }
        }
    }
    
}

//MARK: DetalisScrrenProtocol

extension DetalisVC: DetalisScrrenProtocol {
    func actionButtonBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
