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
    }
    
}
