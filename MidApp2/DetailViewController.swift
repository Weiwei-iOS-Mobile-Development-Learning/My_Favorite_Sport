//
//  DetailViewController.swift
//  MidApp2
//
//  Created by NDHU_CSIE on 2020/11/12.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var sportImageView: UIImageView!
    
    var sportImageName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        sportImageView.image = UIImage(named: sportImageName)
        // Do any additional setup after loading the view.
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
