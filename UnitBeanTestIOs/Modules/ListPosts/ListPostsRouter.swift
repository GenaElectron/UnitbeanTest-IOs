//
//  ListPostsRouter.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 29.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ListPostsRouter: ListPostsRouterProtocol {
    
    weak var viewController: ListPostsViewController!
    
    init(viewController: ListPostsViewController) {
        self.viewController = viewController
    }

    // MARK: - ListPostsRouterProtocol methods
    
    func route(router: RouterListsPost){
        switch router {
        case .showPostSceneWithPostId(let id):
            self.viewController.showPostScene(withPostId: id, animated: true)
        }
    }
}

