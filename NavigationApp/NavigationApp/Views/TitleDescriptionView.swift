//
//  TitleDescriptionView.swift
//  NavigationApp
//
//  Created by Настя Сойко on 15.02.21.
//

import UIKit

@IBDesignable
class TitleDescriptionView: UIView {

    //    MARK: - IBInspectable

    @IBInspectable
    var titleText: String = "" {
        didSet {
            self.titleLabel.text = self.titleText
        }
    }
    @IBInspectable
    var descriptionalText: String = "" {
        didSet {
            self.descriptionaLabel.text = self.descriptionalText
        }
    }
    // MARK: - IBOtlet
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionaLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initView()
    }
    func initView() {
        self.loadFromNib()
    }
}
