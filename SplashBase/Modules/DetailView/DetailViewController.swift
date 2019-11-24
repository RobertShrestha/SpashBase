//
//  DetailViewController.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//Copyright © 2019 robert. All rights reserved.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {
    var viewModel:DetailViewModel?
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var favouriteBtn:UIButton!
    @IBOutlet weak var nameLblTxt:UILabel!
    @IBOutlet var playBtn: UIImageView!
    
    @IBOutlet var copyRightLblTxt: UILabel!
    
    @IBOutlet var sourceLblTxt: UILabel!
    var bRec:Bool = true
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetail()
        
        self.nameLblTxt.text = self.viewModel?.imageName
        if let url = self.viewModel?.largeUrl{
            playbuttonHandler(url)
            if url.isMp4URL{
            
                self.imageView.kf.setImage(with: URL(string: (self.viewModel?.url)!))
            }else{
                self.imageView.kf.setImage(with: URL(string: (self.viewModel?.largeUrl)!))
            }
        }
        

        
    }
    
    fileprivate func playbuttonHandler(_ url: String) {
        playBtn.isHidden = !url.isMp4URL
    }
    
    
    fileprivate func getDetail() {
        viewModel?.getImageDetail(completionHandler: { result in
            switch result{
                
            case .success( _):
                if let site = self.viewModel?.site{
                    print(site)
                    if !site.isEmpty{
                    self.sourceLblTxt.text = "Source: \(site)"
                    }
                }
                if let copyright = self.viewModel?.copyright{
                    if !copyright.isEmpty{
                        self.copyRightLblTxt.text = "Copyright: \(copyright)"
                    }
                }
                    
            case .failure(let error):
                print(error)
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        })
    }
    @IBAction func shareBtnTapped(_ sender: Any) {
        
        
        viewModel?.share(navigationController: self.navigationController!)
        
        print("Share Btn Pressed")
    }
    @IBAction func downBtnTapped(_ sender: Any) {
        print("Download Btn Pressed")
       self.viewModel?.openLinkInBrowswer()
        
    }
    fileprivate func playVideoInAVPLayer() {
        
        //Use this link to test the player
        //let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        
        let videoURL = URL(string: self.viewModel?.largeUrl ?? "")
        
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    
    @IBAction func playBtnTapped(_ sender: Any) {
        
        guard let url = self.viewModel?.largeUrl else { return }
        
            if url.isMp4URL{
                 playVideoInAVPLayer()
            }else{
                viewModel?.goToImageViewer(navigation: self.navigationController!, imageURL: url)
        }
                
        
       
    }
    
    @IBAction func favBtnPressed(_ sender: Any) {
        
        bRec = !bRec
        if bRec {
            favouriteBtn.setImage(UIImage(named: "FavouriteInActiveIcon"), for: .normal)
        } else {
            favouriteBtn.setImage(UIImage(named: "FavouriteActiveIcon"), for: .normal)
        }
        favouriteBtn.heatBeatAnimation()
    }
}
