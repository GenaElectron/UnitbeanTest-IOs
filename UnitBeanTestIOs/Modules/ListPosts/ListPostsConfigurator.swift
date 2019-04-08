//
//  ListPostsConfigurator.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 29.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ListPostsConfigurator: ListPostsConfiguratorProtocol {

    // MARK: - ListPostsConfiguratorProtocol methods
    
    func configure(with viewController: ListPostsViewController) {
        //presenter (-> weak) viewController
        let presenter = ListPostsPresenter(view: viewController)
        //router (-> weak) viewController
        let router = ListPostsRouter(viewController: viewController)
        //interactor (-> weak) presenter
        let interactor = ListPostsInteractor(presenter: presenter)

        //viewController (-> strong) presenter
        viewController.presenter = presenter
        //presenter (-> strong) interactor
        presenter.interactor = interactor
        //presenter (-> strong) router
        presenter.router = router
    }
    
    func configureDelegates(with viewController: ListPostsViewController) {
        if let presenter = viewController.presenter as? UITableViewDataSource {
            viewController.tableView.dataSource = presenter
        }
        if let presenter = viewController.presenter as? UITableViewDelegate {
            viewController.tableView.delegate = presenter
        }
    }
}
