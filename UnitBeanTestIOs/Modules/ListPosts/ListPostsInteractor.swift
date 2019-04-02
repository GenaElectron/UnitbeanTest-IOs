//
//  ListPostsInteractor.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 29.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ListPostsInteractor: ListPostsInteractorProtocol {
    
    weak var presenter: ListPostsPresenterProtocol!
    
    let serverService: ServerServiceProtocol = ServerService()

    required init(presenter: ListPostsPresenterProtocol) {
        self.presenter = presenter
    }
    
    var postDataModels: [Post] = []
    
    // MARK: - ListPostsInteractorProtocol methods
    
    func getAllPosts() {
        self.serverService.getAllPost {[weak self] posts, error in
            if (error != nil)  {
                self?.presenter.showAlert(with: error.debugDescription)
                return
            }
            self?.postDataModels = posts ?? []
            self?.presenter.showAllPosts()
        }
    }
}
