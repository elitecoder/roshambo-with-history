//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Mukul Sharma on 10/14/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

	var history = [RPSMatch]()
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return history.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell")!

		// Set the name and image
		let text: String
		if (history[indexPath.row].p1.defeats(history[indexPath.row].p2)) {
			text = "You won!"
		}
		else if (history[indexPath.row].p2.defeats(history[indexPath.row].p1)){
			text = "You lost!"
		}
		else {
			text = "It was a tie!"
		}
		
		cell.textLabel?.text = text
		cell.imageView?.image = history[indexPath.row].image

		// If the cell has a detail label, we will put the evil scheme in.
		if let detailTextLabel = cell.detailTextLabel {
			detailTextLabel.text = "Move: \(history[indexPath.row].p1) vs \(history[indexPath.row].p2)"
		}
		
		return cell
	}
	
	func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		return true
	}

	@IBAction func okayButtonPressed(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}
}
