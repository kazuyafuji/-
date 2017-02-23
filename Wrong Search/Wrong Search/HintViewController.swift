//
//  HintViewController.swift
//  Wrong Search
//
//  Created by 藤原和矢 on 2017/01/12.
//  Copyright © 2017年 藤原和矢. All rights reserved.
//

import UIKit

class HintViewController: UIViewController {
    
    @IBOutlet var backback :UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        backback.layer.borderColor = UIColor.black.cgColor
        backback.layer.borderWidth = 1.0
        backback.layer.cornerRadius = 15

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        _ = self.navigationController?.popViewController(animated: true)
        
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
