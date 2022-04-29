//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yoshiyuki Karikome on 2022/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image1: UIImage!
    
    @IBOutlet weak var ZoomButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var playstopButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image1 = UIImage(named: "airplane-3702676_1280.jpg")
        
        // Do any additional setup after loading the view.
        
        imageView.image = image1
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
}

