//
//  DetalisScrren.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/25/23.
//

import UIKit

protocol DetalisScrrenProtocol: AnyObject {
    func actionButtonBack()
    func actionButtonFavoritos()
}

class DetalisScrren: UIView {
    
    weak var delegate: DetalisScrrenProtocol?
    func delegate(delegate:DetalisScrrenProtocol){
        self.delegate = delegate
    }
    
    var buttonFavoritos = false
    
    lazy var imagePerson: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(tappedFavoritosButton), for: .touchUpInside)
        return button
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.style = .large
        loading.color = .white
        loading.startAnimating()
        return loading
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var spaceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var localizinonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var generoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedBackButton(){
        delegate?.actionButtonBack()
    }
    
    @objc func tappedFavoritosButton(){
        delegate?.actionButtonFavoritos()
    }
    
    func actionHeartButton(){
        if buttonFavoritos {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            buttonFavoritos = false
        } else {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            buttonFavoritos = true
        }
    }
    
    func setupView(data: [Result]) {
        nameLabel.text = "Nome: \(data[0].name ?? "Nome:")"
        spaceLabel.text = "Specie: \(data[0].species ?? "Specie:")"
        statusLabel.text = "Status: \(data[0].status ?? "Status:")"
        generoLabel.text = "Genero: \(data[0].gender ?? " Genero:")"
        localizinonLabel.text = "Localizacao: \(data[0].location?.name ?? "")"
        let url = URL(string: "\(data[0].image ?? "")") ?? URL(fileURLWithPath: "")
        imagePerson.af.setImage(withURL: url)
        descriptionLabel.text = "Descrição do Personagem"
    }
}

//MARK: -  ViewCode

extension DetalisScrren: ViewCode {
    func configElements() {
        addSubview(imagePerson)
        addSubview(backButton)
        addSubview(heartButton)
        addSubview(activityIndicator)
        addSubview(descriptionLabel)
        addSubview(nameLabel)
        addSubview(spaceLabel)
        addSubview(localizinonLabel)
        addSubview(statusLabel)
        addSubview(generoLabel)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            imagePerson.topAnchor.constraint(equalTo: topAnchor),
            imagePerson.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagePerson.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagePerson.heightAnchor.constraint(equalToConstant: 350),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            
            heartButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            heartButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            heartButton.heightAnchor.constraint(equalToConstant: 20),
            heartButton.widthAnchor.constraint(equalToConstant: 20),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imagePerson.bottomAnchor,constant: 70),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            nameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            
            spaceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 18),
            spaceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            spaceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            localizinonLabel.topAnchor.constraint(equalTo: spaceLabel.bottomAnchor,constant: 18),
            localizinonLabel.leadingAnchor.constraint(equalTo: spaceLabel.leadingAnchor),
            localizinonLabel.trailingAnchor.constraint(equalTo: spaceLabel.trailingAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: localizinonLabel.bottomAnchor,constant: 18),
            statusLabel.leadingAnchor.constraint(equalTo: localizinonLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: localizinonLabel.trailingAnchor),
            
            generoLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 18),
            generoLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            generoLabel.trailingAnchor.constraint(equalTo: statusLabel.trailingAnchor)
        ])
    }
}
