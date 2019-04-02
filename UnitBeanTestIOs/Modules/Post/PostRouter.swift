//
//  PostRouter.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 31.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class PostRouter: PostRouterProtocol {
    
    weak var viewController: PostViewController!
    
    init(viewController: PostViewController) {
        self.viewController = viewController
    }
    
    // MARK: - PostRouterProtocol methods
        
    func route(router: RouterPost) {
        switch router {
        case .dismiss:
            self.viewController.dismissViewController(animated: true)
        }
    }
    
    deinit {
        //print("deinit PostRouter")
    }
}
