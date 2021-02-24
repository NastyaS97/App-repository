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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.setViewdata()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        self.setViewdata()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }

    
    // MARK: - set data
    
    func setViewdata() {
        self.nameView.descriptionalText = self.userCardInfo.name
        self.locationView.descriptionalText = self.userCardInfo.location.rawValue
        self.occupetionView.descriptionalText = self.userCardInfo.occupation
        self.infoView.text = self.userCardInfo.info
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
    
    @IBAction func unwindToCard(_ unwindSegue: UIStoryboardSegue) {
        print(unwindSegue.source)
        print(unwindSegue.destination)
    }
}
