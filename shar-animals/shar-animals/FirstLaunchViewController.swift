//
//  FirstLaunchViewController.swift
//  shar-animals
//
//  Created by Brendan Hodkinson on 27/08/2016.
//  Copyright © 2016 Brendan Hodkinson. All rights reserved.
//

import UIKit

class FirstLaunchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let hasBeenLaunchedBefore = NSUserDefaults.standardUserDefaults().boolForKey("hasBeenLaunchedBefore")
        //if (hasBeenLaunchedBefore == true){
        //    self.performSegueWithIdentifier("toMainScreen", sender: self)
        //}
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasBeenLaunchedBefore")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func acceptButtonClicked(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "shareData")
        performSegueWithIdentifier("toMainScreen", sender: self)
    }
    
    @IBAction func declineButtonClicked(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "shareData")
        performSegueWithIdentifier("toMainScreen", sender: self)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
