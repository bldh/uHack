//
//  ViewController.swift
//  sqltestbizzle
//
//  Created by Daniel Richardson on 27/08/2016.
//  Copyright © 2016 Daniel Richardson. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var comments: UITextField!
    
    let mysql = MySql();    // handles the mysql HTTP POST
    /* handles getting user location of where the picture was taken */
    let locManager = CLLocationManager()
    var currentLocation = CLLocation()

    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.requestWhenInUseAuthorization()
        check_authorization()
    }
    
    /* A convienante way to check that the user has given authorization to
     * use location services and inform them if they haven't authorized it but
     * want to use the services */
    func check_authorization() -> Bool {
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Authorized) {
            
            let refreshAlert = UIAlertView()
            refreshAlert.title = "Authorization denied"
            refreshAlert.message = "Please check your settings"
            refreshAlert.addButtonWithTitle("OK")
            refreshAlert.show()
            
            return false
        }
        
        return true
    }
    
    /* Sends the location data back to the model to add to the database */
    @IBAction func send_to_db(sender: UIButton) {
        if (check_authorization()) {
            var latitude = "\(currentLocation.coordinate.latitude)"
            var longitude = "\(currentLocation.coordinate.longitude)"
            
            mysql.query_sql(latitude, longitude: longitude, comments: comments.text!);
        }
    }
}

