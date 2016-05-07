//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Stanley Phu on 5/6/16.
//  Copyright © 2016 Stanley Phu. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    
    var team:String = "Los Angeles Lakers" {
        didSet {
            detailLabel.text? = team
        }
    }

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    var player:Player?
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, team: team, rating: 1)
        }
        
        if segue.identifier == "PickGame" {
            if let teamPickerViewController = segue.destinationViewController as? TeamPickerViewController {
                teamPickerViewController.selectedTeam = team
            }
        }
    }
    
    @IBAction func unwindWithSelectedTeam(segue:UIStoryboardSegue) {
        if let teamPickerViewController = segue.sourceViewController as? TeamPickerViewController,
          selectedTeam = teamPickerViewController.selectedTeam {
            team = selectedTeam
        }
    }

}
