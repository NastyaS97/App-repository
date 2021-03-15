//
//  WAPlacesController.swift
//  WorldApp
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit

class WAPlacesController: UITableViewController {

    private var places: [String] = [
        "Minsk",
        "Chicago",
        "Paris",
        "Kiev",
        "Moscow",
        "Gomel"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .gray
        self.title = "Places"
        self.tableView.allowsMultipleSelection = true
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(WAPlacesCell.self,
                                forCellReuseIdentifier: WAPlacesCell.reuceIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WAPlacesCell.reuceIdentifier,
                                                 for: indexPath) as? WAPlacesCell ?? WAPlacesCell()
        cell.setCellData(imageName: self.places[indexPath.row],
                         imageDescriptions: "")

//       cell.backgroundColor = .white
//        cell.textLabel?.text = self.places[indexPath.row]
//        cell.imageView?.image = UIImage(named: "chicago")
//        cell.detailTextLabel?.text = "Hello. I'm description"
//        cell.accessoryType = .detailButton

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "You selected:",
                                      message: self.places[indexPath.row],
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

        // 1. delete and reload all table view
//        self.places.remove(at: indexPath.row)
//        self.tableView.reloadData()

        // 2. uppercae selected city and reload current cell
        self.places[indexPath.row] = self.places[indexPath.row].uppercased()
        self.tableView.reloadRows(at: [indexPath],
                                  with: .fade)
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) was deselected")
    }
}
