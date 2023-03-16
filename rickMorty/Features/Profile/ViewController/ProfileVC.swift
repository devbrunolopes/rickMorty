//
//  ProfileVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/15/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    var screen: ProfileScreen?
    
    override func loadView() {
        screen = ProfileScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
    
}

//MARK: Extension ProfileScreenProtocol

extension ProfileVC: ProfileScreenProtocol {
    func actionEditButton() {
        
    }
    
    func actionEndButton() {
        let vc:LoginViewController = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
