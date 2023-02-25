//
//  HomeScreen.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/21/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var addSearch: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Digite o nome de um Personagem"
        search.searchBarStyle = .minimal
        return search
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor(red: 233/255, green: 223/255, blue: 252/255, alpha: 1)
        tv.separatorStyle = .singleLine
        tv.showsVerticalScrollIndicator = false
        tv.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
        backgroundColor = UIColor(red: 233/255, green: 223/255, blue: 252/255, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}

//MARK: Extension ViewCode

extension HomeScreen: ViewCode {
    func configElements() {
        addSubview(addSearch)
        addSubview(tableView)
     
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            addSearch.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 15),
            addSearch.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            addSearch.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            addSearch.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: addSearch.bottomAnchor,constant: 30),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -40),
        ])
    }
}

