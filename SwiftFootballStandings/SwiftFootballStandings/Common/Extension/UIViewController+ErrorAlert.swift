//
//  UIViewController+ErrorAlert.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(text: String) {
        let alert = UIAlertController(title: "Something went wrong",
                                      message: text,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
