//
//  Display.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/22.
//

import Foundation 

class Display : NSObject, NSCoding{

	var pages : [Page]!

	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		pages = [Page]()
		let pagesArray = json["pages"].arrayValue
		for pagesJson in pagesArray{
			let value = Page(fromJson: pagesJson)
			pages.append(value)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if pages != nil{
			var dictionaryElements = [[String:Any]]()
			for pagesElement in pages {
				dictionaryElements.append(pagesElement.toDictionary())
			}
			dictionary["pages"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         pages = aDecoder.decodeObject(forKey: "pages") as? [Page]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if pages != nil{
			aCoder.encode(pages, forKey: "pages")
		}

	}

}
