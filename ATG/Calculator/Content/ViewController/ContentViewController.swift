//
//  ContentViewController.swift
//  ATG
//
//  Created by Наджафов Араз on 11.01.2021.
//

import UIKit

class ContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // - UI
    @IBOutlet var table: UITableView!
    
    // - Data
    var items = [ItemModel]()
    var videos:[Video] = [Video]()
    private var videoCovers = [CoverModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "About us"
        
        let model = ContentModel()
        self.videos = model.getVideos()
        
        table.sectionHeaderHeight = 30
        //        for i in 1...27{
        //            items.append(ItemModel(name: "\(i)"))
        //            items.forEach({print($0.name)})
        //
        //        }
        //
        //        let allnames = items.map { $0.name }
        //        print(allnames)
        
        //        $0 - означает, что я беру текущий элемент данного масства
        
        let imagesName = (1...27).map({ String($0) })
        
        items.append(ItemModel(names: imagesName))
        
        items.append(ItemModel(type: .video, names: ["A", "B"]))
        
        items.append(ItemModel(type: .label, names: ["""
            Dear friends, welcome to ATG additive manufacturing laboratory providing 3D printing services using SLS-technology.

            Owning 3 modern laser sintering systems we produce high precision durable polyamide (nylon) parts from 1 piece to batches.

            Please click our «Price Calculator» to find out  the approximate price of 3d printing.
            """]))
        
        
        //        items.forEach({
        //            print($0.name)
        //        })
        //
        //        items.forEach({ value in
        //            print(value.name)
        //        })
        //
        //        items.sort(by: { $0.name > $1.name })
        
        //        ("AB").forEach { items.append(ItemModel(type:.video, name: "\($0)"))}
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.configure(with: items[indexPath.section])
        
        cell.collectionView.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        let view = UIView()
        view.backgroundColor = .lightGray
        view.addSubview(label)
        
        let text: String
        switch section {
        case 0:
            text = "Gallery"
        case 1:
            text = "Videos"
        case 2:
            text = "About us"
        default:
            text = ""
        }
        
        label.text = text
        label.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard ((collectionView.cellForItem(at: indexPath) as? VideoCollectionViewCell) != nil) else { return }
        let playerVC = UIStoryboard(name: "Player", bundle: nil).instantiateInitialViewController() as! PlayerViewController
        playerVC.selectedVideo = videos[indexPath.row]
        present(playerVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 300)
    }
    
}

struct ItemModel {
    
    enum ItemType: CaseIterable {
        case image, video, label
    }
    
    let type: ItemType
    let names: [String]
    
    init(type: ItemType = .image, names: [String]) {
        self.type = type
        self.names = names
    }
    
}
