//
//  RewardViewController.swift
//  AdMob
//
//  Created by Selçuk Arıöz on 24.07.2024.
//

import UIKit
import SnapKit

class RewardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupUI()
    }
    
    func setupUI(){
        let label = UILabel()
        label.text = "you earn reward"
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = .darkGray
        view.addSubview(label)
        label.snp.makeConstraints{make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
