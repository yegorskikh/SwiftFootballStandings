
//
//  SelectedSeasonPresenter.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

class SelectedSeasonPresenter {
    
    // MARK: - Properties
    
    weak var view: SelectedSeasonVC?
    let networkService: SelectedSeasonNetworkService
    
    private var dataArray = [Standing]()
    
    var pickerData = ["CL", "Relegation", "Actual"]
    
    // MARK: - Init
    
    init(view: SelectedSeasonVC, networkService: SelectedSeasonNetworkService){
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
                    let data = response.data,
                    let dataArray = data.standings,
                    let title = data.abbreviation
                else {
                    self.view?.showErrorAlert(text: "something with the data")
                    return
                }
                
                DispatchQueue.main.async {
                    self.view?.setTitle(title)
                    self.dataArray = dataArray
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
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectedSeasonCell.identifier, for: indexPath) as! SelectedSeasonCell
        
        guard
            let name = dataArray[indexPath.row].team?.shortDisplayName,
            let urlImage = dataArray[indexPath.row].team?.logos?.first?.href,
            let point = findPoint(stat: dataArray[indexPath.row].stats ?? [])
        else {
            return UITableViewCell()
        }
        cell.configureCell(urlImage: urlImage, titleTeam: name, point: point)
        return cell
    }
    
    func calledPikerView(title: String) {
        switch title {
        case "CL":
            let newArray = findLC(arr: dataArray)
            dataArray = newArray
        case "Relegation":
            let newArray = findRelegation(arr: dataArray)
            dataArray = newArray
        case "Actual":
            self.getData()
        default:
            break
        }
        
        DispatchQueue.main.async {
            self.view?.reloadData()
        }
        
    }
    
    // MARK: - Private method
    
    private func findPoint(stat: [Stat]) -> String? {
        guard
            let index = stat.firstIndex(where: { $0.name == "points" })
        else {
            return nil
        }
        
        let value = stat[index].displayValue!
        return value
    }
    
    private func findLC(arr: [Standing]) -> [Standing] {
        return dataArray.filter { $0.note?.description == "Champions League" }
    }
    
    private func findRelegation(arr: [Standing]) -> [Standing] {
        return dataArray.filter { $0.note?.description == "Relegation" }
    }
    
}


