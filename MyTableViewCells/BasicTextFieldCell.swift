//
//  BasicTextFieldCell.swift
//  MyTableViewCells
//
//  Created by Benjamin King on 4/22/15.
//  Copyright (c) 2015 Benjamin King. All rights reserved.
//

// Inspired by ResearchKit -- ORKFormItemCell.m

import UIKit

class BasicTextFieldCell: UITableViewCell {
    
    //var myConstraints :[NSLayoutConstraint] = []
    var textField: UITextField!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        self.cellInit()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellInit()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func cellInit() {

        self.textField = UITextField()
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textField.placeholder = "Hello World"
        self.textField.backgroundColor = UIColor.greenColor()
        self.contentView.addSubview(textField)
        
        let contentConstraint = NSLayoutConstraint(item: self.contentView, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1.0, constant: 0)
        contentConstraint.priority = 750    // DefaultHigh
        self.addConstraint(contentConstraint)
        
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let metrics = ["vMargin": 10, "hMargin": self.separatorInset.left, "hSpacer": 15, "vSpacer": 15]
        let views = ["textField" : self.textField]
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-hMargin-[textField]-hMargin-|", options: .DirectionLeadingToTrailing, metrics: metrics, views: views))
        
        self.contentView.addConstraint(NSLayoutConstraint(item: self.contentView, attribute: .CenterY, relatedBy: .Equal, toItem: self.textField, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        self.contentView.addConstraint(NSLayoutConstraint(item: self.contentView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: self.textField, attribute: .Height, multiplier: 1.0, constant: 0))
        
        self.contentView.addConstraint(NSLayoutConstraint(item: self.contentView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 43.5))
        
        //self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[textField]-|", options: .AlignAllCenterY, metrics: nil, views: views))
        
        //self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-vMargin-[textField]-vMargin-|", options: .DirectionLeadingToTrailing, metrics: metrics, views: views))

    }
    
    override func becomeFirstResponder() -> Bool {
        return self.textField.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        let ret = super.resignFirstResponder()
        return self.textField.resignFirstResponder() || ret
    }

}
