//
//  Extensions+UIViewController.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 31.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//


import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String, buttonTitle: String ,actionHandler: @escaping VoidClosure ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: {_ in
            alertController.dismiss(animated: true, completion: nil)
            actionHandler()
        })
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    func showAlertWithCancel(with title: String, and message: String, buttonTitle: String, cancelHandler: @escaping VoidClosure, actionHandler: @escaping VoidClosure) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: {_ in
            alertController.dismiss(animated: true, completion: nil)
            actionHandler()
        })
        let cancelButtonText = NSLocalizedString("Cancel", comment: "")
        let cancelAction = UIAlertAction(title: cancelButtonText, style: .default, handler: {_ in
            alertController.dismiss(animated: true, completion: nil)
            cancelHandler()
        })
        alertController.addAction(action)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
