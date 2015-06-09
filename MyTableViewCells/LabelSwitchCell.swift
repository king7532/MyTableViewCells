//
//  LabelSwitchCell.swift
//  MyTableViewCells
//
//  Created by Benjamin King on 4/24/15.
//  Copyright (c) 2015 Benjamin King. All rights reserved.
//

import UIKit

class LabelSwitchCell: UITableViewCell {
    
    var myConstraints = [NSLayoutConstraint]()
    var uiSwitch: UISwitch!
    var switchLabel: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        self.cellInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellInit()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //override func textLabel() -> UILabel! {
      //  return self.switchLabel
    //}
    
    func cellInit() {
        self.uiSwitch = UISwitch()
        self.uiSwitch.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.uiSwitch.on = false
        self.contentView.addSubview(self.uiSwitch)
        
        self.switchLabel = UILabel()
        self.switchLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentView.addSubview(self.switchLabel)
        
        var contentConstraint = NSLayoutConstraint(item: self.contentView, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1.0, constant: 0)
        contentConstraint.priority = 750    // DefaultHigh
        self.addConstraint(contentConstraint)
        
        self.setNeedsUpdateConstraints()
    }
    
    override func setNeedsUpdateConstraints() {
        super.updateConstraints()
        
        let metrics = ["vMargin": 10, "hMargin": self.separatorInset.left]
        let views = ["switchLabel" : self.switchLabel, "uiSwitch" : self.uiSwitch]
        
        self.contentView.removeConstraints(self.myConstraints)
        self.myConstraints = [NSLayoutConstraint]()
        
        self.myConstraints.extend(NSLayoutConstraint.constraintsWithVisualFormat("H:[uiSwitch]-hMargin-|", options: .AlignAllCenterY, metrics: metrics, views: views) as! [NSLayoutConstraint])
        
        self.myConstraints.extend(NSLayoutConstraint.constraintsWithVisualFormat("H:|-hMargin-[switchLabel]", options: .AlignAllCenterY, metrics: metrics, views: views) as! [NSLayoutConstraint])
        
        self.myConstraints.append(NSLayoutConstraint(item: self.switchLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        self.myConstraints.append(NSLayoutConstraint(item: self.uiSwitch, attribute: .CenterY, relatedBy: .Equal, toItem: self.contentView, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
        self.myConstraints.append(NSLayoutConstraint(item: self.contentView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: self.switchLabel, attribute: .Height, multiplier: 1.0, constant: 0))
        
        self.myConstraints.append(NSLayoutConstraint(item: self.contentView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: self.uiSwitch, attribute: .Height, multiplier: 1.0, constant: 0))
        
        self.myConstraints.append(NSLayoutConstraint(item: self.contentView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 43.5))
        
        self.contentView.addConstraints(self.myConstraints)
        
    }


}
