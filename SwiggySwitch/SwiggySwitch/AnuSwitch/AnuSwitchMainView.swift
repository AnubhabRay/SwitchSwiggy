//
//  AnuSwitchMainView.swift
//  SwiggySwitch
//
//  Created by Anubhab Ray on 05/04/18.
//  Copyright © 2018 Anubhab Ray. All rights reserved.
//

import UIKit

protocol CounterChangedProtocol{
    func counterChanegdTo(counter : Int, superTag : Int)
}

class AnuSwitchMainView: UIView {
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblCountLower: UILabel!
    @IBOutlet weak var lblCountUpper: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    
    var fontName : UIFont?
    var fontNameAnimation : UIFont?
    var delegate : CounterChangedProtocol?
    var borderMainColor : UIColor?
    var isSetDefaults = false
    
    var counter = 1
    var animationTime : TimeInterval?
    
    var maxValue = 10
    var minValue = 1
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = rect.size.height / 2.0
        self.clipsToBounds = true
        self.layer.borderColor = borderMainColor?.cgColor
        self.layer.borderWidth  =   1.0
        lblCount.font = fontName
        
        if isSetDefaults {
            setDefaults()
        }
    }
    
    func setDefaults()  {
        fontName = UIFont (name: "HelveticaNeue-Bold", size: 15)
        fontNameAnimation = UIFont (name: "HelveticaNeue", size: 14)
        borderMainColor =  UIColor(red: 234.0/255.0, green: 239.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        animationTime = 0.3
        minValue = 1
        maxValue = 99
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    @IBAction func addClicked(_ sender: UIButton) {
        if counter != maxValue{
            counter = counter + 1
            btnPlus.isEnabled = false
            animateUpper()
            sendValueToDelegate()
        }
    }
    
    func animateUpper()  {
        lblCount.text = ""
        let lbl = UILabel()
        lbl.text = "\(counter)"
        lbl.frame = lblCountUpper.frame
        lbl.textAlignment = NSTextAlignment.center
        lbl.font = fontNameAnimation
        self.addSubview(lbl)
        
        let lbl1 = UILabel()
        lbl1.text = "\(counter - 1)"
        lbl1.frame = lblCount.frame
        lbl1.textAlignment = NSTextAlignment.center
        lbl1.font = fontNameAnimation
        self.addSubview(lbl1)
        
        
        UIView.animate(withDuration: animationTime!) {
            lbl.frame = self.lblCount.frame
            lbl1.frame = self.lblCountLower.frame

            self.layoutIfNeeded()
            
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + animationTime!, execute: {
            self.lblCount.text = "\(self.counter)"
            lbl1.removeFromSuperview()
            lbl.removeFromSuperview()
            self.btnPlus.isEnabled = true
        })
        
        
    }
    func animateLower()  {
        lblCount.text = ""
        let lbl = UILabel()
        lbl.text = "\(counter)"
        lbl.frame = lblCountLower.frame
        lbl.textAlignment = NSTextAlignment.center
        lbl.font = fontNameAnimation
        self.addSubview(lbl)
        
        let lbl1 = UILabel()
        lbl1.text = "\(counter + 1)"
        lbl1.frame = lblCount.frame
        lbl1.textAlignment = NSTextAlignment.center
        lbl1.font = fontNameAnimation
        self.addSubview(lbl1)
        
        
        UIView.animate(withDuration: animationTime!) {
            lbl.frame = self.lblCount.frame
            lbl1.frame = self.lblCountUpper.frame
            
            self.layoutIfNeeded()
            
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + animationTime!, execute: {
            self.lblCount.text = "\(self.counter)"
            lbl1.removeFromSuperview()
            lbl.removeFromSuperview()
            self.btnMinus.isEnabled = true
        })
        
        
    }
    
    @IBAction func minusClicked(_ sender: UIButton) {
        if counter != minValue{
            counter = counter - 1
            btnMinus.isEnabled = false
            animateLower()
            sendValueToDelegate()
        }
    }
    func sendValueToDelegate()  {
        delegate?.counterChanegdTo(counter: self.counter, superTag: (self.superview?.tag)!)
    }
}
