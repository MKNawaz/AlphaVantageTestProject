//
//  TabBarSearchViewControllerTableViewCell.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class TabBarSearchViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var symbolLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    
    
    var symbolData : SymbolDataClass?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favAction(_ sender: UIButton)
    {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected
        {
            symbolData?.isFavourite = true
            AppDataStore.shared().local.addBookmarkForCurrentUser(Symbol: symbolData!)
        }
        else
        {
            symbolData?.isFavourite = false
            AppDataStore.shared().local.removeFavouriteForCurrentUser(Symbol: symbolData!)
        }
        
    }
    
}
