//
//  BasicDatePickerCell.swift
//  MyTableViewCells
//
//  Created by Benjamin King on 4/23/15.
//  Copyright (c) 2015 Benjamin King. All rights reserved.
//

import UIKit

class BasicDatePickerCell: UITableViewCell {
    
    var datePicker: UIDatePicker!

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
    
    func cellInit() {
        self.datePicker = UIDatePicker()
        self.datePicker.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.datePicker)
        
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let metrics = ["vMargin": 0, "hMargin": 0]
        let views = ["datePicker" : self.datePicker]
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-hMargin-[datePicker]-hMargin-|", options: .DirectionLeadingToTrailing, metrics: metrics, views: views))
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-vMargin-[datePicker]-vMargin-|", options: .DirectionLeadingToTrailing, metrics: metrics, views: views))
        
    }


}
