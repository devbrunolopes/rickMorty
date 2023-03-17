//
//  ProfileVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/15/23.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

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
        viewModel.getUserData(name: screen?.nameTextField ?? UITextField(), email: screen?.emailTextField ?? UITextField())
    }
    
    func configImagePicker(){
        imagePicker.delegate = self
    }
}


//MARK: Extension ProfileScreenProtocol

extension ProfileVC: ProfileScreenProtocol {
    func actionEditButton() {
        viewModel.actionEditButton(imagePicker: imagePicker)
        //        self.alert?.alertEditPhoto(completion: { option in
        //            switch option {
        //            case .camera:
        //                self.imagePicker.sourceType = .camera
        //                self.present(self.imagePicker, animated: true)
        //
        //            case .library:
        //                self.imagePicker.sourceType = .photoLibrary
        //                self.present(self.imagePicker, animated: true)
        //
        //            case .cancel:
        //                break
        //            }
        //        })
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
        }
        picker.dismiss(animated: true)
    }
}

