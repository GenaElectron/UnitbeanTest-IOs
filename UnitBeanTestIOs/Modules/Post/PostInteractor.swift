//
//  PostInteractor.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 31.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class PostInteractor: PostInteractorProtocol {

    weak var presenter: PostPresenterProtocol!
    
    let serverService: ServerServiceProtocol = ServerService()
    
    required init(presenter: PostPresenterProtocol) {
        self.presenter = presenter
    }
    
    var postDataModel: Post?
    
    var commentDataModels: [Comment] = []
    
    // MARK: - PostInteractorProtocol methods
    
    func getPost(withId id: Int) {
        serverService.getPost(withId: id) {[weak self] post, error in
            if (error != nil)  {
                self?.presenter.showAlert(with: error.debugDescription)
                return
            }
            self?.postDataModel = post
            self?.presenter.showPost()
        }
    }
    
    func getComments(withPostId id: Int) {
        serverService.getComments(withPostId: id) {[weak self] comments, error in
            if (error != nil)  {
                self?.presenter.showAlert(with: error.debugDescription)
                return
            }
            self?.commentDataModels = comments ?? []
            self?.presenter.showComment()
        }
    }
    
    deinit {
        //print("deinit PostInteractor")
    }
}
