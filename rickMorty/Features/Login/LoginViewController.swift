//
//  LoginViewController.swift
//  rickAndMorty
//
//  Created by Lorena on 01/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingAndColors()
        screen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func settingAndColors() {
        view.backgroundColor = .black
    }
}

//MARK: - LoginDelegate

extension LoginViewController: LoginDelegate {
    func tappedSinginButton() {
        
    }
    
    func tappedRegisterButton() {
        let vc:RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func tappedForgotPasswordButton() {
        let vc:ForgotPasswordViewController = ForgotPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
