//
//  ViewController.swift
//  ImageCollection
//
//  Created by Настя Сойко on 8.02.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var digits: [UIButton]!
    
    @IBOutlet weak var backgroundImagesStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.digits.enumerated().forEach { index, digit in
            digit.tag = index + 1
        }
    }
    
    private func createHorizontalStack() -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = 15
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }
    private func fillStackViewWith(image: UIImage) {
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/5).isActive = true
        
        if let lastStackView = self.backgroundImagesStackView.subviews.last as? UIStackView, lastStackView.subviews.count < 3 {
            lastStackView.addArrangedSubview(view)
        } else {
            let stackView = self.createHorizontalStack()
            stackView.addArrangedSubview(view)
            self.backgroundImagesStackView.addArrangedSubview(stackView)
        }
        self.backgroundImagesStackView.addArrangedSubview(view)
    }
    
    private func getImage(with index: Int) -> UIImage? {
        if let image = UIImage(named: index.toString()) {
            return image
        }
        return nil
    }
    
    @IBAction func digitTapped(_ sender: UIButton) {
        if let image = self.getImage(with: sender.tag) {
            self.fillStackViewWith(image: image)
        }
    }
}

extension Int {
    func toString() -> String {
        return "\(self)"
    }
}
