//
//  Property.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/22.
//
import Foundation 

class Property : NSObject, NSCoding{

	var maxCharactersPerLine : Int!
	var maxLinesPerPage : Int!
	var maxSignPhases : Int!
	var phaseBlankTime : Int!
	var phaseDwellTime : Int!
	var sizeKnown : Bool!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		maxCharactersPerLine = json["maxCharactersPerLine"].intValue
		maxLinesPerPage = json["maxLinesPerPage"].intValue
		maxSignPhases = json["maxSignPhases"].intValue
		phaseBlankTime = json["phaseBlankTime"].intValue
		phaseDwellTime = json["phaseDwellTime"].intValue
		sizeKnown = json["sizeKnown"].boolValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if maxCharactersPerLine != nil{
			dictionary["maxCharactersPerLine"] = maxCharactersPerLine
		}
		if maxLinesPerPage != nil{
			dictionary["maxLinesPerPage"] = maxLinesPerPage
		}
		if maxSignPhases != nil{
			dictionary["maxSignPhases"] = maxSignPhases
		}
		if phaseBlankTime != nil{
			dictionary["phaseBlankTime"] = phaseBlankTime
		}
		if phaseDwellTime != nil{
			dictionary["phaseDwellTime"] = phaseDwellTime
		}
		if sizeKnown != nil{
			dictionary["sizeKnown"] = sizeKnown
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         maxCharactersPerLine = aDecoder.decodeObject(forKey: "maxCharactersPerLine") as? Int
         maxLinesPerPage = aDecoder.decodeObject(forKey: "maxLinesPerPage") as? Int
         maxSignPhases = aDecoder.decodeObject(forKey: "maxSignPhases") as? Int
         phaseBlankTime = aDecoder.decodeObject(forKey: "phaseBlankTime") as? Int
         phaseDwellTime = aDecoder.decodeObject(forKey: "phaseDwellTime") as? Int
         sizeKnown = aDecoder.decodeObject(forKey: "sizeKnown") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if maxCharactersPerLine != nil{
			aCoder.encode(maxCharactersPerLine, forKey: "maxCharactersPerLine")
		}
		if maxLinesPerPage != nil{
			aCoder.encode(maxLinesPerPage, forKey: "maxLinesPerPage")
		}
		if maxSignPhases != nil{
			aCoder.encode(maxSignPhases, forKey: "maxSignPhases")
		}
		if phaseBlankTime != nil{
			aCoder.encode(phaseBlankTime, forKey: "phaseBlankTime")
		}
		if phaseDwellTime != nil{
			aCoder.encode(phaseDwellTime, forKey: "phaseDwellTime")
		}
		if sizeKnown != nil{
			aCoder.encode(sizeKnown, forKey: "sizeKnown")
		}

	}

}
