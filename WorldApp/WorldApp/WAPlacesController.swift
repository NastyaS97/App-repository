//
//  WAPlacesController.swift
//  WorldApp
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit

class WAPlacesController: UITableViewController {

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
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.rightBarButtonItems = [self.editButtonItem]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section title"
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["1", "2", "3"]
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        if section == 2 {
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .yellow
        }
        return view
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UITableViewHeaderFooterView()
        if section == 2 {
            view.backgroundColor = .brown
        } else {
            view.backgroundColor = .black
        }
        return view
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 4
        } else {
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WAPlacesCell.reuceIdentifier,
                                                 for: indexPath) as? WAPlacesCell ?? WAPlacesCell()
        cell.setcell(model: self.places[indexPath.row])
        cell.favouriteWasTapped = { [weak self] in
//            guard let self = self else { return }
            self?.places[indexPath.row].isFavourite.toggle()
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
}
