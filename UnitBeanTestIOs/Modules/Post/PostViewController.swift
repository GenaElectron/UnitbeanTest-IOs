//
//  PostViewController.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 31.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, PostViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var presenter: PostPresenterProtocol!
    var configurator: PostConfiguratorProtocol = PostConfigurator()
    
    private var bottomView: UIView?
    
    private var postId: Int = 0
    
    func getPostId() -> Int {
        return postId
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurator.configure(with: self)
        self.presenter.configureView()
        self.configureTableView()
        self.registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - PostViewProtocol methods
    
    func configure(withPostId id: Int) {
        self.postId = id
        //print("post id = \(id)")
    }
    
    func showAlertViewWithCancel(with title: String, and message: String, buttonTitle: String, actionHandler: @escaping VoidClosure) {
        DispatchQueue.main.async {
            self.showAlert(with: title, and: message, buttonTitle: buttonTitle, actionHandler: actionHandler)
        }
    }
    
    func setTitleText(with titleText: String) {
        DispatchQueue.main.async {
            self.title = titleText
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showSpinner() {
        DispatchQueue.main.async {
            self.spinner.startAnimating()
        }
    }
    
    func hideSpinner() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
        }
    }
    
    func dismissViewController(animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func addFotterView() {
        DispatchQueue.main.async {
            self.bottomView = ViewWithSpinner.loadFromNib()
            self.tableView.tableFooterView = self.bottomView
        }
    }
    
    func removeFotterView() {
        DispatchQueue.main.async {
            self.tableView.tableFooterView = nil
        }
    }
    
    // MARK: - Privats methods
    
    private func registerCells() {
        self.tableView.register(FullPostTableViewCell.nib, forCellReuseIdentifier: FullPostTableViewCell.name)
        self.tableView.register(CommentPostTableViewCell.nib, forCellReuseIdentifier: CommentPostTableViewCell.name)
    }
    
    private func configureTableView() {
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.MainColor.LightGray
    }
    
    deinit {
        //print("deinit PostViewController")
    }
}
