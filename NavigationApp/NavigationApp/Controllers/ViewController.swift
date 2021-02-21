//
//  ViewController.swift
//  NavigationApp
//
//  Created by Настя Сойко on 15.02.21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - variables
    
    let userCardInfo = NAUserCardinfo()
    
    //MARK: - outlets
    
    @IBOutlet weak var maneView: UIView!
    @IBOutlet weak var nameView: TitleDescriptionView!
    @IBOutlet weak var locationView: TitleDescriptionView!
    @IBOutlet weak var occupetionView: TitleDescriptionView!
    @IBOutlet weak var infoView: UITextView!
    @IBOutlet weak var editinfoButton: UIButton!
    
    // MARK: - life cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameView.descriptionalText = self.userCardInfo.name
        self.locationView.descriptionalText = self.userCardInfo.location.rawValue
        self.occupetionView.descriptionalText = self.userCardInfo.occupation
        
    }

    @IBAction func shareButtonTapped(_ sender: Any) {
        let text = "Hellow, i'm app"
        guard let url = URL(string: "google.com") else { return }
        let activityController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)
        
        self.present(activityController, animated: true) {
            print("I was presented")
        }
    }
    //MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editProfile":
            if let controller = segue.destination as? EditinfoController {
                controller.userCardInfo = self.userCardInfo
            }
        default:
            break
        }
    }
}
