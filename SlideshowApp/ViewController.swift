//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yoshiyuki Karikome on 2022/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let imageNames = ["image0.jpg", "image1.jpg", "image2.jpg"]
    var changeImgNo = 0
    
    @IBOutlet weak var ZoomButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var playstopButton: UIButton!
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "image0.jpg")
        
    }
    
    
    @objc func updateTimer(_ timer: Timer) {
        if changeImgNo == 0 {
            changeImgNo = 1
        } else if changeImgNo == 1 {
            changeImgNo = 2
        } else if changeImgNo == 2 {
            changeImgNo = 0
        }
        let imageName = imageNames[changeImgNo]
        imageView.image = UIImage(named: imageName)
        
    }
    
    @IBAction func forward(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 1
        } else if changeImgNo == 1 {
            changeImgNo = 2
        } else if changeImgNo == 2 {
            changeImgNo = 0
        }
        let imageName = imageNames[changeImgNo]
        imageView.image = UIImage(named: imageName)
    }
    
    @IBAction func back(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 2
        } else if changeImgNo == 2 {
            changeImgNo = 1
        } else if changeImgNo == 1 {
            changeImgNo = 0
        }
        let imageName = imageNames[changeImgNo]
        imageView.image = UIImage(named: imageName)
    }
    
    @IBAction func playstop(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            self.timer.invalidate()
            self.timer = nil
        }
        
        if self.timer == nil {
            forwardButton.isEnabled = true
            backButton.isEnabled = true
        } else {
            forwardButton.isEnabled = false
            backButton.isEnabled = false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        secondViewController.image = UIImage(named: imageNames[changeImgNo])
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

