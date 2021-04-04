//
//  WAFavouritesController.swift
//  WorldApp
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit

class WAFavouritesController: UIViewController {

    // MARK: - models

    private var places: [WAPlace] = WADefaults.sh.places.filter { $0.isFavourite } {
        didSet {
            self.filteredPlaces = self.places
        }
    }

    private lazy var filteredPlaces: [WAPlace] = self.places {
        didSet {
            self.tableView.reloadData()
        }
    }

    // MARK: - gui variables

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WAPlacesController.self,
                           forCellReuseIdentifier: WAPlacesCell.reuceIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()

    private lazy var searchVontroller: UISearchController = {
        let searchController = UISearchController()
        searchController.hidesNavigationBarDuringPresentation = false // добавить
        searchController.obscuresBackgroundDuringPresentation = false // добавить
        searchController.searchBar.placeholder = "Tap me" // добавить

        return searchController
    }()

    // MARK: - life cycle func

    override func viewDidLoad() {
        super.viewDidLoad()

        self.places = self.places.filter { $0.isFavourite }

        self.title = "Photo"
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.searchVontroller.searchResultsUpdater = self
        self.navigationItem.searchController = self.searchVontroller
        self.navigationItem.hidesSearchBarWhenScrolling = false // добавить

        self.sunbscribeToNotificstion()
    }

    // MARK: - notification center

    private func sunbscribeToNotificstion() {
        notificationCenter.defaults.addObserver(self, selector: #selector(placeLikeAction), name: .placeLikeAction, object: nil)
    }

    @objc private func placeLikeAction() {
        self.places = WADefaults.sh.places.filter { $0.isFavourite }
    }
}

extension WAFavouritesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredPlaces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WAPlacesCell.reuceIdentifier,
                                                 for: indexPath)
        if let cell = cell as? WAPlacesCell {
            cell.setcell(model: self.filteredPlaces[indexPath.row])
        }
        return cell
    }
}

extension WAFavouritesController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        self.filteredPlaces = searchText.isEmpty
            ? self.places
            : self.places.filter { $0.title.lowercased().lowercased().contains(searchText.lowercased())
            }
        self.tableView.reloadData()
    }
}
