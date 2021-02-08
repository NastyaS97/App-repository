//
//  RegisterViewCotrolllerViewController.swift
//  AuthProd
//
//  Created by Настя Сойко on 7.02.21.
//= "АБаб$12"

import UIKit

class RegisterViewCotrolllerViewController: UIViewController, UITextFieldDelegate {
    
    lazy var array = Array(arrayLiteral: self.cityTextField)
    
    private var login: String {
        self.firstTextField.text?.uppercased() ?? ""
    }
    private var password: String {
        self.secondTextField.text?.uppercased() ?? ""
    }
    private var confirmPassword: String {
        self.thirdTextField.text ?? ""
    }
    
    private let maxLength = 10
    
    private lazy var regex = "^(?=.*[а-я])(?=.*[А-Я])(?=.*\\d)(?=.*[$@$!%*?&#])[А-Яа-я\\d$@$!%*?&#]{\(maxLength),}$"
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField! {
        didSet {
            self.firstTextField.clearButtonMode = .always
        }
    }
    
    @IBOutlet weak var secondTextField: UITextField! {
        didSet {
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
        
        secondTextField.delegate = self
        messageLabel.numberOfLines = 0
    }
    
    @IBAction func `return`(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    func checkValidation(password: String) {
        if password.count <= maxLength, confirmPassword.count <= maxLength {
            messageLabel.text = "Success"
        }
        else if password.matches(regex) {
            messageLabel.textColor = .green
            messageLabel.text = "Верные символы в пароле!"
        }
        else if !self.login.isEmpty, !self.password.isEmpty, self.login != password, self.password == self.confirmPassword {
            messageLabel.textColor = .green
            messageLabel.text = "Success"
        } else {
            messageLabel.textColor = .red
            messageLabel.text = "Максимум \(maxLength)"
        }
    }
    
    func secondTextField(_ secondTextField: UITextField) -> Bool {
        let isSuccess = (secondTextField.text == password)
        messageLabel.textColor = isSuccess ? .green : .red
        messageLabel.text = isSuccess ? "Success" : "Error"
        return true
    }
    
    func textField(_ secondTextField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (secondTextField.text ?? "") + string
        let res: String
        
        if range.length == 10 {
            let end = text.index(text.startIndex, offsetBy: text.count + 1)
            res = String(text[text.startIndex..<end])
        } else {
            res = text
        }
        
        checkValidation(password: res)
        secondTextField.text = res
        return false
    }
}
extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
