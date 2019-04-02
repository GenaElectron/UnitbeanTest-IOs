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
        
        viewController.tableView.delegate = presenter
        viewController.tableView.dataSource = presenter
    }
}
