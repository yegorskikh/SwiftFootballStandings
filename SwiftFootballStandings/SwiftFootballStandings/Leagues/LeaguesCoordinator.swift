//
//  LeaguesCoordinator.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

final class LeaguesCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    private let navController: UINavigationController
    

    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func assembly() {
        let vc = LeaguesVC()
        let networkService = LeaguesNetworkService()
        let presenter = LeaguesPresenter(view: vc, networkService: networkService)
        vc.presenter = presenter
        navController.pushViewController(vc, animated: true)
    }
    
    
}
