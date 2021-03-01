//
//  ShowContactController.swift
//  NavigationApp
//
//  Created by Настя Сойко on 25.02.21.
//

import UIKit

protocol ShowContactControllerDelegate: class {
    func dateOfBirthDidChange(picker: UIDatePicker, birthDate: Date)
    func emailDidChanged(email: String)
}

class ShowContactController: UIViewController, UITextFieldDelegate {
    weak var delegate: ShowContactControllerDelegate?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField! {
        didSet {
            self.dateOfBirth.inputView = self.datePicker
        }
    }
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Date()
        picker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(viewDidTapped)))
        self.emailTextField.textContentType = .emailAddress
        self.emailTextField.keyboardType = .emailAddress
        self.phoneTextField.keyboardType = .numberPad
        self.phoneTextField.textContentType = .telephoneNumber
        self.emailTextField.delegate = self
        self.phoneTextField.delegate = self
    }
    @objc private func datePickerValueChanged(_ datePicker: UIDatePicker) {
        self.dateOfBirth.text = datePicker.date.toString
        self.delegate?.dateOfBirthDidChange(picker: datePicker,
                                            birthDate: datePicker.date)
    }
    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailTextField {
            self.delegate?.emailDidChanged(email: textField.text ?? "")
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldBeganEndEditing")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
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
