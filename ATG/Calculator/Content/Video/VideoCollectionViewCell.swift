//
//  VideoCollectionViewCell.swift
//  ATG
//
//  Created by Наджафов Араз on 15.01.2021.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet var myVideoView: UIImageView!
    
    static let identifier = "VideoCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "VideoCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
         
    }
    
    func configure(with name: String) {
        self.myVideoView.image = UIImage(named: name)
    }

}
