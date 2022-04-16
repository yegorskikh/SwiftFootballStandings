//
//  MainCoordinator.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    func assembly()
}


final class AppCoordinator: Coordinator {
    
    //MARK: - Open properties
    var parentCoordinator: Coordinator?
    
    // MARK: - Private properties
    private let window: UIWindow
    private let navController: UINavigationController
    
    
    // MARK: - Init
    init(window: UIWindow, navController: UINavigationController) {
        self.window = window
        self.navController = navController
    }
    
    //MARK: - Open metods
    func assembly() {
        window.rootViewController = navController
        window.makeKeyAndVisible()
        parentCoordinator = nil
        showMain()
    }
    
    private func showMain() {
        let coordinator = LeaguesCoordinator(navController: navController)
        coordinator.parentCoordinator = self
        coordinator.assembly()
    }
    
}


