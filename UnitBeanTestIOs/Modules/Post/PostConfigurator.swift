//
//  PostConfigurator.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 31.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class PostConfigurator: PostConfiguratorProtocol {
    
    // MARK: - PostConfiguratorProtocol methods
    
    func configure(with viewController: PostViewController) {
        //presenter (-> weak) viewController
        let presenter = PostPresenter(view: viewController)
        //router (-> weak) viewController
        let router = PostRouter(viewController: viewController)
        //interactor (-> weak) presenter
        let interactor = PostInteractor(presenter: presenter)
        
        //viewController (-> strong) presenter
        viewController.presenter = presenter
        //presenter (-> strong) interactor
        presenter.interactor = interactor
        //presenter (-> strong) router
        presenter.router = router
        
        //viewController.tableView.delegate = presenter
        viewController.tableView.dataSource = presenter
    }
    
    deinit {
        //print("deinit PostConfigurator")
    }
}
