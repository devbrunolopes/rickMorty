//
//  ProfileViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/17/23.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: UIViewController {
    
    let storage = Storage.storage().reference()
    var user: [User] = []
    let currentUser = Auth.auth().currentUser
    let firestore = Firestore.firestore()
    var alert: Alert?
    let imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert(controller: self)
    }
    
    func getUserData(name: UITextField, email: UITextField){
        firestore.collection("usuarios").getDocuments(completion: { snapshot, error in
            if error == nil {
                if let snapshot {
                    DispatchQueue.main.async {
                        self.user = snapshot.documents.map({ document in
                            return User(name: document["name"] as? String ?? "",
                                        email: document["email"] as? String ?? "")
                        })
                        self.popularView(index: self.getIndex(email: self.currentUser?.email ?? ""), nameTextField: name, emailTextField: email)
                    }
                }
            }
        })
    }
    
    private func popularView(index: Int, nameTextField: UITextField, emailTextField: UITextField) {
        nameTextField.text = user[index].name
        emailTextField.text = user[index].email
    }
    
    private func getIndex(email: String) -> Int {
        let index = user.firstIndex { $0.email == email } ?? 0
        return index
    }
    
    func actionEditButton(imagePicker: UIImagePickerController){
        
        DispatchQueue.main.async {
            self.alert?.alertEditPhoto(completion: { option in
                switch option {
                case .camera:
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true)
                    
                case .library:
                    imagePicker.sourceType = .photoLibrary
                    self.present(imagePicker, animated: true)
                    
                case .cancel:
                    break
                }
            })
        }
    }
}
