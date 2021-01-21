//
//  LabelCollectionViewCell.swift
//  ATG
//
//  Created by Наджафов Араз on 15.01.2021.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myLabelView: UILabel!
    
    static let identifier = "LabelCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "LabelCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
         
    }
    
    func configure(with name: String) {
        myLabelView.text = name
    }
}
