//
//  RegisterViewCotrolllerViewController.swift
//  AuthProd
//
//  Created by Настя Сойко on 7.02.21.
//

import UIKit

class RegisterViewCotrolllerViewController: UIViewController {
    
    private var login: String {
        self.firstTextField.text?.uppercased() ?? ""
    }
    private var password: String {
        self.secondTextField.text?.uppercased() ?? ""
    }
    private var confirmPassword: String {
        self.thirdTextField.text?.uppercased() ?? ""
    }
    
    @IBOutlet weak var firstTextField: UITextField! {
        didSet {
            self.firstTextField.clearButtonMode = .always
        }
    }
    
    @IBOutlet weak var secondTextField: UITextField!
    var maxValue = 10 {
           didSet {
            secondTextField?.text = nil
            self.secondTextField.clearButtonMode = .always
            self.secondTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var thirdTextField:
        UITextField! {
        didSet {
            self.thirdTextField.clearButtonMode = .always
        }
    }
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            self.emailTextField.clearButtonMode = .always
        }
    }
    @IBOutlet weak var cityTextField: UITextField! {
        didSet {
            self.cityTextField.clearButtonMode = .always
        }
    }
    
    
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    
    @IBOutlet weak var registartionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func `return`(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    
        
    func checkMaxLength(textField: UITextField!) {
        if (secondTextField.text!.characters.count > maxValue) {
            secondTextField.deleteBackward()
        }
    }
    
    @IBAction func isRegistrationRunning(_ sender: UIButton) {
        if !self.login.isEmpty, !self.password.isEmpty, self.login != password, self.password == self.confirmPassword  {
            print("you can go to another page")
        } else {
            print("error")
        }
    }
    
    

}
