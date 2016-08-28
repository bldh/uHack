//
//  PhotoViewController.swift
//  shar-animals
//
//  Created by Brendan Hodkinson on 27/08/2016.
//  Copyright © 2016 Brendan Hodkinson. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalLocation: UILabel!
    @IBOutlet weak var animalDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalImage.image = ImageForTransition;
        
        animalName.text = AnimalNameForTransition;
        animalDate.text = AnimalTimeForTransition;
        animalLocation.text = AnimalLocationForTransition;
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
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
