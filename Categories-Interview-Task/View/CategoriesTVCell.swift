//
//  CategoriesTVCell.swift
//  Categories-Interview-Task
//
//  Created by Rahul Sharma on 03/09/24.
//

import UIKit

class CategoriesTVCell: UITableViewCell {

    @IBOutlet weak var categoriesNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(data : MainModel)
    {
        self.categoriesNameLabel.text = data.name ?? ""
    }
    
}
