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
        sv.isScrollEnabled = true
        sv.contentInsetAdjustmentBehavior = .never
        sv.backgroundColor = .black
        sv.bounces = true
        sv.showsVerticalScrollIndicator = false
//        sv.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)

        return sv
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.spacing = 3
        stackView.alignment = .fill
        stackView.distribution = .fill
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 1000)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(views: [HomeView]){
        for view in views {
            stackView.addArrangedSubview(view)
        }
    }
    
}

//MARK: Extension ViewCode

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
            addSearch.heightAnchor.constraint(equalToConstant: 40),
            
            scrollView.topAnchor.constraint(equalTo: addSearch.bottomAnchor,constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -45),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        
        ])
    }
}
