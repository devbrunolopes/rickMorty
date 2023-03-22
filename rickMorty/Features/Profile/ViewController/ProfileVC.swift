//
//  ProfileVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/15/23.
//

import UIKit



class ProfileVC: UIViewController {
    
    var screen: ProfileScreen?
    var alert: Alert?
    let viewModel: ProfileViewModel = ProfileViewModel()
    let imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func loadView() {
        screen = ProfileScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        alert = Alert(controller: self)
        configImagePicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getUserData(name: screen?.nameTextField ?? UITextField(), email: screen?.emailTextField ?? UITextField(), image: screen?.imageProfile ?? UIImageView())
    }
    
    func configImagePicker(){
        imagePicker.delegate = self
    }
    
    func logicaAlert(){
        self.alert?.alertEditPhoto(completion: { option in
            switch option {
            case .camera:
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true)
                
            case .library:
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true)
                
            case .cancel:
                break
            }
        })
    }
}

//MARK: Extension ProfileScreenProtocol

extension ProfileVC: ProfileScreenProtocol {
    func actionEditButton() {
        logicaAlert()
    }
    
    func actionEndButton() {
        let vc:LoginViewController = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: Extendion UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.screen?.imageProfile.image = image
            viewModel.savedImage(image: screen?.imageProfile.image ?? UIImage())
        }
        picker.dismiss(animated: true)
    }
}

