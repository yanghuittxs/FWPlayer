//
//  HomeViewController.swift
//  FWPlayer_Example
//
//  Created by Hui Wang on 2019-07-04.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import Then

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleNavItem: UINavigationItem! {
        didSet {
            titleNavItem.titleView = titleImageView
        }
    }
    
    private lazy var titleImageView = UIImageView().then {
        let itemWidth = 53
        let itemHeight = 15
        $0.image = UIImage(named: "demo_logo")!.scaleToSize(size: CGSize(width: itemWidth, height: itemHeight))
        $0.frame = CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight)
    }
    
    private lazy var leftBarButton = UIButton(type: .custom).then {
        let itemSize = 20
        let image = UIImage(named: "navigation_drawer_dark")
        $0.setImage(image!.scaleToSize(size: CGSize(width: itemSize, height: itemSize)), for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: itemSize, height: itemSize)
        $0.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        $0.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.sideMenuController?.revealMenu()
        }).disposed(by: rx.disposeBag)
    }
    
    private lazy var rightBarButton = UIButton(type: .custom).then {
        let itemSize = 20
        let image = UIImage(named: "search_dark")
        $0.setImage(image!.scaleToSize(size: CGSize(width: itemSize, height: itemSize)), for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: itemSize, height: itemSize)
        $0.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        $0.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            Logging("rightBarButton click")
        }).disposed(by: rx.disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK:- Setup views
extension HomeViewController {
    private func setupUI() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
    }
}

// MARK:- Setup data
extension HomeViewController {
}