//
//  XTStepper.swift
//  VisualStepper
//
//  Created by Ben on 15/5/16.
//  Copyright (c) 2015年 X-Team. All rights reserved.
//

import UIKit

@IBDesignable class XTStepper: UIControl {
    
    var view: UIView!
    
    @IBOutlet weak private var valueLabel: UILabel!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var plusButton: UIButton!
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var value:Int = 0 {
        didSet{
            sendActionsForControlEvents(UIControlEvents.ValueChanged)
            self.updateApperance()
        }
    }
    @IBInspectable var maxinumValue:Int = 0 {
        didSet{
            self.updateApperance()
        }
    }
    @IBInspectable var minmumValue:Int = 0 {
        didSet{
            self.updateApperance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(view)
        var leading = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal,
            toItem: self, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        var top = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal,
            toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        var trailing = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal,
            toItem: self, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        var bottom = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal,
            toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        addConstraints([leading, top, trailing, bottom])
        self.updateApperance()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "XTStepper", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }

    func updateApperance(){
        valueLabel.text = String(value)
        minusButton.enabled = value > minmumValue && value <= maxinumValue
        plusButton.enabled = value >= minmumValue && value < maxinumValue
    }
    
    
    @IBAction func minusButtonPressed(sender: AnyObject) {
        --value;
    }
    
    
    @IBAction func plusButtonPressed(sender: AnyObject) {
        ++value;
    }
}
