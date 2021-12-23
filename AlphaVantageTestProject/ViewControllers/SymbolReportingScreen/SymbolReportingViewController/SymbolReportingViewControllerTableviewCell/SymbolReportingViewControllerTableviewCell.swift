//
//  SymbolReportingViewControllerTableviewCell.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class SymbolReportingViewControllerTableviewCell: UITableViewCell {

    @IBOutlet weak var hightLb: UILabel!
    @IBOutlet weak var timeLb: UILabel!
    @IBOutlet weak var lowLb: UILabel!
    @IBOutlet weak var openLb: UILabel!
    @IBOutlet weak var volumeLb: UILabel!
    @IBOutlet weak var closeLb: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
