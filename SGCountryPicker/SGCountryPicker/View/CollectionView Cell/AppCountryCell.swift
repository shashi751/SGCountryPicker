//
//  AppCountryCell.swift
//  Storygeny
//
//  Created by Shashi Gupta on 21/11/23.
//

import UIKit

class AppCountryCell: UITableViewCell {

    static let reusableIdentifier = "AppCountryCell"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFlag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(country:AppCountryModel){
        self.lblFlag.text = country.flag
        self.lblName.text = country.name
    }
    
}
