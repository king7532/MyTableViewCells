//
//  BasicTextViewCell.swift
//  MyTableViewCells
//
//  Created by Benjamin King on 4/23/15.
//  Copyright (c) 2015 Benjamin King. All rights reserved.
//

import UIKit

class BasicTextViewCell: UITableViewCell {
    
    var textView: UITextView!
    var textViewHeightConstraint: NSLayoutConstraint!
    var tableView :UITableView {
        return self.superview?.superview as! UITableView
    }
    
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
    
    func cellInit() {
        self.textView = UITextView()
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.textView.keyboardDismissMode = .Interactive
        
        // Does NOTHING
        //self.textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //self.textView.contentInset = UIEdgeInsetsMake(-5.0, -4.0, -5.0, 0.0);
        
        self.textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.textView.textContainer.lineFragmentPadding = 0;
        self.textView.textAlignment = .Natural
        self.textView.font = UIFont.systemFontOfSize(17.0)
        self.textView.backgroundColor = UIColor.yellowColor()
        
        self.contentView.addSubview(self.textView)
        
        let heightConstraint = NSLayoutConstraint(item: self.contentView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: self.textView, attribute: .Height, multiplier: 1.0, constant: 44)
        heightConstraint.priority = 800
        self.contentView.addConstraint(heightConstraint)
        
        self.textViewHeightConstraint = NSLayoutConstraint(item: self.textView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 21)
        self.textViewHeightConstraint.priority = 800;
        self.textView.addConstraint(self.textViewHeightConstraint)
        
        let metrics = ["vMargin": 10, "hMargin": self.separatorInset.left]
        let views = ["textView" : self.textView]
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-hMargin-[textView]-hMargin-|", options: .DirectionLeadingToTrailing, metrics: metrics, views: views))
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-vMargin-[textView]-vMargin-|", options: .DirectionLeadingToTrailing, metrics: metrics, views: views))
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.textView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(rawValue: 3), context: nil)
        })
    
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [NSObject : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if let _ = object as? UITextView {
            //var oldConentSize = change[NSKeyValueChangeOldKey]!.CGSizeValue()
            let newContentSize = change![NSKeyValueChangeNewKey]!.CGSizeValue()
            
            //UIView.setAnimationsEnabled(false)
            
            self.tableView.beginUpdates()
            self.textViewHeightConstraint.constant = newContentSize.height
            
            self.setNeedsUpdateConstraints()
            self.layoutIfNeeded()
            
            //let contentOffsetToShowLastLine = CGPointMake(0, newContentSize.height - CGRectGetHeight(self.textView.bounds))
            //self.textView.contentOffset = contentOffsetToShowLastLine
            
            self.tableView.endUpdates()
            
            //UIView.setAnimationsEnabled(true)
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return self.textView.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        let ret = super.resignFirstResponder()
        return self.textView.resignFirstResponder() || ret;
    }
}
