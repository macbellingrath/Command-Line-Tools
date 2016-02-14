//
//	Actor.swift
//
//	Create by McMillan Bellingrath on 22/1/2016
//	Copyright © 2016. All rights reserved.

import Foundation


class User : NSObject, NSCoding{

	var avatarUrl : String!
	var gravatarId : String!
	var id : Int!
	var username : String!
	var url : String!

     init(un: String) {
        self.username = un
    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		avatarUrl = dictionary["avatar_url"] as? String
		gravatarId = dictionary["gravatar_id"] as? String
		id = dictionary["id"] as? Int
		username = dictionary["login"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if avatarUrl != nil{
			dictionary["avatar_url"] = avatarUrl
		}
		if gravatarId != nil{
			dictionary["gravatar_id"] = gravatarId
		}
		if id != nil{
			dictionary["id"] = id
		}
		if username != nil{
			dictionary["login"] = username
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         avatarUrl = aDecoder.decodeObjectForKey("avatar_url") as? String
         gravatarId = aDecoder.decodeObjectForKey("gravatar_id") as? String
         id = aDecoder.decodeObjectForKey("id") as? Int
         username = aDecoder.decodeObjectForKey("login") as? String
         url = aDecoder.decodeObjectForKey("url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if avatarUrl != nil{
			aCoder.encodeObject(avatarUrl, forKey: "avatar_url")
		}
		if gravatarId != nil{
			aCoder.encodeObject(gravatarId, forKey: "gravatar_id")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if username != nil{
			aCoder.encodeObject(username, forKey: "login")
		}
		if url != nil{
			aCoder.encodeObject(url, forKey: "url")
		}

	}

}