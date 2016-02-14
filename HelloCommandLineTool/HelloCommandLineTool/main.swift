//
//  main.swift
//  HelloCommandLineTool
//
//  Created by Mac Bellingrath on 2/14/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation

enum NetworkError: ErrorType {
    case NoData, ParsingError, UnknownError
}

func getActivity(completion: (String) -> ()) {
    
if let username = readLine(stripNewline: true) {
    print("Fetching Feed for, \(username)")
    
    guard let url = NSURL(string: "https://api.github.com/users/\(username)/received_events") else { return }
    
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    
    let session = NSURLSession(configuration: config)
    
    let request = NSURLRequest(URL: url)
   
    let response = session.dataTaskWithRequest(request, completionHandler: { (data, response, error)  in
    
    
        do {
           
            if let error = error { throw error }
            guard let data = data else { throw NetworkError.NoData }
            guard let jsonArray = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [ NSDictionary ] else { throw NetworkError.ParsingError }
            let activities = jsonArray.flatMap({ (activityDict) -> String in
                let activity = Activity(fromDictionary: activityDict)
                return "* [ \(activity.user.username) ] =>  \(activity.eventType.rawValue)  => \(activity.repo.name)"
            }).joinWithSeparator("\n ")
            completion(activities)
            
        
        } catch {
            print(error)
        }
    })
    response.resume()
    
    }
    
}

class MainProcess {
    var shouldExit = false
    
    func start () {
        print("What is your Github Username?")
        
        getActivity { (s) -> () in
            print(s)
            self.shouldExit = true
        }

    }
}



var runLoop : NSRunLoop
var process : MainProcess

autoreleasepool {
    runLoop = NSRunLoop.currentRunLoop()
    process = MainProcess()
    
    process.start()
    
    while (!process.shouldExit && (runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 2)))) {
        // do nothing
    }
}








