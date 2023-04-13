//
//  ErrorGenericVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/30/23.
//

import UIKit

class ErrorGenericVC: UIViewController {
    
    var screen: ErrorGenericScreen?
    var errorGenericProtocol: ErrorGenericScreenProtocol?
    
    override func loadView() {
        screen = ErrorGenericScreen()
        screen?.delegate = errorGenericProtocol
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
