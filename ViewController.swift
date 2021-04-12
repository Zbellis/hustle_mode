//
//  ViewController.swift
//  trdy
//
//  Created by Zachary Ellis on 4/11/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var powerBtn: UIButton!
    
    var player: AVAudioPlayer!
    
    
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Refractored error do catc
        let path = Bundle.main.path(forResource: "best_hello", ofType: "m4a")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch _ as NSError {
            print("Error caught")
        }
        
    }


    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3) {
            self.rocket.frame = CGRect(x: 40, y: 40, width: 294, height: 495)
        } completion: { (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
        }

    }
}

