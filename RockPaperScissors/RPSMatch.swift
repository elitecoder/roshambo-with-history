//
//  SingleMatch.swift
//  RockPaperScissors
//
//  Created by Jason on 11/14/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

// MARK: - RPSMatch

// The RPSMatch struct stores the results of a match.
// Now we're ready to store multiple matches in an array, so users can track their match history.
struct RPSMatch {

    // MARK: Properties
    
    let p1: RPS
    let p2: RPS
	
    // MARK: Initializer
    
    init(p1: RPS, p2: RPS) {
        self.p1 = p1
        self.p2 = p2
    }
    
    // MARK: Computed Properties
    
    var winner: RPS {
        get {
            return p1.defeats(p2) ? p1 : p2
        }
    }
	
	var image: UIImage {
		get {
			switch (p1, p2) {
			case (.Paper, .Paper), (.Rock, .Rock), (.Scissors, .Scissors):
				return UIImage(named: "itsATie")!
			case (.Paper, .Rock), (.Rock, .Paper):
				return UIImage(named: "PaperCoversRock")!
			case (.Paper, .Scissors), (.Scissors, .Paper):
				return UIImage(named: "ScissorsCutPaper")!
			case (.Rock, .Scissors), (.Scissors, .Rock):
				return UIImage(named: "RockCrushesScissors")!
			}
		}
	}
	
    var loser: RPS {
        get {
            return p1.defeats(p2) ? p2 : p1
        }
    }
}
