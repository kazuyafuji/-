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
    @IBOutlet var textView :UITextView!
    
    var sendProblem : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        backback.layer.borderColor = UIColor.black.cgColor
        backback.layer.borderWidth = 1.0
        backback.layer.cornerRadius = 15
        
        let sendproblem = Int(sendProblem)! - 1
        
        let array  = ["田という字が隠れています！",
                      "ひとつだけ竹かんむりがない？",
                      "禾がどこかに。。。",
                      "ひとつだけ点がない？！",
                      "内という字が隠れている。",
                      "土へんがついた感じがひとつ。。。",
                      "飲にまぎれて飾が！",
                      "墨の中に黒が混ざってる！　ひとつだけ下に土がない！",
                      "どこかに雨があります。",
                      "人の中に入りがひとつだけあります。　上が横に出ているのが特徴！"]
        
        textView.text = array[sendproblem]
        
        
        
        
        
        
        
        
        
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
