//
//  ListPostsProtocols.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 29.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol ListPostsViewProtocol: class {
    var presenter: ListPostsPresenterProtocol! { set get }
    func configureIfNeeded()
    func showAlertView(with title: String, and message: String, buttonTitle: String, actionHandler: @escaping VoidClosure )
    func setTitleText(with titleText: String)
    func reloadData()
    func showSpinner()
    func hideSpinner()
    func showPostScene(withPostId: Int, animated: Bool)
}

protocol ListPostsPresenterProtocol: class {
    var router: ListPostsRouterProtocol! { set get }
    func configureView()
    func showAllPosts()
    func repeatShowAllPosts()
    func showAlert(with text: String)
}

protocol ListPostsInteractorProtocol: class {
    var  postDataModels: [Post] { get }
    func getAllPosts()
}

protocol ListPostsRouterProtocol: class {
    func route(router: RouterListsPost)
}

enum RouterListsPost {
    case showPostSceneWithPostId(id: Int)
}

protocol ListPostsConfiguratorProtocol: class {
    func configure(with viewController: ListPostsViewController)
    func configureDelegates(with viewController: ListPostsViewController)
}
