//
//  ResultViewController.swift
//  Wrong Search
//
//  Created by 藤原和矢 on 2017/01/12.
//  Copyright © 2017年 藤原和矢. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultSecond: UILabel!
    @IBOutlet var resultLevel: UILabel!
    @IBOutlet var resultMemo: UITextView!
    
    var sendText : String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = sendText + "秒"
        resultSecond.text = text
        let sendtext = Double(sendText)!
        
        if sendtext <= 120.0 {
            resultLevel.text = "Sランク！！"
            resultMemo.text = "すごすぎる！神様レベル！"
        } else if sendtext <= 150.0 {
            resultLevel.text = "Aランク!"
            resultMemo.text = "天才！"
        } else if sendtext <= 200.0 {
            resultLevel.text = "Bランク"
            resultMemo.text = "Aランクまであとすこしがんばろう！"
        } else if sendtext > 200.0 {
            resultLevel.text = "Cランク..."
            resultMemo.text = "Bランク目指して頑張ろう!"
        }
        
        // Do any additional setup after loading the view.
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func back() {
        _ = self.navigationController?.popViewController(animated: true)
        
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
