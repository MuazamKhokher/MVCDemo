//
//  RoadsideModel.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/22.
//

import Foundation
// MARK: - Welcome
class RoadsideModel: NSObject, NSCoding {
    
    var status: String
    var data: [RoadsideSign]
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(data: [RoadsideSign] , status : String){
        self.status = status
        self.data = data
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        dictionary["status"] = status
        dictionary["data"] = data
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        status = aDecoder.decodeObject(forKey: "status") as? String ?? ""
        data = aDecoder.decodeObject(forKey: "data") as? [RoadsideSign] ?? [RoadsideSign]()

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(status, forKey: "status")
        aCoder.encode(data, forKey: "data")
    }
    
}
