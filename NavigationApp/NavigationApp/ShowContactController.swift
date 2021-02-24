//
//  ShowContactController.swift
//  NavigationApp
//
//  Created by Настя Сойко on 25.02.21.
//

import UIKit

class ShowContactController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.textContentType = .emailAddress
        self.emailTextField.keyboardType = .emailAddress
        self.phoneTextField.keyboardType = .numberPad
        self.phoneTextField.textContentType = .telephoneNumber
        
        self.emailTextField.delegate = self
        self.phoneTextField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldBeganEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.textContentType == .some(.emailAddress) {
            print("I'm email")
            return true
        } else if textField.textContentType == .some(.telephoneNumber) {
            let currentTextFieldText = textField.text ?? ""
            let resultText = (currentTextFieldText as NSString).replacingCharacters(in: range, with: string)
            if resultText.count >= 3 {
                return false
            } else {
                return true
            }
        } else {
            return true
        }
    }
}

