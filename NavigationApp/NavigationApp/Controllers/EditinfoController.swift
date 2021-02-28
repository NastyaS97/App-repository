//
//  EditinfoController.swift
//  NavigationApp
//
//  Created by Настя Сойко on 18.02.21.
//

import UIKit

class EditinfoController: UIViewController {

    var userCardInfo: NAUserCardinfo?
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var infoTextFiel: UITextField!
    @IBOutlet weak var textField: UITextView!
    
    // MARK: - view life cycle
    
    private func setModelData() {
        guard let userModel = self.userCardInfo else { return }
        userModel.name = self.textField.text ?? ""
        userModel.info = self.textField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRecognizer = UISwipeGestureRecognizer(target: self,
                                                       action: #selector(self.viewWasSwiped))
        swipeRecognizer.direction = .down
        self.view.addGestureRecognizer(swipeRecognizer)
        
        // 1 way
//        let recognizer = UITapGestureRecognizer(target: self,
//                                                action: #selector(self.saveButtonTapped))
//        saveButton.addGestureRecognizer(recognizer)
        
        // 2 way
//        let saveButtonAction = UIAction { (_) in
//            print("saveButtomTapped")
//        }
//        self.saveButton.addAction(saveButtonAction, for: .touchUpInside)
        
        // 3 way
        self.saveButton.addTarget(self, action: #selector(self.saveButtonTapped),
                                  for: .touchUpInside)
        self.setViewData()
    }
    
    // MARK: - setting view data
    
    private func setViewData() {
        self.infoTextFiel.text = self.userCardInfo?.name
        self.textField.text = self.userCardInfo?.info
    }
    
    // MARK: - actions
    
    @objc func saveButtonTapped() {
        self.setModelData()
        self.dismiss(animated: true,
                     completion: nil) // if cotroller was presented
//        self.navigationController?.popViewController(animated: true) //  возврат к предыдущей странице после нажатия кнопки if cotroller was pushed
    }

    @objc func viewWasSwiped() {
        print("swipe")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
