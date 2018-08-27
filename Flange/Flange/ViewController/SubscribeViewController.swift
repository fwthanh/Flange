//
//  SubscribeViewController.swift
//  Flange
//
//  Created by Mac24h on 8/27/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit

class SubscribeViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.contentView.layer.shadowPath = UIBezierPath(roundedRect:
            self.contentView.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowOpacity = 0.15
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.contentView.layer.shadowRadius = 4
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.cornerRadius = 6.0
    }

    @IBAction func closeAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func subscribeAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
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
