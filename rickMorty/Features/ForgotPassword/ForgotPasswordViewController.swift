//
//  ForgotPasswordViewController.swift
//  rickAndMorty
//
//  Created by Lorena on 07/02/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    var screen: ForgotPasswordScreen?
    
    override func loadView() {
        screen = ForgotPasswordScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
       
        view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

//MARK: -Extensão

extension ForgotPasswordViewController: ForgotPasswordDelegate {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
