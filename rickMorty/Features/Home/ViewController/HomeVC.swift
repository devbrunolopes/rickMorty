//
//  HomeVC.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 2/21/23.
//

import UIKit

protocol HomeVCProtocol: AnyObject {
    func reloadErrorButton()
}

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableView(delegate: self, dataSource: self)
        screen?.configSearch(delegate: self)
        viewModel.fetchHome(tableView: screen?.tableView ?? UITableView())
        viewModel.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        viewModel.savedButtonFavoritos()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.whichCellShouldShow(tableview: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: DetalisVC = DetalisVC()
        vc.id = viewModel.getCaracterId(indexPath: indexPath)
        if viewModel.favoriteIds.contains(viewModel.getCaracterId(indexPath: indexPath)) {
            vc.isFavorito = true
        }
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

//MARK: - UISearchBarDelegate

extension HomeVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchBarPesquisa(searchText: searchText, tableView: screen?.tableView ?? UITableView())
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        screen?.addSearch.resignFirstResponder()
    }
}

//MARK: - HomeViewModelProtocol

extension HomeVC: HomeViewModelProtocol{
    func requisicaoSucces() {
        DispatchQueue.main.async {
            self.screen?.tableView.reloadData()
        }
    }
    
    func requisicaoError() {
        DispatchQueue.main.async {
            let vc: ErrorGenericVC = ErrorGenericVC()
            vc.errorGenericProtocol = self
            self.present(vc, animated: true)
        }
    }
}

//MARK: - ErrorGenericScreenProtocol

extension HomeVC: ErrorGenericScreenProtocol {
    func actionReloadHome() {
        viewModel.fetchHome(tableView: screen?.tableView ?? UITableView())
        dismiss(animated: true)
    }
}

