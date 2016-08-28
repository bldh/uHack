//
//  ViewController.swift
//  shar-animals
//
//  Created by Brendan Hodkinson on 27/08/2016.
//  Copyright © 2016 Brendan Hodkinson. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var Camera: UIButton!
    @IBOutlet weak var Gallery: UIButton!
    @IBOutlet weak var ImageDisplay: UIImageView!
    
    let mysql = MySql();    // handles the mysql HTTP POST
    /* handles getting user location of where the picture was taken */
    let locManager = CLLocationManager()
    var currentLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.requestWhenInUseAuthorization()
        check_authorization()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImage(sender: AnyObject) {
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "Collection Submission",
                                            message: "Enter name of animal",
                                            preferredStyle: .Alert)
        
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField: UITextField!) in
                textField.placeholder = "Enter name of animal"
        })
        
        let action = UIAlertAction(title: "Submit",
                                   style: UIAlertActionStyle.Default,
                                   handler: {[weak self]
                                    (paramAction:UIAlertAction!) in
                                    if let textFields = alertController?.textFields{
                                        if (NSUserDefaults.standardUserDefaults().boolForKey("shareData")){
                                            let textfields = textFields as [UITextField]
                                            let enteredText = textFields[0].text
                                            self!.send_to_db(enteredText!)
                                        }
                                    }
            })
        
        alertController?.addAction(action)
        self.presentViewController(alertController!,
                                   animated: true,
                                   completion: nil)
    }
    
    func check_authorization() -> Bool {
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Authorized) {
            

            
            return true
        }
        
        let refreshAlert = UIAlertView()
        refreshAlert.title = "Authorization denied"
        refreshAlert.message = "Please check your settings"
        refreshAlert.addButtonWithTitle("OK")
        refreshAlert.show()
        
        return false
    }
    
    func send_to_db(comment: String) {
        if (check_authorization()) {
            var latitude = "\(currentLocation.coordinate.latitude)"
            var longitude = "\(currentLocation.coordinate.longitude)"
            
            mysql.query_sql(latitude, longitude: longitude, comments: comment);
        }
    }
    
    @IBAction func GalleryLibraryAction(sender: UIButton)
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func CameraAction(sender: UIButton)
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        ImageDisplay.image = info[UIImagePickerControllerOriginalImage] as? UIImage; dismissViewControllerAnimated(true, completion: nil)
    }
}

