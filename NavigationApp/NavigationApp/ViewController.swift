//
//  ViewController.swift
//  NavigationApp
//
//  Created by Настя Сойко on 15.02.21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - outlets
    @IBOutlet weak var maneView: UIView!
    
    @IBOutlet weak var nameView: TitleDescriptionView!
    @IBOutlet weak var locationView: TitleDescriptionView!
    @IBOutlet weak var occupetionView: TitleDescriptionView!
    @IBOutlet weak var editinfoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func shareButtonTapped(_ sender: Any) {
        let text = "Hellow, i'm app"
        guard let url = URL(string: "google.com") else { return }
        let activityController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)
        
        self.present(activityController, animated: true) {
            print("I was presented")
        }
    }
}

