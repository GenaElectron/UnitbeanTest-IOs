//
//  ListPostsPresenter.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 29.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ListPostsPresenter: NSObject, ListPostsPresenterProtocol {
    
    weak var view: ListPostsViewProtocol!
    
    var interactor: ListPostsInteractorProtocol!
    var router: ListPostsRouterProtocol!
    
    private var models: [ViewModel] = []
    
    required init(view: ListPostsViewProtocol) {
        self.view = view
    }
    
    // MARK: - ListPostsPresenterProtocol methods
    
    func configureView() {
        let titleText = NSLocalizedString("Unitbean", comment: "")
        self.view.setTitleText(with: titleText)
        self.view.showSpinner()
        self.interactor.getAllPosts()
    }

    func showAlert(with text: String) {
        self.view.hideSpinner()
        
        let errorTitleText = NSLocalizedString("Error", comment: "")
        let errorText = String(format: NSLocalizedString("Error communicating with the server, try updating the connection. Detail: %@", comment: ""), text)
        let updateButtonText = NSLocalizedString("Update", comment: "")
        
        self.view.showAlertView(with: errorTitleText, and: errorText, buttonTitle: updateButtonText){ [weak self] in
            self?.repeatShowAllPosts()
        }
    }
    
    func showAllPosts() {
        self.interactor.postDataModels.forEach {
            models.append(ViewModel.Post(data: $0))
        }
        self.view.reloadData()
        self.view.hideSpinner()
    }
    
    func repeatShowAllPosts() {
        self.models = []
        self.view.showSpinner()
        self.interactor.getAllPosts()
    }
}

// MARK: - UITableViewDelegate methods

extension ListPostsPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = self.models[indexPath.row]
        switch model {
        case .Post(let data):
            if let id = data.id {
                self.router.route(router: .showPostSceneWithPostId(id: id))
            } else {
                let errorTitleText = NSLocalizedString("Error", comment: "")
                let errorText = NSLocalizedString("The transition to the specified article is not possible", comment: "")
                let okButtonText = NSLocalizedString("OK", comment: "")
                
                self.view.showAlertView(with: errorTitleText, and: errorText, buttonTitle: okButtonText){
                    //
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource methods

extension ListPostsPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.models[indexPath.row]
        switch model {
        case .Post(let data):
            if let cell = tableView.dequeueReusableCell(withIdentifier: ShortPostTableViewCell.name, for: indexPath) as? ShortPostTableViewCell {
                cell.titleLabel.text = data.title
                cell.bodyLabel.text = data.body
                cell.dateLabel.text = data.dateUnix.getDateStringFromUNIX()
                cell.commentLabel.text = "5" //not contain data from server
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
}

extension ListPostsPresenter {
    enum ViewModel {
        case Post(data: Post)
    }
}
