//
//  HomeTableViewCell.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/24/23.
//

import UIKit
import AlamofireImage

protocol HomeTableViewCellProtocol: AnyObject {
    func actionHeartButton()
}

class HomeTableViewCell: UITableViewCell {
    
    weak var delegate: HomeTableViewCellProtocol?
    func delegate(delegate: HomeTableViewCellProtocol){
        self.delegate = delegate
    }
    
    var heartFull = false
    
    lazy var contentViewHome: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var imagePerson: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imageHome")
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "name"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var specieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "specie"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    static let identifier: String = "HomeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedHeartButton(){
        delegate?.actionHeartButton()
    }
    
    func actionHeartButton(button: UIButton){
        if (heartFull == false){
            button.tintColor = .red
            heartFull = true
        } else {
            button.tintColor = .white
            heartFull = false
        }
    }
    
    func setupCell(data: Result){
        nameLabel.text = "Nome: \(data.name ?? "")"
        specieLabel.text = "Specie: \(data.species ?? "")"
        let url = URL(string: "\(data.image ?? "")") ?? URL(fileURLWithPath: "")
        imagePerson.af.setImage(withURL: url)
    }
}

//MARK: Extension ViewCode

extension HomeTableViewCell: ViewCode {
    func configElements() {
        addSubview(contentViewHome)
        contentViewHome.addSubview(imagePerson)
        contentViewHome.addSubview(nameLabel)
        contentViewHome.addSubview(specieLabel)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            contentViewHome.topAnchor.constraint(equalTo: topAnchor),
            contentViewHome.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            contentViewHome.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            contentViewHome.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            
            imagePerson.topAnchor.constraint(equalTo: contentViewHome.topAnchor),
            imagePerson.leadingAnchor.constraint(equalTo: contentViewHome.leadingAnchor),
            imagePerson.bottomAnchor.constraint(equalTo: contentViewHome.bottomAnchor),
            imagePerson.heightAnchor.constraint(equalToConstant: 110),
            imagePerson.widthAnchor.constraint(equalToConstant: 90),
            
            nameLabel.centerYAnchor.constraint(equalTo: imagePerson.centerYAnchor,constant: -15),
            nameLabel.leadingAnchor.constraint(equalTo: imagePerson.trailingAnchor, constant: 20),
            
            specieLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 5),
            specieLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
}



