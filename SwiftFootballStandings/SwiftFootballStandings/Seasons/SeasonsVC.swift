//
//  SeasonsVC.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

class SeasonsVC: UIViewController {
    
    // MARK: - Properties
    
    var presenter: SeasonsPresenter!
    private let sv = SeasonsView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = sv
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
        sv.tableView.reloadData()
    }
    
    func startLoader() {
        sv.isShowLoader = true
    }
    
    func stopLoader() {
        sv.isShowLoader = false
    }
    
    // MARK: - Private method
    
    private func setDelegates() {
        sv.tableView.delegate = self
        sv.tableView.dataSource = self
    }
    
    private func setupNavigationController() {
        self.title = "Available seasons"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        view.backgroundColor = .yellow
    }
}

// MARK: - UITableViewDataSource

extension SeasonsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSectionCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.cellForRowAt(tableView: tableView, indexPath: indexPath)
    }
    
}

// MARK: - UITableViewDelegate

extension SeasonsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        guard let dataForRequest = presenter.getDataForNextRequest(indexPath: indexPath) else { return }
        let coordinator = SelectedSeasonCoordinator(navController: self.navigationController!,
                                                    id: dataForRequest.0,
                                                    year: String(dataForRequest.1))
        coordinator.assembly()
        
    }
    
}
