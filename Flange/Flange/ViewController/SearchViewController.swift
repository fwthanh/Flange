//
//  SearchViewController.swift
//  Flange
//
//  Created by Mac24h on 8/25/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import ActionSheetPicker

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectSpecAction(_ sender: AnyObject) {
        ActionSheetStringPicker.show(withTitle: "", rows: ["123", "456"], initialSelection: 0, doneBlock: { (picker, index, string) in
            print("success")
        }, cancel: { (picker) in
            print("cancel")
        }, origin: sender)
    }
    
    @IBAction func selectPressureAction(_ sender: AnyObject) {
        ActionSheetStringPicker.show(withTitle: "", rows: ["123", "456"], initialSelection: 0, doneBlock: { (picker, index, string) in
            print("success")
        }, cancel: { (picker) in
            print("cancel")
        }, origin: sender)
    }
    
    @IBAction func selectSizeAction(_ sender: AnyObject) {
        ActionSheetStringPicker.show(withTitle: "", rows: ["123", "456"], initialSelection: 0, doneBlock: { (picker, index, string) in
            print("success")
        }, cancel: { (picker) in
            print("cancel")
        }, origin: sender)
    }
    
    @IBAction func searchAction(_ sender: AnyObject) {
        //self.performSegue(withIdentifier: "ResultSearch", sender: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultSearchVC = storyboard.instantiateViewController(withIdentifier: "ResultSearchVC")
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: nil)
        present(resultSearchVC, animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
