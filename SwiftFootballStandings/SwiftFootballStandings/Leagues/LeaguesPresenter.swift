//
//  AvailableLeaguesPresenter.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit



final class LeaguesPresenter {
    
    // MARK: - Property
    
    weak var view: LeaguesVC?
    private let networkService: LeaguesNetworkService
    
    var dataArray: [LeaguesModel] = []
    
    // MARK: - Init
    
    init(view: LeaguesVC, networkService: LeaguesNetworkService) {
        self.view = view
        self.networkService = networkService
    }
    
    // MARK: - Internal method
    
    func getData() {
        self.view?.startLoader()
        
        networkService.getData { [weak self] result in
            
            guard let `self` = self else { return }
            
            switch result {
            case .success(let response):
                guard
                    let data = response.data
                else {
                    self.view?.showErrorAlert(text: "something with the data")
                    return
                }
                
                DispatchQueue.main.sync {
                    self.dataArray = data
                    self.view?.reloadData()
                    self.view?.stopLoader()
                }
             
            case .failure(let error):
                    self.view?.showErrorAlert(text: error.rawValue)
                    self.view?.stopLoader()
               
            }
            
            
        }
        
    }
    
    func numberOfRowsInSectionCount() -> Int {
        dataArray.count
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaguesCell.identifier, for: indexPath) as! LeaguesCell
    
        guard
            let title = dataArray[indexPath.row].name,
            let abbr = dataArray[indexPath.row].abbr,
            let imageUrl = dataArray[indexPath.row].logos?.light
        else {
            return UITableViewCell()
        }
        cell.setupCell(titleLeague: title, abbrLeague: abbr, imageUrl: imageUrl)
        
        return cell
    }
    
    
    func getIdSeason(indexPath: IndexPath) -> String? {
        guard let id = dataArray[indexPath.row].id else { return nil }
        return id
    }
    
}
