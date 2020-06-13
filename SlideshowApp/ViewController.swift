//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 大場一徹 on 2020/06/12.
//  Copyright © 2020 ittetsu.ooba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //タイマー
    var timer: Timer!
    
    var displayImageNumber = 0
    
    let imageNameGroup = ["Jisso.jpeg", "Lisa.jpeg", "Jennie.jpeg", "Rose.jpeg"]
    
    @objc func displayImage(){
        
        let name = imageNameGroup[displayImageNumber]
        
        let image = UIImage(named: name)
        
        imageView.image = image
    }
    
    @IBOutlet weak var imageView: UIImageView!
    //進む
    @IBAction func forwardBotton(_ sender: Any) {
        if self.timer == nil{
            if displayImageNumber + 1 != imageNameGroup.count{
                displayImageNumber += 1
            }
            else {
                displayImageNumber = 0
            }
            displayImage()
        }
    }
    //戻る
    @IBAction func backwardBotton(_ sender: Any) {
        if self.timer == nil{
            if displayImageNumber != 0{
                displayImageNumber -= 1
            }
            else {
                displayImageNumber = imageNameGroup.count - 1
            }
            displayImage()
        }
    }
    //再生または停止
    @IBAction func playOrPauseBotton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(handleTimer(_ :)), userInfo: nil, repeats: true)
        }
        else {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil
        }
    }
    
    @objc func handleTimer(_ timer: Timer){
        if displayImageNumber + 1 != imageNameGroup.count{
            displayImageNumber += 1
        }
        
        else {
            displayImageNumber = 0
        }
        displayImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "Jisso.jpeg")
        imageView.image = image 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        
        zoomViewController.selectedImage = imageView.image
        
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    @IBAction func tappedView(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

 
