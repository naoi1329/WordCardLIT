//
//  TestViewController.swift
//  WordCardLIT
//
//  Created by 直井翔汰 on 2018/04/14.
//  Copyright © 2018年 直井翔汰. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    var isAnswered: Bool = false
    var nowNumber: Int = 0
    @IBOutlet var englishLabel: UILabel!
    @IBOutlet var japaneseLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    var wordsDictionary: [Dictionary<String, String>] = []
    var shuffleWordArray: [Dictionary<String, String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        japaneseLabel.text = ""
        if  UserDefaults.standard.array(forKey: "WORD") != nil {
            wordsDictionary = UserDefaults.standard.array(forKey: "WORD") as! [Dictionary<String, String>]
            
            englishLabel.text = wordsDictionary[nowNumber]["english"]
        }

        shuffle()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        
        if isAnswered {
            nowNumber += 1
            japaneseLabel.text = ""
            
            if nowNumber < shuffleWordArray.count {
                englishLabel.text = shuffleWordArray[nowNumber]["english"]
                
                isAnswered = false
                
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                performSegue(withIdentifier: "toResult", sender: nil)
            }
        } else {
            japaneseLabel.text = shuffleWordArray[nowNumber]["japanese"]
            
            isAnswered = true
            
            nextButton.setTitle("次へ", for: .normal)
        }
    }
    
    func shuffle() {
        while wordsDictionary.count > 0 {
            let index = Int(arc4random()) % wordsDictionary.count
            shuffleWordArray.append(wordsDictionary[index])
            wordsDictionary.remove(at: index)
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
