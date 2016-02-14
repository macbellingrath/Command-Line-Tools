//
//	Payload.swift
//
//	Create by McMillan Bellingrath on 22/1/2016
//	Copyright © 2016. All rights reserved.


import Foundation


class Payload : NSObject, NSCoding{

	var action : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		action = dictionary["action"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if action != nil{
			dictionary["action"] = action
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         action = aDecoder.decodeObjectForKey("action") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if action != nil{
			aCoder.encodeObject(action, forKey: "action")
		}

	}

}