//
//  ViewController.swift
//  ColorPicker
//
//  Created by Настя Сойко on 30.01.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var mainButton: UIImageView!
    @IBOutlet weak var congratulationView: UILabel!
    
    @IBOutlet weak var firstElementForInput: UILabel!
    @IBOutlet weak var secondElementForInput: UILabel!
    @IBOutlet weak var thirdElementForInput: UILabel!
    
    @IBOutlet weak var fildForFirstInputting: UITextField!
    @IBOutlet weak var secondForFirstInputting: UITextField!
    @IBOutlet weak var fildForThirdtInputting: UITextField!
    
    @IBOutlet weak var messageAboutResult: UILabel!
    @IBOutlet weak var viewOfChanchingColor: UIView! {
        didSet {
            self.viewOfChanchingColor.backgroundColor = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func firstTyipingDidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func secondTyipingDidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func thirdTyipingDidEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    func changeMessage(with text: String) {
        self.messageAboutResult.text = text
    }
    @IBAction func buttonTouched(_ sender: UIButton) {
    }
}

