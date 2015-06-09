//
//  MyTableViewController.swift
//  MyTableViewCells
//
//  Created by Benjamin King on 4/22/15.
//  Copyright (c) 2015 Benjamin King. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // These 2 lines are ABSOLUTELY critical for autolayout cell heights!
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension

        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        self.tableView.registerClass(BasicTextFieldCell.self, forCellReuseIdentifier: "MyBasicTextFieldCell")
        self.tableView.registerClass(BasicTextViewCell.self, forCellReuseIdentifier: "MyBasicTextViewCell")
        self.tableView.registerClass(BasicDatePickerCell.self, forCellReuseIdentifier: "MyBasicDatePickerCell")
        self.tableView.registerClass(LabelSwitchCell.self, forCellReuseIdentifier: "LabelSwitchCell")
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 6
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellID :String?
        
        switch(indexPath.row) {
        case 0: cellID = "MyBasicTextFieldCell"
        //case 0: cellID = "LabelSwitchCell"
        case 1: cellID = "MyBasicTextViewCell"
        //case 2: cellID = "MyBasicDatePickerCell"
        case 3: cellID = "LabelSwitchCell"
        default: ()
        }
        if(cellID != nil) {
            return self.tableView.dequeueReusableCellWithIdentifier(cellID!, forIndexPath: indexPath) as! UITableViewCell
        }
        else {
            var cell = self.tableView.dequeueReusableCellWithIdentifier("BasicCell") as! UITableViewCell?
            cell = UITableViewCell(style: .Value1, reuseIdentifier: "BasicCell")
            return cell!
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row > 3) {
            cell.textLabel!.text = "Basic Table Cell"
            cell.detailTextLabel!.text = "DetailedLabel"
        }
        else if(cell is LabelSwitchCell) {
            (cell as! LabelSwitchCell).switchLabel!.text = "Switch Cell"
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
