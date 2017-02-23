//
//  PlayViewController.swift
//  Wrong Search
//
//  Created by 藤原和矢 on 2017/01/12.
//  Copyright © 2017年 藤原和矢. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet var toHints :UIButton!
    
    @IBOutlet var tag :UILabel!
    
    //viewの入れ子の作成
    @IBOutlet var setView : UIView!
    
    @IBOutlet var second: UILabel!
    
    var number: Int!
    var count: Float = 0.0
    var timer: Timer = Timer()
    var finish: Bool = false
    var lastNumber :Int = 10
    var countProblem :Int = 0
    var wrongArray: [String] = ["犬","成","木","墨","日","竿","飲","両","面","八"]
    var correctArray: [String] = ["大","城","禾","黒","田","干","飾","内","雨","入"]
    var hint :Bool = false
    
    
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
            NSLog("countProblemは%d", countProblem)
        }
        
        if hint == false{
            
            self.addButton()
            countProblem = countProblem + 1
            
            //何問目かを表示する
            tag.text = "第"+String(countProblem)+"問"
            
        }else if hint == true {
            hint = false
        }
        
        toHints.layer.borderColor = UIColor.black.cgColor
        toHints.layer.borderWidth = 1.0
        toHints.layer.cornerRadius = 15

        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let resultViewController: ResultViewController = segue.destination as! ResultViewController
            print(second.text as Any)
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
        hint = true
    }
    
    func answerTapped() {
        //ボタンを一度消す
        let subviews = setView.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        
        //結果画面へ移動
        if countProblem > 9 {
            performSegue(withIdentifier: "toResult", sender: nil)
            
            //タイマーを止めてfinishをtrue
            timer.invalidate()
            finish = true
            
            countProblem = 0
            
            hint = false
        } else if  countProblem <= 9 {
            self.addButton()
            countProblem = countProblem + 1
            
            //何問目かを表示する
            tag.text = "第"+String(countProblem)+"問"
            
            hint = false
            
        }
        
       

    }
    
    func wrongTapped() {
        timer.invalidate()
        finish = false
        hint = false
        
        //間違いのアラートを表示
        let alert:UIAlertController = UIAlertController(title: "不正解", message: "", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "続ける", style: UIAlertActionStyle.default,
                          handler: { action in
                            _ = self.dismiss(animated: true, completion: nil)
                            self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
                            
                            
            }
                
            )
            
        )
        alert.addAction(
            UIAlertAction(title: "ヒントへ", style: UIAlertActionStyle.default,
                          handler: { action in
                            self.performSegue(withIdentifier: "toHint", sender: nil)
                            self.hint  = true
            }
            )
            
            
            
        )
        present(alert, animated: true, completion:  nil)
        
        
        
    }
    
    func addButton() {
        //ボタンを複数個設置
        number = Int(arc4random_uniform(9))
        NSLog("numberの値は%dです", number)
        
        for n in 0...2 {
            
            //for文の入れ子
            for i in 0...2 {
                
                let button = UIButton()
                button.layer.anchorPoint = CGPoint.zero
                button.frame = CGRect(x: 0,y: 0, width: 100, height: 100)
                button.layer.position = CGPoint(x: 100*i, y: 100*n)
                button.tag = i + n*3
                self.setView.addSubview(button)
                
                let tag: Int = button.tag
                
                if tag == number {
                    button.setTitle(correctArray[countProblem], for: .normal)
                    button.setTitleColor(UIColor.black, for: .normal)
                    button.addTarget(self, action: #selector(PlayViewController.answerTapped), for:.touchUpInside)
                    
                } else {
                    button.setTitle(wrongArray[countProblem], for: .normal)
                    button.setTitleColor(UIColor.black, for: .normal)
                    button.addTarget(self, action: #selector(PlayViewController.wrongTapped), for:.touchUpInside)
                    
                }
            }
        }
        
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
