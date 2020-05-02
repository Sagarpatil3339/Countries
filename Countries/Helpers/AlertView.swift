//
//  AlertView.swift
//  Countries
//
//  Created by Prasad Patil on 5/1/20.
//  Copyright © 2020 Prasad Patil. All rights reserved.
//

import UIKit

/*
 For configuring and setting alert with the message to display and the actions from which to choose
 */

class AlertView {
 static func configureAlert(viewController: UIViewController) {
        let alert = UIAlertController(title: Constants.alertTitle, message: Constants.alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.ok, style: .default, handler: { action in
            viewController.viewDidLoad()
        }))
        DispatchQueue.main.async {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
