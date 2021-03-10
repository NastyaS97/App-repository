//
//  ViewController.swift
//  AuthProd
//
//  Created by Настя Сойко on 1.02.21.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageName = "Cat_"
    private let buttonColor = "buttonColor"
    
    private var login: String {
        self.loginField.text ?? ""
    }
    private var password: String {
        self.passwordField.text ?? ""
    }
    // MARK: - IBOutlets
    
    @IBOutlet weak var loginField: UITextField! {
        didSet {
            self.loginField.tintColor = UIColor(named: self.buttonColor)
            self.loginField.textColor = .white
            self.loginField.tintColor = .white
            self.loginField.clearButtonMode = .always
        }
    }
    @IBOutlet weak var passwordField: UITextField! {
        didSet {
            self.passwordField.clearButtonMode = .always
            self.passwordField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var backgroundImageView: UIView! {
        didSet {
            self.backgroundImageView.layer.cornerRadius = self.backgroundImageView.bounds.height / 2
//            self.backgroundImageView.layer.shadowColor = UIColor.black.cgColor
//            self.backgroundImageView.layer.shadowRadius = 5
//            self.backgroundImageView.layer.shadowOpacity = 0.2
//            self.backgroundImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var avatarRightImageView: UIImageView! {
        didSet {
            self.avatarRightImageView.layer.cornerRadius = self.avatarRightImageView.bounds.height / 2
//            self.avatarRightImageView.layer.shadowColor = UIColor.black.cgColor
//            self.avatarRightImageView.layer.shadowRadius = 5
//            self.avatarRightImageView.layer.shadowOpacity = 0.2
//            self.avatarRightImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            self.loginButton.layer.cornerRadius = 15
            //            self.loginButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
            self.loginButton.layer.shadowColor = UIColor.black.cgColor
            self.loginButton.layer.shadowRadius = 5
            self.loginButton.layer.shadowOpacity = 0.4
            self.loginButton.layer.borderColor = UIColor.white.cgColor
            self.loginButton.layer.borderWidth = 1
            //            self.loginButton.layer.shadowOffset = CGSize(width: 0, height: 15)
        }
    }
    
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewData()
    }
    //MARK: - setters
    private func setViewData() {
        self.avatarRightImageView.image = UIImage(named: "Cat_1")
        self.backgroundImageView.backgroundColor = UIColor(named: "buttonColor")
    }
    
    // MARK: - handling avatar
    private func getAvatarImage(index: Int) -> UIImage? {
        return UIImage(named: "\(self.imageName)\(index)")
    }
    
    private func getRandomCatAvatar() -> UIImage? {
        let randomIndex = Int.random(in: 1...30)
        return self.getAvatarImage(index: randomIndex)
    }
    // MARK: - IBActions
    
    @IBAction func `return`(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    

    @IBAction func changeAvatarAction(_ sender: UIButton) {
        self.avatarRightImageView.image = self.getRandomCatAvatar()
    }
    private func colorBackGround(in color: UIColor, finalColor: UIColor = .white) {
        self.view.backgroundColor = color
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.view.backgroundColor = finalColor
        }
    }
    
    @IBAction func logInAction(_ sender: UIButton) {
        if !self.login.isEmpty, !self.password.isEmpty, self.login != password {
            self.colorBackGround(in: .green)
        } else {
            self.colorBackGround(in: .red, finalColor: .black)
        }
    }
}


