//
//  WAViewController.swift
//  WorldApp
//
//  Created by Настя Сойко on 15.03.21.
//

import UIKit

class WAViewController: UIViewController {

    private lazy var mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.backgroundColor = .clear

        return scroll
    }()

    private(set) lazy var mainVew = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.mainScrollView)
        self.mainScrollView.addSubview(self.mainVew)

        self.mainScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }

        self.mainVew.snp.makeConstraints { (make) in
            make.edges.width.equalToSuperview()
        }
    }
}
