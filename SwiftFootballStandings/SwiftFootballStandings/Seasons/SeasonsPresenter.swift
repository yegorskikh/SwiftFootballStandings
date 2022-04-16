//
//  SeasonsPresenter.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

class SeasonsPresenter {
    
    weak var view: SeasonsVC!
    var networkService: SeasonsNetworkService!
    
    var dataArray: [DetailSeason] = []
    
    init(view: SeasonsVC, networkService: SeasonsNetworkService) {
        self.view = view
        self.networkService = networkService
    }
    
    func getData() {
        self.view?.startLoader()
        
        networkService.getData { [weak self] result in
            
            guard let `self` = self else { return }
            
            switch result {
            case .success(let response):
                guard
                    let data = response.data?.seasons
                else {
                    self.view?.showErrorAlert(text: "something with the data")
                    return
                }
                
                DispatchQueue.main.async {
                    self.dataArray = data
                    self.view?.reloadData()
                    self.view.stopLoader()
                }
            case .failure(let error):
                self.view?.showErrorAlert(text: error.rawValue)
                self.view.stopLoader()
            }
        }
    }
    
    func getDataForNextRequest(indexPath: IndexPath) -> (String, Int)? {
        let id = networkService.seasonsId
        guard let years = dataArray[indexPath.row].year else { return nil }
        
        return (id, years)
    }
    
    func numberOfRowsInSectionCount() -> Int {
        dataArray.count
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SeasonsCell.identifier, for: indexPath) as! SeasonsCell

        guard
            let name = dataArray[indexPath.row].displayName,
            let year = dataArray[indexPath.row].year,
            let startDate = dataArray[indexPath.row].startDate,
                let endDate = dataArray[indexPath.row].endDate
        else {
            return UITableViewCell()
        }
        cell.configureCell(name: name, year: year, startDate: startDate, endDate: endDate)
        return cell
    }
    
}

