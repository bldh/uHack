//
//  CollectionViewController.swift
//  shar-animals
//
//  Created by Brendan Hodkinson on 28/08/2016.
//  Copyright © 2016 Brendan Hodkinson. All rights reserved.
//

import UIKit

var ImageForTransition: UIImage = UIImage.init();

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var Crocodile: UIImageView!
    @IBOutlet weak var Echidna: UIImageView!
    @IBOutlet weak var Wallaby: UIImageView!
    @IBOutlet weak var TasDevil: UIImageView!
    @IBOutlet weak var Koala: UIImageView!
    @IBOutlet weak var Kangaroo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Crocodile.userInteractionEnabled = true
        
        self.Echidna.userInteractionEnabled = true
        
        self.Wallaby.userInteractionEnabled = true
        
        self.TasDevil.userInteractionEnabled = true
        
        self.Koala.userInteractionEnabled = true
        
        self.Kangaroo.userInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view == Crocodile {
            NSLog("Crocodile has been tapped by the user.")
            ImageForTransition = Crocodile.image!;
            performSegueWithIdentifier("toPhotoView", sender: self)
        }
        else if touch?.view == Echidna {
            NSLog("Echidna has been tapped by the user.")
            ImageForTransition = Echidna.image!;
            performSegueWithIdentifier("toPhotoView", sender: self)
        }
        else if touch?.view == Wallaby {
            NSLog("Wallaby has been tapped by the user.")
            ImageForTransition = Wallaby.image!;
            performSegueWithIdentifier("toPhotoView", sender: self)
        }
        else if touch?.view == TasDevil {
            NSLog("Tasmanian Devil has been tapped by the user.")
            ImageForTransition = TasDevil.image!;
            performSegueWithIdentifier("toPhotoView", sender: self)
        }
        else if touch?.view == Koala {
            NSLog("Koala has been tapped by the user.")
            ImageForTransition = Koala.image!;
            performSegueWithIdentifier("toPhotoView", sender: self)
        }
        else if touch?.view == Kangaroo {
            NSLog("Kangaroo has been tapped by the user.")
            ImageForTransition = Kangaroo.image!;
            performSegueWithIdentifier("toPhotoView", sender: self)
        }
        super.touchesEnded(touches, withEvent: event)
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
