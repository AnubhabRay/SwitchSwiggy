//
//  ViewController.swift
//  SwiggySwitch
//
//  Created by Anubhab Ray on 05/04/18.
//  Copyright © 2018 Anubhab Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBtn: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let vw  = Bundle.main.loadNibNamed("AnuSwitchView", owner: self, options: nil)?.first as? AnuSwitchMainView
        vw?.frame = viewBtn.bounds
        vw?.delegate = self
        vw?.fontName = UIFont (name: "HelveticaNeue-Bold", size: 15)
        vw?.fontNameAnimation = UIFont (name: "HelveticaNeue", size: 14)
        vw?.borderMainColor =  UIColor(red: 234.0/255.0, green: 239.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        vw?.animationTime = 0.3
        vw?.maxValue = 99
        vw?.minValue = 1
        self.viewBtn.addSubview(vw!)
       

//        cell.vwButton.tag = indexPath.row
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : CounterChangedProtocol{
    func counterChanegdTo(counter: Int, superTag: Int) {
        //code here
        print("counter : \(counter) for tag : \(superTag)" )
    }
}
