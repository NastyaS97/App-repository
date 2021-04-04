//
//  WASettingsController.swift
//  WorldApp
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit
import SnapKit

class WASettingsController: WAViewController {

    enum Cities: String, CaseIterable {
        case minsk, gomel, kiev, moscow, paris

        static var stringCities: [String] {
            Cities.allCases.map { (city) -> String in
                return city.rawValue.capitalized // добавление в пикер своих значений
            }
        }
    }

    private lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.inputView = self.picker
        textField.inputAccessoryView = self.doneTollBar

        return textField
    }()

    private lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false

        return picker
    }()

    private lazy var doneTollBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done,
                            target: self,
                            action: #selector(doneTapped))
        ]
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.sizeToFit()

        return toolbar
    }()

    override func viewDidLoad() {

        super.viewDidLoad()

        self.mainVew.backgroundColor = .white
        self.title = "Settings"

        self.view.addSubview(cityTextField)

        let blueView = UIView()
        blueView.backgroundColor = .blue
        self.mainVew.addSubview(blueView)

        self.cityTextField.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(25)
            make.height.equalTo(35)
//            make.bottom.equalToSuperview()
        }

        blueView.snp.makeConstraints { (make) in
                make.top.equalTo(cityTextField.snp.bottom).offset(25)
                make.left.right.equalToSuperview().inset(25)
                make.height.equalTo(950)
        }
    }

    @objc private func doneTapped() {
        self.cityTextField.resignFirstResponder()
    }
}

extension WASettingsController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Cities.allCases.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Cities.stringCities[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(Cities.stringCities[row])
        self.cityTextField.text = Cities.stringCities[row]
    }
}
