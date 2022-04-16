//
//  ViewController.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

class LeaguesVC: UIViewController {
    
    // MARK: - Properties
    
    private let alView = LeaguesView()
    var presenter: LeaguesPresenter!
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = alView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getData()
    }
    
    // MARK: - Internal method
    
    func reloadData() {
        alView.tableView.reloadData()
    }
    
    func startLoader() {
        alView.isShowLoader = true
    }
    
    func stopLoader() {
        alView.isShowLoader = false
    }
    
    // MARK: - Private method
    
    private func setDelegates() {
        alView.tableView.delegate = self
        alView.tableView.dataSource = self
    }
    
    private func setupNavigationController() {
        self.title = "Available Leagues"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}

// MARK: - UITableViewDataSource

extension LeaguesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSectionCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.cellForRowAt(tableView: tableView, indexPath: indexPath)
    }    
    
}

// MARK: - UITableViewDelegate

extension LeaguesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let id = presenter.getIdSeason(indexPath: indexPath) {
            let coordinator = SeasonsCoordinator(navController: self.navigationController!, seasonsId: id)
            coordinator.assembly()
        }
        
    }
    
    
}
