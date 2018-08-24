//
//  ViewController.swift
//  Flange
//
//  Created by PqThanh on 8/21/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // in half a second...
            self.performSegue(withIdentifier: "showGuide", sender: nil)
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGuide" {
//            let otpView: OTPViewController = segue.destination as! OTPViewController
//            otpView.userId = userDetail.id
//            otpView.otpBlock =  { (phone) -> Void in
//                SVProgressHUD.show()
//                self.userDetail.mobile = phone == "" ? "0" : phone
//                self.tableView.reloadData()
//            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

