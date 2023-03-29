//
//  IsErrorCell.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/27/23.
//

import UIKit

protocol ErrorCellProtocol: AnyObject {
    func actionButtonError()
}

class ErrorCell: UITableViewCell {
    
    weak var delegate: ErrorCellProtocol?
    func delegate(delegate: ErrorCellProtocol){
        self.delegate = delegate
    }
    
    lazy var contentViewError: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
        return view
    }()
    
    lazy var imageError: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "exclamationmark.square.fill")
        image.tintColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        return image
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Erro ao carregar, Tente novamente!"
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var errorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tentar novamente", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedErrorButton), for: .touchUpInside)
        return button
    }()
    
    
    static let identifier: String = "ErrorCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedErrorButton(){
        delegate?.actionButtonError()
    }
    
}

extension ErrorCell: ViewCode {
    func configElements() {
        addSubview(contentViewError)
        contentViewError.addSubview(imageError)
        contentViewError.addSubview(errorLabel)
        contentViewError.addSubview(errorButton)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            contentViewError.topAnchor.constraint(equalTo: topAnchor,constant: 30),
            contentViewError.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            contentViewError.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            contentViewError.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageError.topAnchor.constraint(equalTo: contentViewError.topAnchor),
            imageError.widthAnchor.constraint(equalToConstant: 100),
            imageError.heightAnchor.constraint(equalToConstant: 100),
            imageError.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: imageError.bottomAnchor,constant: 15),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            errorButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor,constant: 15),
            errorButton.centerXAnchor.constraint(equalTo: imageError.centerXAnchor),
            errorButton.widthAnchor.constraint(equalToConstant: 180)
        ])
    }
}
