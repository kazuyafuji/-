//
//  HomeViewController.swift
//  Wrong Search
//
//  Created by 藤原和矢 on 2017/01/12.
//  Copyright © 2017年 藤原和矢. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var start : UIButton!
    @IBOutlet var howTo: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        start.layer.borderColor = UIColor.black.cgColor
        start.layer.borderWidth = 1.0
        start.layer.cornerRadius = 15
        
        howTo.layer.borderColor = UIColor.black.cgColor
        howTo.layer.borderWidth = 1.0
        howTo.layer.cornerRadius = 15
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
