//
//  HowToViewController.swift
//  Wrong Search
//
//  Created by 藤原和矢 on 2017/01/12.
//  Copyright © 2017年 藤原和矢. All rights reserved.
//

import UIKit

class HowToViewController: UIViewController {
    
    @IBOutlet var sentence1 : UITextField!
    @IBOutlet var sentence2 : UITextField!
    @IBOutlet var sentence3 : UITextField!
    @IBOutlet var sentence4 : UITextField!

    
    @IBOutlet var back :UIButton!
    @IBOutlet var hint : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sentence1.isEnabled = false
        sentence2.isEnabled = false
        sentence3.isEnabled = false
        sentence4.isEnabled = false

        back.layer.borderColor = UIColor.black.cgColor
        back.layer.borderWidth = 1.0
        back.layer.cornerRadius = 15
        
        hint.layer.borderColor = UIColor.black.cgColor
        hint.layer.borderWidth = 1.0
        hint.layer.cornerRadius = 15


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
      @IBAction func home() {
        
        _ = self.navigationController?.popToRootViewController(animated: true)
        
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
