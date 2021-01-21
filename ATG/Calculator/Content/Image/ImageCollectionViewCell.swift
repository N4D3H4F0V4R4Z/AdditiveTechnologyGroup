//
//  MyCollectionViewCell.swift
//  ATG
//
//  Created by Наджафов Араз on 11.01.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myImageView: UIImageView!
    
    static let identifier = "ImageCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
         
    }
    
    func configure(with name: String) {
        self.myImageView.image = UIImage(named: name)
        self.myImageView.contentMode = .scaleAspectFit
    }

}
