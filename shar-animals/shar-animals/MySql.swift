//
//  MySQL_Model.swift
//  sqltestbizzle
//
//  Created by Daniel Richardson on 28/08/2016.
//  Copyright © 2016 Daniel Richardson. All rights reserved.
//

import Foundation

class MySql {
    
    /* this is going to be a static site we will be using for the project */
    private let request = NSMutableURLRequest(URL: NSURL(string: "http://www.shar-aiminals.daniel-richardson.net/php/insert_data.php")!)
    
    
    /* handles sending user data to the database */
    func query_sql(latitude:String, longitude:String, comments:String)
    {
        request.HTTPMethod = "POST"
    
        /* correct format for post to php script */
        let postString = "latitude=\(latitude)&longitude=\(longitude)&comments=\(comments)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
        
            if error != nil {
                print("error=\(error)")
                return
            }
        
            print("response = \(response)")
        
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
}