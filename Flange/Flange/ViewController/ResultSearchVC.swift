//
//  ResultSearchVC.swift
//  Flange
//
//  Created by Mac24h on 8/25/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit

class ResultSearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightTable: NSLayoutConstraint!
    
    @IBOutlet weak var lbSize: UILabel!
    @IBOutlet weak var lbSpec: UILabel!
    @IBOutlet weak var lbPressure: UILabel!
    
    var posted: Posted? = nil
    var products: [Products]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightTable.constant = CGFloat(40 * (products?.count)!)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        
        lbSize.text = posted?.Size
        lbSpec.text = posted?.spec
        lbPressure.text = posted?.pressure_class
    }

    @IBAction func backAction(_ sender: AnyObject) {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (products?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SelectionTableViewCell") as! SelectionTableViewCell
        if self.products != nil && (self.products?.count)! > 0 && (self.products?.count)! > indexPath.row {
            let product = self.products![indexPath.row]
            cell.lbTitle.text = product.name
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productVC: ProductViewController = storyboard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        let product = self.products![indexPath.row]
        productVC.product = product
        productVC.posted = self.posted
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.present(productVC, animated: false, completion: nil)
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
