//
//  SeasonsCoordinator.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

final class SeasonsCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    private let navController: UINavigationController
    private let seasonsId: String

    init(navController: UINavigationController, seasonsId: String) {
        self.navController = navController
        self.seasonsId = seasonsId
    }
    
    func assembly() {
        let vc = SeasonsVC()
        let networkService = SeasonsNetworkService(seasonsId: seasonsId)
        let presenter = SeasonsPresenter(view: vc, networkService: networkService)
        vc.presenter = presenter
        navController.pushViewController(vc, animated: true)
    }
    
    
}
