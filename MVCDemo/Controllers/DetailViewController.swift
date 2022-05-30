//
//  DetailViewController.swift
//  MVCDemo
//
//  Created by Muazam on 28/01/2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var pagesLabel : UILabel!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var locationLabel : UILabel!

    var model : RoadsideSign?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupVC()
    }
    
    func setupVC(){
        pagesLabel.text = ""
        if let model = model {
            nameLabel.text = model.name
            locationLabel.text = model.location.cityReference
            if model.display.pages.count > 0 {
                var strLines = ""
                for page in model.display.pages {
                    for line in page.lines {
                        strLines = strLines + line + " "
                    }
                }
                self.pagesLabel.text = strLines
            }else{
                AlertControllerHelper.showAlertWithAction(message: "Lines data not found.") { success in
                    if success {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
