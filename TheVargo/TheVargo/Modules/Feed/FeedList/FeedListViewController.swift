//
//  FeedListViewController.swift
//  TheVargo
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright (c) 2018 AndreSamples. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FeedListViewController: VBaseViewController {

    // MARK: - Public properties -

//    private var isLoading: Bool = false
    var presenter: FeedListPresenterInterface!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            setupTableView()
        }
    }
    
    @IBOutlet weak var tableViewFooter: UIStackView!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet weak var footerActivity: UIActivityIndicatorView!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
}

// MARK: - Functions -

extension FeedListViewController {
    
    private func initialSetup() {
        title = "Vargo"
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.register(FeedArticleTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

// MARK: - UITableViewDataSource -

extension FeedListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as FeedArticleTableViewCell
        cell.item = presenter.item(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
}

// MARK: - UITableViewDelegate -

extension FeedListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = presenter.numberOrItems(in: indexPath.section) - 1
        if tableViewFooter.isHidden && indexPath.row == lastElement {
            presenter._loadMoreItems()
        }
    }
    
}

// MARK: - Extensions -

extension FeedListViewController: FeedListViewInterface {
    
    func showFooterUpdatedMessage(message: String) {
        footerLabel.text = message
        footerActivity.isHidden = true
    }
    
    func showFooterLoading(_ loading: Bool) {
        hideFenceView()
        tableViewFooter.isHidden = !loading
    }
    
    func showError(error: ErrorInterface, target: Any, action: Selector) {
        showFenceError(error: error, target: target, action: action)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
