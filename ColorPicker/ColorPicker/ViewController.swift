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
    @IBOutlet weak var viewOfChanchingColor: UIView!  // квадрат изменяет цвет
//            didSet {
//                self.viewOfChanchingColor.backgroundColor
//            }
    
    
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
        
        let redIn: Float  = Float(self.firstForFirstInputting!.text ?? "0") ?? 0.0
        let greenIn: Float = Float(self.secondForFirstInputting!.text ?? "0") ?? 0.0
        let blueIn: Float = Float(self.fildForThirdtInputting!.text ?? "0") ?? 0.0
        
        viewOfChanchingColor.backgroundColor = UIColor(red: redIn, green: greenIn, Blue: blueIn, aplpha: 1)
    }
    
    //        if let inputText = self.fildForFirstInputting.text, !inputText.isEmpty {
    //            self.messageAboutResult(with: "Invalid color parameters! Please, check them.")
    //            self.viewOfChanchingColor.backgroundColor = .white
    //        } if else let inputText?.characters.count < 0 {
    //            self.changeAppDescription(with: "ERROR")
    //        }
    //    }
    
    //    func setUpView() {
    //        self.logoLabel.textColor = .orange
    //
    //        self.setButton(text: "Print!")
    //
    //        self.changeAppDescription(with: "ERROR")
    //    }
    
    //func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    //    let isNumber = NSCharacterSet.decimalDigitCharacterSet().isSupersetOfSet(NSCharacterSet(charactersInString: string))
    //
    //    return isNumber || (string == NSNumberFormatter().decimalSeparator && textField.text?.containsString(string) == false)
    //}
    
    //    func setButton(text: String) {
    //        self.mainButtonofApp.setTitle(text, for: .normal)
    //    }
    //
    //    func changeAppDescription(with text: String) {
    //        self.messageAboutResult.text = text // функция изменения текста
    //    }
    //}
    
}
