//
//  ProductCell.swift
//  ProductApp
//
//  Created by Alim Gönül on 27.09.2023.
//

import UIKit

protocol CellProtocol {
    func selectedButton(indexPath:IndexPath)
}

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var cellProtocol : CellProtocol?
    var indexPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addButton(_ sender: Any) {
        cellProtocol?.selectedButton(indexPath: indexPath! )
    }
}
