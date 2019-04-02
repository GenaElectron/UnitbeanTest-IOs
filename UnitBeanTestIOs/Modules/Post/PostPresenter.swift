//
//  PostPresenter.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 31.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class PostPresenter: NSObject, PostPresenterProtocol {

    weak var view: PostViewProtocol!
    
    var interactor: PostInteractorProtocol!
    var router: PostRouterProtocol!
    
    private var models: [PostViewModel] = []
    
    required init(view: PostViewProtocol) {
        self.view = view
    }
    
    // MARK: - PostPresenterProtocol methods
    
    func configureView() {
        let titleText = NSLocalizedString("State", comment: "")
        self.view.setTitleText(with: titleText)
        self.view.showSpinner()
        self.interactor.getPost(withId: self.view.getPostId())
    }
    
    func showAlert(with text: String) {
        self.view.hideSpinner()
        
        let errorTitleText = NSLocalizedString("Error", comment: "")
        let errorText = String(format: NSLocalizedString("Error communicating with the server, try updating the connection. Detail: %@", comment: ""), text)
        let updateButtonText = NSLocalizedString("Update", comment: "")
        
        self.view.showAlertWithCancel(with: errorTitleText, and: errorText, buttonTitle: updateButtonText, cancelHandler: { [weak self] in
            self?.router.route(router: .dismiss())
        }) { [weak self] in
            self?.repeatShowPost()
        }
    }
    
    func showPost() {
        if let post = self.interactor.postDataModel{
            models.append(PostViewModel.Post(data: post))
            self.view.reloadData()
            self.view.hideSpinner()
            self.view.addFotterView()
            self.interactor.getComments(withPostId: self.view.getPostId())
        }
    }
    
    func showComment() {
        self.view.removeFotterView()
        self.interactor.commentDataModels.forEach {
            models.append(PostViewModel.Comment(data: $0))
        }
        self.view.reloadData()
    }
    
    func repeatShowPost() {
        self.view.showSpinner()
        self.models = []
        self.interactor.getPost(withId: self.view.getPostId())
    }
    
    deinit {
        //print("deinit PostPresenter")
    }
}

// MARK: - UITableViewDataSource methods

extension PostPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model {
        case .Post(let data):
            if let cell = tableView.dequeueReusableCell(withIdentifier: FullPostTableViewCell.name, for: indexPath) as? FullPostTableViewCell {
                cell.titleLabel.text = data.title
                cell.bodyLabel.text = data.body
                cell.dateLabel.text = data.dateUnix.getDateStringFromUNIX()
                return cell
            }
        case .Comment(let data):
            if let cell = tableView.dequeueReusableCell(withIdentifier: CommentPostTableViewCell.name, for: indexPath) as? CommentPostTableViewCell {
                cell.emailLabel.text = data.email
                cell.bodyLabel.text = data.body
                cell.dateLabel.text = data.dateUnix.getDateStringFromUNIX()
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
}

extension PostPresenter {
    enum PostViewModel {
        case Post(data: Post)
        case Comment(data: Comment)
    }
}
