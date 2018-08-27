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
    }
    
    @IBAction func findAction(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "ShowGuide", sender: nil)
    }
    
    @IBAction func openWebAction(_ sender: AnyObject) {
        if let url = URL(string: "https://www.dev.freniklabs.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowGuide" {
            let guideViewController: GuideViewController = segue.destination as! GuideViewController
            guideViewController.continueBlock =  { (message) -> Void in
                self.performSegue(withIdentifier: "Search", sender: nil)
            }
        }
        else if segue.identifier == "Search" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "SearchViewController")
                self.present(controller, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension String {
    func checkFormatEmail()->Bool{
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
