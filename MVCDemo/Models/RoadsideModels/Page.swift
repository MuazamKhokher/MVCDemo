//
//  Page.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/2022.
//

import Foundation


class Page : NSObject, NSCoding{

    var justification : String!
    var lines : [String]!


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        justification = json["justification"].stringValue
        lines = [String]()
        let linesArray = json["lines"].arrayValue
        for linesJson in linesArray{
            lines.append(linesJson.stringValue)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if justification != nil{
            dictionary["justification"] = justification
        }
        if lines != nil{
            dictionary["lines"] = lines
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         justification = aDecoder.decodeObject(forKey: "justification") as? String
         lines = aDecoder.decodeObject(forKey: "lines") as? [String]

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if justification != nil{
            aCoder.encode(justification, forKey: "justification")
        }
        if lines != nil{
            aCoder.encode(lines, forKey: "lines")
        }

    }

}
