//
//  WAPlacesCell.swift
//  WorldApp
//
//  Created by Настя Сойко on 15.03.21.
//

import UIKit

class WAPlacesCell: UITableViewCell {

    static let reuceIdentifier: String = "WAPlacesCell"

    var favouriteWasTapped: (() -> Void)?
    var showFavIcon: Bool = true {
        didSet {
            self.starImageView.isHidden = !self.showFavIcon
        }
    }

    private var isFavourite: Bool = false {
        didSet {
            self.starImageView.image = isFavourite
                ? UIImage(systemName: "star.fill")
                : UIImage(systemName: "star")
        }
    }

    private lazy var cardContainerView: UIView = {
        let view = UIView()
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.clipsToBounds = false
        view.backgroundColor = .white

        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale

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

    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .yellow
        imageView.image = UIImage(systemName: "star")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(starTapped)))

        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.initCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initCell() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(self.cardContainerView)
        self.contentView.addSubview(self.placeImageView)
        self.contentView.addSubview(self.imageName)
        self.contentView.addSubview(self.imageDescription)
        self.contentView.addSubview(self.starImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.backgroundColor = selected ? .gray : .white

        // Configure the view for the selected state
    }

    override func updateConstraints() {

        self.starImageView.snp.updateConstraints { (make) in
            make.top.right.equalToSuperview().inset(15)
            make.size.equalTo(35)
        }

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

    func setcell(model: WAPlace) {
        self.imageName.text = model.title
        self.imageDescription.text = model.description
        self.isFavourite = model.isFavourite

        self.setNeedsUpdateConstraints()
    }

    @objc private func starTapped() {
        self.isFavourite.toggle()
        UIImpactFeedbackGenerator(style: .light).impactOccurred()

        self.favouriteWasTapped?()
    }
}
