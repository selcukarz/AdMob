//
//  ViewController.swift
//  AdMob
//
//  Created by Selçuk Arıöz on 23.07.2024.
//

import UIKit
import GoogleMobileAds
import SnapKit

class ViewController: UIViewController{

    var interstitial: GADInterstitialAd?
    var rewardedInterstitialAd: GADRewardedAd?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAds()
        loadRewarded()
    }

    func setupAds(){
 // BANNER
        let banner = GADBannerView()
        banner.adUnitID = "ca-app-pub-3940256099942544/2435281174"
        banner.load(GADRequest())
        banner.backgroundColor = .secondarySystemBackground
        banner.rootViewController = self
        view.addSubview(banner)
        banner.snp.makeConstraints{make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        loadInterstitialAd()
        
// REWARDED AD
        
        let myView = UIView()
        myView.backgroundColor = .blue
        myView.layer.cornerRadius = 14
        view.addSubview(myView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rewardedViewTapped))
        myView.isUserInteractionEnabled = true
        myView.addGestureRecognizer(tapGesture)
        myView.snp.makeConstraints{make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }
    }
    func loadInterstitialAd(){
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910", request: request) {ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self.interstitial = ad
            
            _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] _ in
                if let interstitial = self?.interstitial {
                    interstitial.present(fromRootViewController: self)
                } else {
                    print("Interstitial ad wasn't loaded")
                }
            }
        }
    }
    func loadRewarded(){
        let request = GADRequest()
        GADRewardedAd.load(withAdUnitID: "ca-app-pub-8780997931921366/6255552975", request: request) { [weak self] ad, error in
            if let error = error {
                print("Failed to load rewarded ad with error: \(error.localizedDescription)")
                return
            }
            self?.rewardedInterstitialAd = ad
        }
    }
    @objc func rewardedViewTapped(){
        if let rewardedInterstitialAd = rewardedInterstitialAd {
            rewardedInterstitialAd.present(fromRootViewController: self) { [weak self] in
                self?.navigationController?.pushViewController(RewardViewController(), animated: true)
            }
        } else {
            print("Rewarded ad wasn't loaded")
        }

    }
    
}


