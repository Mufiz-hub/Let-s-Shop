//
//  ProductsTVCell.swift
//  Categories-Interview-Task
//
//  Created by Rahul Sharma on 09/09/24.
//

import UIKit

class ProductsTVCell: UITableViewCell {
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(data : Productss)
    {
        self.productName.text = data.title ?? ""
        self.productDesc.text = data.description ?? ""
        self.productRating.text = "\(data.rating ?? 00)"
        self.productPrice.text = "$ \(data.price ?? 00)"

        Helper.getImgFromUrl(imgView: self.productImg, url: data.thumbnail ?? "")
    }
    
}
