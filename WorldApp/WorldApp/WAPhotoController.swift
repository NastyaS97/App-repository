//
//  WAPhotoController.swift
//  WorldApp
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit

class WAPhotoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        self.title = "Photo"

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewWasTapped)))
    }

    @objc private func viewWasTapped() {
        self.navigationController?.pushViewController(WAPhotoController(), animated: true)
    }
}
