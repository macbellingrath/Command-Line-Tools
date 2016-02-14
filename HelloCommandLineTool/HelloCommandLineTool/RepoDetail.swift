//
//  RepoDetail.swift
//  Github Browser
//
//  Created by Mac Bellingrath on 2/8/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import Foundation

class RepoDetail {
    var id: Int
    var name: String
    var fullName: String
    var user: User?
    var repoDescription: String
    var url = ""
    var fork: Bool
    let createdAt: String
    var updatedAt: String
    var watchersCount: Int
    var language: String
    var forksCount: Int
    var openIssuesCount: Int
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        id = dictionary["id"] as? Int ?? 0
        name = dictionary["name"] as? String ?? ""
        fullName = dictionary["full_name"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        if let userDict = dictionary["owner"] as? NSDictionary {
            user = User(fromDictionary: userDict)
            
        }
        repoDescription = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        fork = dictionary["fork"] as? Bool ?? false
        createdAt = dictionary["created_at"] as? String ?? "Unknown Created Date"
        updatedAt = dictionary["updated_at"] as? String ?? "Unknown Update Date"
        watchersCount = dictionary["watchers"] as? Int ?? 0
        language = dictionary["language"] as? String ?? ""
        forksCount = dictionary["forks_count"] as? Int ?? 0
        openIssuesCount = dictionary["open_issues_count"] as? Int ?? 0
        
    }

}