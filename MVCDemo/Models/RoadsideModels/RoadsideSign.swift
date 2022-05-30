//
//  RoadsideSign.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/22.
//

import Foundation 

class RoadsideSign : NSObject, NSCoding{

	var agencyId : String!
	var agencyName : String!
	var display : Display!
	var id : String!
	var idForDisplay : String!
	var lastUpdated : Int!
	var location : Location!
	var name : String!
	var properties : Property!
	var status : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		agencyId = json["agencyId"].stringValue
		agencyName = json["agencyName"].stringValue
		let displayJson = json["display"]
		if !displayJson.isEmpty{
			display = Display(fromJson: displayJson)
		}
		id = json["id"].stringValue
		idForDisplay = json["idForDisplay"].stringValue
		lastUpdated = json["lastUpdated"].intValue
		let locationJson = json["location"]
		if !locationJson.isEmpty{
			location = Location(fromJson: locationJson)
		}
		name = json["name"].stringValue
		let propertiesJson = json["properties"]
		if !propertiesJson.isEmpty{
			properties = Property(fromJson: propertiesJson)
		}
		status = json["status"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if agencyId != nil{
			dictionary["agencyId"] = agencyId
		}
		if agencyName != nil{
			dictionary["agencyName"] = agencyName
		}
		if display != nil{
			dictionary["display"] = display.toDictionary()
		}
		if id != nil{
			dictionary["id"] = id
		}
		if idForDisplay != nil{
			dictionary["idForDisplay"] = idForDisplay
		}
		if lastUpdated != nil{
			dictionary["lastUpdated"] = lastUpdated
		}
		if location != nil{
			dictionary["location"] = location.toDictionary()
		}
		if name != nil{
			dictionary["name"] = name
		}
		if properties != nil{
			dictionary["properties"] = properties.toDictionary()
		}
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         agencyId = aDecoder.decodeObject(forKey: "agencyId") as? String
         agencyName = aDecoder.decodeObject(forKey: "agencyName") as? String
         display = aDecoder.decodeObject(forKey: "display") as? Display
         id = aDecoder.decodeObject(forKey: "id") as? String
         idForDisplay = aDecoder.decodeObject(forKey: "idForDisplay") as? String
         lastUpdated = aDecoder.decodeObject(forKey: "lastUpdated") as? Int
         location = aDecoder.decodeObject(forKey: "location") as? Location
         name = aDecoder.decodeObject(forKey: "name") as? String
         properties = aDecoder.decodeObject(forKey: "properties") as? Property
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if agencyId != nil{
			aCoder.encode(agencyId, forKey: "agencyId")
		}
		if agencyName != nil{
			aCoder.encode(agencyName, forKey: "agencyName")
		}
		if display != nil{
			aCoder.encode(display, forKey: "display")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if idForDisplay != nil{
			aCoder.encode(idForDisplay, forKey: "idForDisplay")
		}
		if lastUpdated != nil{
			aCoder.encode(lastUpdated, forKey: "lastUpdated")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if properties != nil{
			aCoder.encode(properties, forKey: "properties")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
