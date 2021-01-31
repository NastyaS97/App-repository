//
//  ViewController.swift
//  ColorPicker
//
//  Created by Настя Сойко on 30.01.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logoLabel: UILabel! // Колор Пикер надпись
    @IBOutlet weak var logoImage: UIImageView! // кисть вверху
    @IBOutlet weak var mainButtonofApp: UIButton! // кнопка внизу
    @IBOutlet weak var congratulationView: UILabel! // неизменяемая надпись вверху
    
    @IBOutlet weak var firstElementForInput: UILabel! //  надпись Рэд
    @IBOutlet weak var secondElementForInput: UILabel! // надпись Грин
    @IBOutlet weak var thirdElementForInput: UILabel! // надпись Блю
    
    
    @IBOutlet weak var firstForFirstInputting: UITextField! {
        didSet {
            self.firstForFirstInputting.clearButtonMode = .always // удаляет текст одной кнопкой если он написан
        }
    }
    @IBOutlet weak var secondForFirstInputting: UITextField! {
        didSet {
            self.secondForFirstInputting.clearButtonMode = .always // удаляет текст одной кнопкой если он написан
        }
    }
    @IBOutlet weak var fildForThirdtInputting: UITextField! {
        didSet {
            self.fildForThirdtInputting.clearButtonMode = .always // удаляет текст одной кнопкой если он написан
        }
    }
    
    @IBOutlet weak var messageAboutResult: UILabel! // изменяемая часть где выводит предупреждение
    @IBOutlet weak var viewOfChanchingColor: UIView! {  // квадрат изменяет цвет
        didSet {
            self.viewOfChanchingColor.backgroundColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func firstField(_ sender: UITextField) {
        sender.resignFirstResponder() // ретерн
    }
    
    @IBAction func secondField(_ sender: UITextField) {
        sender.resignFirstResponder() // ретерн
    }
    
    @IBAction func thirdField(_ sender: UITextField) {
        sender.resignFirstResponder()
    } // ретерн
    
    
    @IBAction func buttonTouched(_ sender: Any) {
        if let text = self.firstForFirstInputting.text, text.isEmpty {
            self.changeAppDescription(text: "Invalid color parameters! Please, check them.")
        } else {
            if let text = self.secondForFirstInputting.text, text.isEmpty {
                self.changeAppDescription(text: "Invalid color parameters! Please, check them.")
            } else {
                if let text = self.fildForThirdtInputting.text, text.isEmpty {
                    self.changeAppDescription(text: "Invalid color parameters! Please, check them.")
                } else {
                    self.changeAppDescription(text: "You can try again!")
                }
            }
        }
        
        let redIn: Float  = Float(self.firstForFirstInputting!.text ?? "0") ?? 0.0
        let greenIn: Float = Float(self.secondForFirstInputting!.text ?? "0") ?? 0.0
        let blueIn: Float = Float(self.fildForThirdtInputting!.text ?? "0") ?? 0.0
        
        viewOfChanchingColor.backgroundColor = UIColor(red: redIn, green: greenIn, Blue: blueIn, aplpha: 1.0)
    }
    
    func setUpView() {
        self.logoLabel.textColor = .orange
        
        self.setButton(text: "Print!")
        
        self.changeAppDescription(text: "You can start!")
    }
    func setButton(text: String) {
        self.mainButtonofApp.setTitle(text, for: .normal)
    }
    func changeAppDescription(text: String) {
        self.messageAboutResult.text = text // функция изменения текста
    }
}

