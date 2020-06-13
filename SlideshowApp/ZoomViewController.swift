//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 大場一徹 on 2020/06/12.
//  Copyright © 2020 ittetsu.ooba. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var zoomedView: UIImageView!
    
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        zoomedView.image = selectedImage
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
