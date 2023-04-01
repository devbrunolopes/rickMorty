//
//  DetalisViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/27/23.
//

import UIKit

protocol DetalisViewModelProtocol: AnyObject {
    func requisicaoError()
    func requisicaoSucces()
}

class DetalisViewModel: UIViewController {
    var delegate: DetalisViewModelProtocol?
    func delegate(delegate:DetalisViewModelProtocol){
        self.delegate = delegate
    }
    
    var data: [Result] = []
    var service: DetalisService = DetalisService()
    
    func fetcDetails(id: Int){
        service.getDetalis(id: id) { result, failure in
            if let result {
                self.data.append(result)
                self.delegate?.requisicaoSucces()
            } else {
                self.delegate?.requisicaoError()
            }
        }
    }
}

