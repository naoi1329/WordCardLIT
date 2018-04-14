//
//  WordAddViewController.swift
//  WordCardLIT
//
//  Created by 直井翔汰 on 2018/04/14.
//  Copyright © 2018年 直井翔汰. All rights reserved.
//

import UIKit

class WordAddViewController: UIViewController {
    
    @IBOutlet var englishLabel: UITextField!
    @IBOutlet var japaneseLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addButton(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        var saveData = userDefaults.array(forKey: "WORD") as! [Dictionary<String, String>]?
        if var newSaveData = saveData {
            newSaveData.append(["english": englishLabel.text!, "japanese": japaneseLabel.text!])
            userDefaults.set(newSaveData, forKey: "WORD")
        } else {
            userDefaults.set([["english": englishLabel.text, "japanese": japaneseLabel.text]], forKey: "WORD")
        }
        
        let alert = UIAlertController(title: "保存完了", message: "単語の登録が終了しました", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        englishLabel.text = ""
        japaneseLabel.text = ""
        
        
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
