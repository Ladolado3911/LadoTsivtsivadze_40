//
//  TableCell.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5))
//        contentView.layer.cornerRadius = 20
//        contentView.layer.backgroundColor = UIColor.black.cgColor
    }
}
