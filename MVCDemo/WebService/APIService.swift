//
//  APIService.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/22.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://idtg.carsprogram.org/signs_v1/api/signs")!
    
    func apiToGetData(completion : @escaping (RoadsideModel) -> ()){
        
        if !NetworkConnection.isConnectedToNetwork() {
            AlertControllerHelper.showAlertWithAction(message: "Your internet connection seemd to be offline") { (success) in
                //Handle offline internet
            }
            return
        }
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                do {
                    let jsonData = try JSON(data: data)
                    var roadsideSignModels = [RoadsideSign]()
                    for json in jsonData {
                        let model = RoadsideSign(fromJson: json.1)
                        roadsideSignModels.append(model)
                    }
                    //
                    roadsideSignModels = roadsideSignModels.sorted { model1, model2 in
                        var succuss : Bool = false
                        
                        if model1.lastUpdated < model2.lastUpdated && model1.name < model2.name {
                            succuss = true
                        }
                        return succuss
                    }
                    let model = RoadsideModel(data: roadsideSignModels, status: "true")
                    completion(model)
                }catch {
                    let msg = error.localizedDescription
                    AlertControllerHelper.showAlert(message: msg)
                }
                
            }else {
                AlertControllerHelper.showAlert(message: "Data not available")
            }
            
        }.resume()
    }
    
}
