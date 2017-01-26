//
//  PlayViewController.swift
//  Wrong Search
//
//  Created by 藤原和矢 on 2017/01/12.
//  Copyright © 2017年 藤原和矢. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet var second: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    var finish: Bool = false
    
    
    //わからん！！！！
    override func viewWillAppear(_ animated: Bool) {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            
        }
        
        if finish == false {
            timer.invalidate()
        } else if finish == true {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            count = 0.0
            second.text = "0.0"
            finish = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func up() {
        count = count + 0.01
        second.text = String(format: "%.2f",count)
    }
    
    @IBAction func toHint() {
        let hintViewController :HintViewController = self.storyboard?.instantiateViewController(withIdentifier: "Hint") as! HintViewController
        self.navigationController?.pushViewController(hintViewController, animated: true)
        
        if timer.isValid == true {
            timer.invalidate()
        }
        
        finish = false
    }
    
    @IBAction func toResult() {
        let resultViewController :ResultViewController = self.storyboard?.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        self.navigationController?.pushViewController(resultViewController, animated: true)
        
        finish = true
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
