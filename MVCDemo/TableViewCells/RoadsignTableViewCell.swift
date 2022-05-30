//
//  EmployeeTableViewCell.swift
//  MCV_Demo
//
//  Created by Muazam on 27/01/22.
//
import UIKit

class RoadsignTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(model : RoadsideSign){
        nameLabel.text = model.name
    }

}
