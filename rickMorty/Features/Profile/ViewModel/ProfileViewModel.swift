//
//  ProfileViewModel.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/17/23.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import Firebase
import AlamofireImage

class ProfileViewModel: UIViewController {
    
    let storage = Storage.storage().reference()
    var user: [User] = []
    let firestore = Firestore.firestore()
    var alert: Alert?
    let imagePicker: UIImagePickerController = UIImagePickerController()
    let currentUser = Auth.auth().currentUser
    var userId = Auth.auth().currentUser?.uid
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert(controller: self)
    }
    
    func getUserData(name: UITextField, email: UITextField,image: UIImageView){
        firestore.collection("users").getDocuments(completion: { snapshot, error in
            if error == nil {
                if let snapshot {
                    DispatchQueue.main.async {
                        self.user = snapshot.documents.map({ document in
                            return User(name: document["name"] as? String ?? "",
                                        email: document["email"] as? String ?? "",
                                        image: document["image"] as? String ?? "")
                        })
                        self.popularView(index: self.getIndex(email: self.currentUser?.email ?? ""), nameTextField: name, emailTextField: email, image: image)
                    }
                }
            }
        })
    }
    
    private func popularView(index: Int, nameTextField: UITextField, emailTextField: UITextField, image: UIImageView) {
        nameTextField.text = user[index].name
        emailTextField.text = user[index].email
        let url = URL(string: user[index].image) ?? URL(fileURLWithPath: "")
        image.af.setImage(withURL: url)
    }
    
    private func getIndex(email: String) -> Int {
        let index = user.firstIndex { $0.email == email } ?? 0
        return index
    }
    
    func savedImage(image: UIImage){
        
        guard let imageData = image.pngData() else { return }
        
        storage.child("image/file.png").putData(imageData,metadata: nil) { _, error in
            guard error == nil else {
                print("failed to upload", String(describing: error?.localizedDescription))
                return
            }
            
            self.storage.child("image/file.png").downloadURL { url, error in
                guard let url = url, error == nil else {return}
                let urlString = url.absoluteString
                let doc = self.firestore.collection("users").document(self.userId ?? "")
                doc.updateData([
                    "image": urlString
                ])
            }
        }
    }
    
}
