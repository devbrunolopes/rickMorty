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
    let imagePicker: UIImagePickerController = UIImagePickerController()
    let storage = Storage.storage().reference()
    var user: [User] = []
    let currentUser = Auth.auth().currentUser
    let firestore = Firestore.firestore()
    
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
        getUserData()
    }
    
    func configImagePicker(){
        imagePicker.delegate = self
    }
    
    private func getUserData(){
        firestore.collection("usuarios").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot {
                    DispatchQueue.main.async {
                        self.user = snapshot.documents.map({ document in
                            return User(name: document["name"] as? String ?? "",
                                        email: document["email"] as? String ?? "")
                        })
                        self.popularView(index: self.getIndex(email: self.currentUser?.email ?? ""))
                    }
                }
            }
        }
    }
    private func popularView(index: Int) {
        screen?.nameTextField.text = user[index].name
        screen?.emailTextField.text = user[index].email
    }
    
    private func getIndex(email: String) -> Int {
        let index = user.firstIndex { $0.email == email } ?? 0
        return index
    }
    
}


//MARK: Extension ProfileScreenProtocol

extension ProfileVC: ProfileScreenProtocol {
    func actionEditButton() {
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
