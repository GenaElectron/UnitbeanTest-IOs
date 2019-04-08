//
//  ListPostsViewController.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 29.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ListPostsViewController: UIViewController, ListPostsViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var presenter: ListPostsPresenterProtocol!
    var configurator: ListPostsConfiguratorProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureIfNeeded()
        self.configurator.configureDelegates(with: self)
        self.registerCells()
        self.configureTableView()
        self.presenter.configureView()
        self.configureNavigationBar()
        self.configureBackBarItem()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.addHeaderViewForTableView()
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - ListPostsViewProtocol methods
    
    func configureIfNeeded() {
        guard configurator == nil else { return }
        self.configurator = ListPostsConfigurator()
        self.configurator.configure(with: self)
    }

    func showAlertView(with title: String, and message: String, buttonTitle: String, actionHandler: @escaping VoidClosure) {
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
    
    func showPostScene(withPostId id: Int, animated: Bool) {
        let postViewController = PostViewController()
        postViewController.configureIfNeeded()
        postViewController.presenter.configureInteractorWithPostId(id: id)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(postViewController, animated: animated)
        }
    }
    
    // MARK: - Private methods
    
    private func registerCells() {
        self.tableView.register(ShortPostTableViewCell.nib, forCellReuseIdentifier: ShortPostTableViewCell.name)
    }
    
    private func configureTableView() {
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.backgroundColor = UIColor.MainColor.LightGray
    }
    
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.MainColor.Copper
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    private func addHeaderViewForTableView() {
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 16))
        tableHeaderView.backgroundColor = UIColor.clear
        self.tableView.tableHeaderView = tableHeaderView
    }
    
    private func configureBackBarItem() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}

