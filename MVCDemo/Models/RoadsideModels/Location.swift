//
//  Location.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/22.
//

import Foundation 

class Location : NSObject, NSCoding{

	var cityReference : String!
	var fips : Int!
	var latitude : Float!
	var linearReference : Float!
	var locationDescription : String!
	var longitude : Float!
	var perpendicularRadiansForDirectionOfTravel : Float!
	var routeId : String!
	var signFacingDirection : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		cityReference = json["cityReference"].stringValue
		fips = json["fips"].intValue
		latitude = json["latitude"].floatValue
		linearReference = json["linearReference"].floatValue
		locationDescription = json["locationDescription"].stringValue
		longitude = json["longitude"].floatValue
		perpendicularRadiansForDirectionOfTravel = json["perpendicularRadiansForDirectionOfTravel"].floatValue
		routeId = json["routeId"].stringValue
		signFacingDirection = json["signFacingDirection"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if cityReference != nil{
			dictionary["cityReference"] = cityReference
		}
		if fips != nil{
			dictionary["fips"] = fips
		}
		if latitude != nil{
			dictionary["latitude"] = latitude
		}
		if linearReference != nil{
			dictionary["linearReference"] = linearReference
		}
		if locationDescription != nil{
			dictionary["locationDescription"] = locationDescription
		}
		if longitude != nil{
			dictionary["longitude"] = longitude
		}
		if perpendicularRadiansForDirectionOfTravel != nil{
			dictionary["perpendicularRadiansForDirectionOfTravel"] = perpendicularRadiansForDirectionOfTravel
		}
		if routeId != nil{
			dictionary["routeId"] = routeId
		}
		if signFacingDirection != nil{
			dictionary["signFacingDirection"] = signFacingDirection
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cityReference = aDecoder.decodeObject(forKey: "cityReference") as? String
         fips = aDecoder.decodeObject(forKey: "fips") as? Int
         latitude = aDecoder.decodeObject(forKey: "latitude") as? Float
         linearReference = aDecoder.decodeObject(forKey: "linearReference") as? Float
         locationDescription = aDecoder.decodeObject(forKey: "locationDescription") as? String
         longitude = aDecoder.decodeObject(forKey: "longitude") as? Float
         perpendicularRadiansForDirectionOfTravel = aDecoder.decodeObject(forKey: "perpendicularRadiansForDirectionOfTravel") as? Float
         routeId = aDecoder.decodeObject(forKey: "routeId") as? String
         signFacingDirection = aDecoder.decodeObject(forKey: "signFacingDirection") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if cityReference != nil{
			aCoder.encode(cityReference, forKey: "cityReference")
		}
		if fips != nil{
			aCoder.encode(fips, forKey: "fips")
		}
		if latitude != nil{
			aCoder.encode(latitude, forKey: "latitude")
		}
		if linearReference != nil{
			aCoder.encode(linearReference, forKey: "linearReference")
		}
		if locationDescription != nil{
			aCoder.encode(locationDescription, forKey: "locationDescription")
		}
		if longitude != nil{
			aCoder.encode(longitude, forKey: "longitude")
		}
		if perpendicularRadiansForDirectionOfTravel != nil{
			aCoder.encode(perpendicularRadiansForDirectionOfTravel, forKey: "perpendicularRadiansForDirectionOfTravel")
		}
		if routeId != nil{
			aCoder.encode(routeId, forKey: "routeId")
		}
		if signFacingDirection != nil{
			aCoder.encode(signFacingDirection, forKey: "signFacingDirection")
		}

	}

}
