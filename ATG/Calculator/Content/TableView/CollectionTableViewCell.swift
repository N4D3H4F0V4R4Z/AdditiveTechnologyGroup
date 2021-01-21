//
//  CollectionTableViewCell.swift
//  ATG
//
//  Created by Наджафов Араз on 11.01.2021.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "CollectionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell",
                     bundle: nil)
    }
    

    
    func configure(with models: ItemModel) {
        self.itemsModel = models
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var itemsModel = ItemModel(names: [])
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.register(VideoCollectionViewCell.nib(), forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        collectionView.register(LabelCollectionViewCell.nib(), forCellWithReuseIdentifier: LabelCollectionViewCell.identifier)
        
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsModel.names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let name = itemsModel.names[indexPath.item]
        
        switch itemsModel.type {
        case .image:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
            cell.configure(with: name)
            return cell
        case .video:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as! VideoCollectionViewCell
            cell.configure(with: name)
            return cell
        case .label:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.identifier, for: indexPath) as! LabelCollectionViewCell
            cell.configure(with: name)
            return cell
        }
        
    }
}
