//
//  WAPlacesCell.swift
//  WorldApp
//
//  Created by Настя Сойко on 15.03.21.
//

import UIKit

class WAPlacesCell: UITableViewCell {

    static let reuceIdentifier: String = "WAPlacesCell"

    private lazy var cardContainerView: UIView = {
        let view = UIView()
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.clipsToBounds = false
        view.backgroundColor = .white

        return view
    }()

    private lazy var placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chicago.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var imageName: UILabel = {
        let label = UILabel()
//        label.text = "Chicago"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var imageDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "The City of Chicago covers an area of 60,000 hectares and sits 176 meters (578 feet) above sea level on the southwestern shore of Lake Michigan. At 190 km wide and 495 km long, its the 5th largest body of fresh water in the world."
        label.numberOfLines = 0

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initCell() {
        self.contentView.addSubview(self.cardContainerView)
        self.contentView.addSubview(self.placeImageView)
        self.contentView.addSubview(self.imageName)
        self.contentView.addSubview(self.imageDescription)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.backgroundColor = selected ? .gray : .white

        // Configure the view for the selected state
    }

    override func updateConstraints() {
        self.cardContainerView.snp.updateConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.right.bottom.equalToSuperview().inset(15)
        }
        self.placeImageView.snp.updateConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(250)
        }

        self.imageName.snp.updateConstraints { (make) in
            make.top.equalTo(self.placeImageView.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(15)
        }

        self.imageDescription.snp.updateConstraints { (make) in
            make.top.equalTo(self.imageName.snp.bottom).offset(5)
            make.left.right.bottom.equalToSuperview().inset(15)
        }

        super.updateConstraints()
    }

    func setCellData(imageName: String, imageDescriptions: String) {
        self.imageName.text = imageName
        self.imageDescription.text = imageDescriptions

        self.setNeedsUpdateConstraints()
    }
}
