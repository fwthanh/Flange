//
//  ProductViewController.swift
//  Flange
//
//  Created by Mac24h on 8/26/18.
//  Copyright © 2018 pqt. All rights reserved.
//

import UIKit
import AFImageHelper

class ProductViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSize: UILabel!
    @IBOutlet weak var lbOutDiameter: UILabel!
    @IBOutlet weak var lbThickness: UILabel!
    @IBOutlet weak var lbRfDia: UILabel!
    @IBOutlet weak var lbNoBoltHoles: UILabel!
    @IBOutlet weak var lbDiaHoles: UILabel!
    @IBOutlet weak var lbBoltCircle: UILabel!
    @IBOutlet weak var lbSOBoreId: UILabel!
    @IBOutlet weak var lbWNBoreId: UILabel!
    @IBOutlet weak var lbDiaHubBase: UILabel!
    @IBOutlet weak var lbDiaHubTop: UILabel!
    @IBOutlet weak var lbSO: UILabel!
    @IBOutlet weak var lbWN: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lbNote: UILabel!
    
    var posted: Posted? = nil
    var product: Products? = nil
    var variation: Variations? = nil
    
    var searchMainBlock: ((String) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbName.text = (product?.name)! + " - " + (posted?.Size)!
        self.imageView.image = UIImage.image(fromURL: Router.urlHostString + (product?.featured_image)!, placeholder: UIImage(named: "img_loading")!, closure: { (image) in
            self.imageView.image = image
        })
        lbNote.text = product?.notes
        ////////////////////////////
        if let variation = product?.variations?.enumerated().first(where: {$0.element.size == posted?.Size}) {
            let info: Variations = variation.element
            lbSize.text = info.size?.htmlToString
            lbOutDiameter.text = info.od
            lbThickness.text = info.t
            lbRfDia.text = info.r
            lbNoBoltHoles.text = info.nbh
            lbDiaHoles.text = info.dh
            lbBoltCircle.text = info.bc
            lbSOBoreId.text = info.sb
            lbWNBoreId.text = info.wb
            lbDiaHubBase.text = info.hb
            lbDiaHubTop.text = info.ht
            lbSO.text = info.sl
            lbWN.text = info.wl
        }
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
    
    @IBAction func openWebAction(_ sender: AnyObject) {
        if let url = URL(string: "https://www.dev.freniklabs.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func searchMainMenuAction(_ sender: AnyObject) {
        self.dismiss(animated: false) {
            if let searchMainBlock = self.searchMainBlock {
                searchMainBlock("")
            }
        }
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

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
