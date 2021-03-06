//
//  WASettingsController.swift
//  WorldApp
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit

class WASettingsController: UIViewController {

    enum Cities: String,  CaseIterable {
        case minsk, gomel, kiev, moscow, paris

        static var stringCities: [String] {
            Cities.allCases.map { (city) -> String in
                return city.rawValue.capitalized // добавление в пикер своих значений
            }
        }
    }

    private lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.sizeToFit()
        return picker
    }()

    override func viewDidLoad() {

        super.viewDidLoad()

        self.view.backgroundColor = .red
        self.title = "Settings"

        self.view.addSubview(picker)

        NSLayoutConstraint.activate([
                                        self.picker.centerYAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.picker.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.picker.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
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
    }
}
