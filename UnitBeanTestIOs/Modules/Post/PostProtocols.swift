//
//  PostProtocols.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 31.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol PostViewProtocol: class {
    var presenter: PostPresenterProtocol! { set get }
    func configureIfNeeded()
    func showAlertWithCancel(with title: String, and message: String, buttonTitle: String, cancelHandler: @escaping VoidClosure, actionHandler: @escaping VoidClosure)
    func setTitleText(with titleText: String)
    func reloadData()
    func showSpinner()
    func hideSpinner()
    func addFotterView()
    func removeFotterView()
    func dismissViewController(animated: Bool)
}

protocol PostPresenterProtocol: class {
    var router: PostRouterProtocol! { set get }
    func configureInteractorWithPostId(id: Int)
    func configureView()
    func showPost()
    func showComment()
    func repeatShowPost()
    func showAlert(with text: String)
}

protocol PostInteractorProtocol: class {
    var  postDataModel: Post? { get }
    var  commentDataModels: [Comment] { get }
    func configureWithPostId(id: Int)
    func getPost()
    func getComments()
}

protocol PostConfiguratorProtocol: class {
    func configure(with viewController: PostViewController)
    func configureDelegates(with viewController: PostViewController)
}

protocol PostRouterProtocol: class {
    func route(router: RouterPost)
}

enum RouterPost {
    case dismiss()
}

