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
    
    lazy var scrollView: UIScrollView = {
       let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsHorizontalScrollIndicator = true
        sv.isScrollEnabled = true
        sv.backgroundColor = .red
        return sv
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemCyan
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(viewStack)
        return stackView
    }()
    
    lazy var viewStack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeScreen: ViewCode {
    func configElements() {
        addSubview(addSearch)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
    }
    
    func configConstraint() {
        NSLayoutConstraint.activate([
            
            addSearch.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 15),
            addSearch.leadingAnchor.constraint(equalTo: leadingAnchor),
            addSearch.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: addSearch.bottomAnchor,constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            viewStack.topAnchor.constraint(equalTo: topAnchor),
            viewStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewStack.heightAnchor.constraint(equalToConstant: 160),
            
            
        ])
        
    }
    
    
}
