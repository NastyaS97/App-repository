//
//  WAFavouritesController.swift
//  WorldApp
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit

class WAFavouritesController: UIViewController {

    private var places: [WAPlace] = [
        WAPlace(title: "Chicago",
                description: "The City of Chicago covers an area of 60,000 hectares and sits 176 meters (578 feet) above sea level on the southwestern shore of Lake Michigan. At 190 km wide and 495 km long, its the 5th largest body of fresh water in the world.",
                imageUrl: "https://media.timeout.com/images/105658075/image.jpg)",
                isFavourite: false),
        WAPlace(title: "Minsk",
                description: nil,
                imageUrl: "https://www.toursoyuz.by/wp-content/uploads/2019/05/minsk.jpg",
                isFavourite: true),
        WAPlace(title: "Gomel",
                description: nil,
                imageUrl: "https://planetabelarus.by/upload/medialibrary/a45/a4509b7c9d54bdc9a20886c9ab9e981f.jpg",
                isFavourite: false),
        WAPlace(title: "Cardif",
                description: nil,
                imageUrl: "https://cw-gbl-gws-prod.azureedge.net/-/media/cw/emea/united-kingdom/offices/hero-image-emea-office-cardiff-small.jpg",
                isFavourite: false),
        WAPlace(title: "Moscow",
                description: "Is the capital and largest city of Russia.",
                imageUrl: "https://media.istockphoto.com/photos/st-basils-cathedral-and-golden-first-rays-of-the-sun-picture-id1062947134?k=6&m=1062947134&s=612x612&w=0&h=8_QdIz8qrp76_KWjduddK4YZsXW0_e61FQCz0o2a_ns=",
                isFavourite: false),
        WAPlace(title: "Paris",
                description: nil,
                imageUrl: "",
                isFavourite: false),
        WAPlace(title: "Kiev",
                description: nil,
                imageUrl: "https://images11.popmeh.ru/upload/custom/e26/e26f37f51198bf3c494bc15f674051a3.jpg",
                isFavourite: true),
        WAPlace(title: "Cairo",
                description: nil,
                imageUrl: "https://specials-images.forbesimg.com/imageserve/466090186/960x0.jpg",
                isFavourite: false)
    ] {
        didSet {
            self.filteredPlaces = self.places
        }
    }

    private lazy var filteredPlaces: [WAPlace] = self.places

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
