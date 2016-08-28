//
//  MenuViewController.swift
//  shar-animals
//
//  Created by Brendan Hodkinson on 28/08/2016.
//  Copyright © 2016 Brendan Hodkinson. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        let hasBeenLaunchedBefore = NSUserDefaults.standardUserDefaults().boolForKey("hasBeenLaunchedBefore")
        
        if (hasBeenLaunchedBefore == false){
            self.performSegueWithIdentifier("toFirstLaunchScreen", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
