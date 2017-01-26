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
        
        //タイマーが止まっている時
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            timer.fire()
        }
        
        //結果画面から戻ってきた時のみ
        if finish == true {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            count = 0.0
            finish = false  //もう一度やる時のために戻しておく
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let resultViewController: ResultViewController = segue.destination as! ResultViewController
            print(second.text)
            resultViewController.sendText = self.second.text!
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
        performSegue(withIdentifier: "toHint", sender: nil)
        timer.invalidate()
    }
    
    @IBAction func toResult() {
         performSegue(withIdentifier: "toResult", sender: nil)
        
        //タイマーを止めて、finishをtrue
        timer.invalidate()
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
