//
//  Activity.swift
//
//	Create by McMillan Bellingrath on 22/1/2016
//	Copyright © 2016. All rights reserved.


import Foundation

public enum EventType: String {
    case WatchEvent, ForkEvent, MemberEvent, Unknown
}

class Activity : NSObject, NSCoding{
    


	var user : User!
	var createdAt : String?
	var id : String!
	var org : User!
	var payload : Payload!
	var publicField : Bool!
	var repo : Repo!
	var type : String!
    var eventType: EventType {
       return EventType(rawValue: type) ?? EventType.Unknown
    }


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let actorData = dictionary["actor"] as? NSDictionary{
			user = User(fromDictionary: actorData)
		}
       
        createdAt = dictionary["created_at"] as? String
    
        
		id = dictionary["id"] as? String
		if let orgData = dictionary["org"] as? NSDictionary{
			org = User(fromDictionary: orgData)
		}
		if let payloadData = dictionary["payload"] as? NSDictionary{
			payload = Payload(fromDictionary: payloadData)
		}
		publicField = dictionary["public"] as? Bool
		if let repoData = dictionary["repo"] as? NSDictionary{
			repo = Repo(fromDictionary: repoData)
		}
		type = dictionary["type"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if user != nil{
			dictionary["actor"] = user.toDictionary()
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if id != nil{
			dictionary["id"] = id
		}
		if org != nil{
			dictionary["org"] = org.toDictionary()
		}
		if payload != nil{
			dictionary["payload"] = payload.toDictionary()
		}
		if publicField != nil{
			dictionary["public"] = publicField
		}
		if repo != nil{
			dictionary["repo"] = repo.toDictionary()
		}
		if type != nil{
			dictionary["type"] = type
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         user = aDecoder.decodeObjectForKey("actor") as? User
         createdAt = aDecoder.decodeObjectForKey("created_at") as? String
         id = aDecoder.decodeObjectForKey("id") as? String
         org = aDecoder.decodeObjectForKey("org") as? User
         payload = aDecoder.decodeObjectForKey("payload") as? Payload
         publicField = aDecoder.decodeObjectForKey("public") as? Bool
         repo = aDecoder.decodeObjectForKey("repo") as? Repo
         type = aDecoder.decodeObjectForKey("type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if user != nil{
			aCoder.encodeObject(user, forKey: "actor")
		}
		if createdAt != nil{
			aCoder.encodeObject(createdAt, forKey: "created_at")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if org != nil{
			aCoder.encodeObject(org, forKey: "org")
		}
		if payload != nil{
			aCoder.encodeObject(payload, forKey: "payload")
		}
		if publicField != nil{
			aCoder.encodeObject(publicField, forKey: "public")
		}
		if repo != nil{
			aCoder.encodeObject(repo, forKey: "repo")
		}
		if type != nil{
			aCoder.encodeObject(type, forKey: "type")
		}

	}

}