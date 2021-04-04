//
//  WAPlacesController.swift
//  WorldApp
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit

class WAPlacesController: UITableViewController {

    // MARK: - models

    private var places: [WAPlace] = WADefaults.sh.places {
        didSet {
            WADefaults.sh.places = self.places
            self.filteredPlaces = self.places
        }
    }

    private lazy var filteredPlaces: [WAPlace] = self.places

    // MARK: - gui variables

    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.sizeToFit()
        return search
    }()

    // MARK: - life cycle func

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .gray
        self.title = "Places"
        self.tableView.allowsMultipleSelection = true
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(WAPlacesCell.self,
                                forCellReuseIdentifier: WAPlacesCell.reuceIdentifier)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.rightBarButtonItems = [self.editButtonItem]

        self.tableView.tableHeaderView = self.searchBar
        self.searchBar.delegate = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    // MARK: - likeNotifications

    private func sendLikeActionsNotifications() {
        likeNotificationsCenter.default.post(Notification(name: .placeLikeAction))
    }


    // MARK: - tableView

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section title"
    }

//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return ["1", "2", "3"]
//    }

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        if section == 2 {
//            view.backgroundColor = .green
//        } else {
//            view.backgroundColor = .yellow
//        }
//        return view
//    }
//
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UITableViewHeaderFooterView()
//        if section == 2 {
//            view.backgroundColor = .brown
//        } else {
//            view.backgroundColor = .black
//        }
//        return view
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredPlaces.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WAPlacesCell.reuceIdentifier,
                                                 for: indexPath) as? WAPlacesCell ?? WAPlacesCell()
        cell.setcell(model: self.filteredPlaces[indexPath.row])
        cell.favouriteWasTapped = { [weak self] in
//            guard let self = self else { return }
            self?.places[indexPath.row].isFavourite.toggle()
            self?.sendLikeActionsNotifications()
        }

//       cell.backgroundColor = .white
//        cell.textLabel?.text = self.places[indexPath.row]
//        cell.imageView?.image = UIImage(named: "chicago")
//        cell.detailTextLabel?.text = "Hello. I'm description"
//        cell.accessoryType = .detailButton

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "You selected:",
                                      message: self.places[indexPath.row].title,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

//        WADefaults.sh.test += 1
//        WADefaults.sh.saveTestValue()

        // 1. delete and reload all table view
//        self.places.remove(at: indexPath.row)
//        self.tableView.reloadData()

        // 2. uppercae selected city and reload current cell
//        self.places[indexPath.row] = self.places[indexPath.row].uppercased()
//        self.tableView.reloadRows(at: [indexPath],
//                                  with: .fade)
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) was deselected")
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row == 0 {
            return .insert
        } else {
            return .delete
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.places.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .insert:
        print("Try to insert cells")
        default:
            break
        }
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.places.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        self.tableView.reloadData()
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)

        self.searchBar.isHidden = editing
    }
}




extension WAPlacesController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.navigationItem.rightBarButtonItems = searchText.isEmpty ? [self.editButtonItem] : nil
//        if searchText.isEmpty {
//            self.filteredPlaces = self.places
//        } else {
//            self.filteredPlaces = self.places.filter({ (place: WAPlace) -> Bool in
//                place.title.lowercased().contains(searchText.lowercased())
//            })
//        }
        self.filteredPlaces = searchText.isEmpty
            ? self.places
            : self.places.filter { $0.title.lowercased().lowercased().contains(searchText.lowercased()) }
        self.tableView.reloadData()
    }
}
