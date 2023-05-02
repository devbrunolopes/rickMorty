//
//  HomeScreen.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/21/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func dismissKeyboard()
}

class HomeScreen: UIView {
    weak var delegate: HomeScreenProtocol?
    func delegate(delegate: HomeScreenProtocol){
        self.delegate = delegate
    }
  
    
    lazy var personLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Personagens Rick and Morty"
        label.textColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var addSearch: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Digite o nome de um Personagem"
        search.searchBarStyle = .minimal
        search.searchTextField.backgroundColor = UIColor(red: 81/255, green: 179/255, blue: 201/255, alpha: 0.7)
        return search
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
        tv.separatorStyle = .singleLine
        tv.showsVerticalScrollIndicator = false
        tv.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tv.register(HomeTableViewErrorTableViewCell.self, forCellReuseIdentifier: HomeTableViewErrorTableViewCell.identifier)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
        backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 47/255, alpha: 1)
        dismissKeyboard()
        configAcessibilidade()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func hideKeyboard() {
        delegate?.dismissKeyboard()
    }
    
    func dismissKeyboard(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func configSearch(delegate: UISearchBarDelegate){
        addSearch.delegate = delegate
    }
    
    func configAcessibilidade(){
        personLabel.isAccessibilityElement = true
        addSearch.isAccessibilityElement = true
        
        addSearch.accessibilityLabel = "Digite o nome de um Personagem, toque duas vezes para abrir o teclado na parte inferior da tela"
        
        personLabel.accessibilityTraits = .header
        addSearch.accessibilityTraits = .searchField
        tableView.accessibilityTraits = .none
        
        accessibilityElements = [personLabel,addSearch,tableView]
    }
    
}

//MARK: - ViewCode

extension HomeScreen: ViewCode {
    func configElements() {
        addSubview(personLabel)
        addSubview(addSearch)
        addSubview(tableView)
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            personLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            personLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            personLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            
            addSearch.topAnchor.constraint(equalTo: personLabel.bottomAnchor, constant: 15),
            addSearch.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            addSearch.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            addSearch.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: addSearch.bottomAnchor,constant: 30),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

