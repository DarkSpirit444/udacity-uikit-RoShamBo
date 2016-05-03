//
//  RPSViewController.swift
//  RoShambo
//
//  Created by David Teo on 4/12/16.
//  Copyright © 2016 Compete Co-op Networks. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!    
    @IBOutlet weak var scissorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func makeYourMove(sender: UIButton) {
        
        switch (sender) {
            
                // MARK: Programmatic way
            case self.rockButton:
                let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
                vc.userChoice = getUserShape(sender)
                if let navController = self.navigationController {
                    navController.pushViewController(vc, animated: true)
                } else {
                   presentViewController(vc, animated: true, completion: nil)
                }
            
                // MARK: Segue with code
            case self.paperButton:
                performSegueWithIdentifier("play", sender: sender)
                 break
            
                // MARK: Pure Segue
            case self.scissorsButton:
                 break
            
            default:
                assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    // For Segue with code and Pure Segue
    // Used to pass user choice to destination view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "play" {
            let vc = segue.destinationViewController as! ResultViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    // MARK: Utilities
    
    // The enum "Shape" represents a play or move
    private func getUserShape(sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.titleForState(.Normal)!
        return Shape(rawValue: shape)!
    }
}

