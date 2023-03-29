//
//  HomeVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/21/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    var viewModel: HomeViewModel = HomeViewModel()
    var isError: Bool = false
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableView(delegate: self, dataSource: self)
        viewModel.fetchHome(tableView: screen?.tableView ?? UITableView())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

//MARK: Extension UITableViewDelegate, UITableViewDataSource

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isError {
            return 1
        } else {
            return viewModel.numberOfRowsInSection
        }
    } 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isError {
            let cell: ErrorCell? = tableView.dequeueReusableCell(withIdentifier: ErrorCell.identifier, for: indexPath) as? ErrorCell
            return cell ?? UITableViewCell()
        } else {
            let cell: HomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
            cell?.setupCell(data: viewModel.data[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isError {
            return 230
        } else {
            return 120
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isError {
            viewModel.fetchHome(tableView: screen?.tableView ?? UITableView())
        } else {
            let vc: DetalisVC = DetalisVC()
            vc.id = viewModel.getCaracterId(indexPath: indexPath)
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
}




