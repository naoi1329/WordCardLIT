//
//  ViewController.swift
//  WordCardLIT
//
//  Created by 直井翔汰 on 2018/04/14.
//  Copyright © 2018年 直井翔汰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButton(_ sender: UIButton) {
        
        if UserDefaults.standard.array(forKey: "WORD") == nil {
            let alert = UIAlertController(title: "単語を登録してください", message: "単語がまだ登録されていません。「単語一覧」ボタンから単語を登録してください。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        performSegue(withIdentifier: "toTest", sender: nil)
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {
        
    }
}

