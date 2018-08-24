//
//  GuideViewController.swift
//  Flange
//
//  Created by PqThanh on 8/23/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {

    //var continueBlock: ((String) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func continueAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
//        let uiAlert = UIAlertController(title: errMsg, message: "", preferredStyle: UIAlertControllerStyle.alert)
//        uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
//            print("Click of default button")
//        }))
//        self.present(uiAlert, animated: true, completion: nil)
//        if let continueBlock = self.continueBlock {
//            continueBlock("")
//            self.dismiss(animated: true, completion: nil)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
