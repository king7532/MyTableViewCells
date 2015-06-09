//
//  BasicTextViewCell.swift
//  MyTableViewCells
//
//  Created by Benjamin King on 4/23/15.
//  Copyright (c) 2015 Benjamin King. All rights reserved.
//

import UIKit

class BasicTextViewCell: UITableViewCell, UITextViewDelegate {
    
    var textView: UITextView!
    var textViewHeightConstraint: NSLayoutConstraint!
    
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
        self.textView = UITextView()
        self.textView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.textView.keyboardDismissMode = .Interactive
        
        // Does NOTHING
        //self.textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //self.textView.contentInset = UIEdgeInsetsMake(-5.0, -4.0, -5.0, 0.0);
        
        self.textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.textView.textContainer.lineFragmentPadding = 0;
        self.textView.textAlignment = .Natural
        self.textView.font = UIFont.systemFontOfSize(17.0)
        self.textView.backgroundColor = UIColor.yellowColor()
        
        //self.textView.layoutManager.allowsNonContiguousLayout = false;
        
        self.contentView.addSubview(self.textView)
        
        self.textView.delegate = self
        
//        let heightConstraint = NSLayoutConstraint(item: self.contentView, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 44)
//        heightConstraint.priority = 800
        //self.contentView.addConstraint(heightConstraint)
        
        self.textViewHeightConstraint = NSLayoutConstraint(item: self.textView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 21)
        self.textViewHeightConstraint.priority = 800;
        self.textView.addConstraint(self.textViewHeightConstraint)
        
        self.setNeedsUpdateConstraints()
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.textView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions(3), context: nil)
        })
    
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let metrics = ["vMargin": 10, "hMargin": self.separatorInset.left]
        let views = ["textView" : self.textView]
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-hMargin-[textView]-hMargin-|", options: .DirectionLeadingToTrailing, metrics: metrics, views: views))
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-vMargin-[textView]-vMargin-|", options: .DirectionLeadingToTrailing, metrics: metrics, views: views))
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if let textView = object as? UITextView {
            var oldConentSize = change[NSKeyValueChangeOldKey]!.CGSizeValue()
            let newContentSize = change[NSKeyValueChangeNewKey]!.CGSizeValue()
            
            //oldConentSize.height = min(oldConentSize.height, 0)
            
            //let dy = newContentSize.height - oldConentSize.height
            
            
            let tableView = (self.superview?.superview as! UITableView);
            
            //UIView.setAnimationsEnabled(false)
            
            tableView.beginUpdates()
            self.textViewHeightConstraint.constant = newContentSize.height
            
            self.setNeedsUpdateConstraints()
            self.layoutIfNeeded()
            
            //let contentOffsetToShowLastLine = CGPointMake(0, newContentSize.height - CGRectGetHeight(self.textView.bounds))
            //self.textView.contentOffset = contentOffsetToShowLastLine
            
            tableView.endUpdates()
            
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
