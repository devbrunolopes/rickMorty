//
//  DetalisVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/25/23.
//

import UIKit

class DetalisVC: UIViewController {
    var screen: DetalisScrren?
    
    override func loadView() {
        screen = DetalisScrren()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
    
}

//MARK: DetalisScrrenProtocol

extension DetalisVC: DetalisScrrenProtocol {
    func actionButtonBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
