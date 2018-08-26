//
//  SearchViewController.swift
//  Flange
//
//  Created by Mac24h on 8/25/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import ActionSheetPicker
import SVProgressHUD

class SearchViewController: UIViewController {

    @IBOutlet weak var tfSpec: UITextField!
    @IBOutlet weak var tfPressure: UITextField!
    @IBOutlet weak var tfSize: UITextField!
    
    let listSpec = ["AWWA C207", "AWWA C228", "ANSI B16.5", "ANSI B16.1", "MSS", "API", "ASME B16.47", "Industry Std", "125 Lightweight", "Ductile Iron Backup", "Stainless Backup"]
    let listSize = ["0.5", "0.75", "1", "1.25", "1.5", "2", "2.5", "3", "3.5", "4", "5", "6", "8", "10", "12", "14", "16", "18", "20","22", "24", "26", "28", "30", "32", "34", "36", "38", "40", "42", "44", "46", "48", "50", "52", "54", "56", "58", "60", "66", "72", "78", "84", "90", "96", "102", "108", "114", "120", "126", "132", "144" ]
    let listPressure = ["50", "75", "86", "150", "175", "275", "300", "350", "600", "900", "1500", "2500", "Not Rated" ]
    
    var currentIndexSpec = 0
    var currentIndexSize = 0
    var currentIndexPressure = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        API.sharedInstance.productCategories { (listCategory, string) in
//            print("\(listCategory)")
//        }
    }

    @IBAction func backAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectSpecAction(_ sender: AnyObject) {
        ActionSheetStringPicker.show(withTitle: "", rows: listSpec, initialSelection: currentIndexSpec, doneBlock: { (picker, index, value) in
            self.currentIndexSpec = index
            self.tfSpec.text = value as? String
        }, cancel: { (picker) in }, origin: sender)
    }
    
    @IBAction func selectPressureAction(_ sender: AnyObject) {
        ActionSheetStringPicker.show(withTitle: "", rows: listPressure, initialSelection: currentIndexPressure, doneBlock: { (picker, index, value) in
            self.currentIndexPressure = index
            self.tfPressure.text = value as? String
        }, cancel: { (picker) in
            print("cancel")
        }, origin: sender)
    }
    
    @IBAction func selectSizeAction(_ sender: AnyObject) {
        ActionSheetStringPicker.show(withTitle: "", rows: listSize, initialSelection: currentIndexSize, doneBlock: { (picker, index, value) in
            self.currentIndexSize = index
            self.tfSize.text = value as? String
        }, cancel: { (picker) in
            print("cancel")
        }, origin: sender)
    }
    
    @IBAction func searchAction(_ sender: AnyObject) {
        //self.performSegue(withIdentifier: "ResultSearch", sender: nil)
        SVProgressHUD.show(withStatus: "Loading Data")
        API.sharedInstance.search(spec: tfSpec.text!, Size: tfSize.text!, pressure_class: tfPressure.text!) { (products, posted, errMsg) in
            if products != nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let resultSearchVC: ResultSearchVC = storyboard.instantiateViewController(withIdentifier: "ResultSearchVC") as! ResultSearchVC
                resultSearchVC.products = products
                resultSearchVC.posted = posted
                let transition: CATransition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                transition.type = kCATransitionReveal
                transition.subtype = kCATransitionFromRight
                self.view.window!.layer.add(transition, forKey: nil)
                self.present(resultSearchVC, animated: false, completion: nil)
            }
            else {
                let uiAlert = UIAlertController(title: "No record found", message: "", preferredStyle: UIAlertControllerStyle.alert)
                uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    print("Click of default button")
                }))
                self.present(uiAlert, animated: true, completion: nil)
            }
            SVProgressHUD.dismiss()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
