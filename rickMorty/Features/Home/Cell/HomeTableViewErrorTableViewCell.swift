//
//  HomeTableViewErrorTableViewCell.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 4/17/23.
//

import UIKit

class HomeTableViewErrorTableViewCell: UITableViewCell {
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Personagem não encontrado ☹️"
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    static let identifier: String = "HomeTableViewErrorTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ViewCode

extension HomeTableViewErrorTableViewCell: ViewCode {
    func configElements() {
        addSubview(loginLabel)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: topAnchor,constant: 150),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 35),
            loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -35)
        ])
    }
}
