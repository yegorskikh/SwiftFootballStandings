//
//  Coordinator.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

final class SelectedSeasonCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    private let navController: UINavigationController
    
    private let id: String
    private let year: String

    init(navController: UINavigationController, id: String, year: String) {
        self.navController = navController
        self.id = id
        self.year = year
    }
    
    func assembly() {
        let vc = SelectedSeasonVC()
        let networkService = SelectedSeasonNetworkService(id: id, year: year)
        let presenter = SelectedSeasonPresenter(view: vc, networkService: networkService)
        vc.presenter = presenter
        navController.pushViewController(vc, animated: true)
    }
    
    
}
