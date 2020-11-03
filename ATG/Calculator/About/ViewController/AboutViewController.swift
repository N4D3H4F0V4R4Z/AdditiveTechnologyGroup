//
//  AboutViewController.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit

class AboutViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var aboutLabelView: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // - Image
    private var aboutImages = [AboutModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
        aboutLabelView.text = """
            Dear friends, welcome to ATG additive manufacturing laboratory providing 3D printing services using SLS-technology.
            Owning 3 modern laser sintering systems we produce high precision durable polyamide (nylon) parts from 1 piece to batches.
            Please click our «Price Calculator» to find out  the approximate price of 3d printing.
            """
    }

}

// MARK: -
// MARK: - CollectionView data source

extension AboutViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aboutImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pic = aboutImages[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AboutCollectionViewCell", for: indexPath) as! AboutCollectionViewCell
        cell.imageView.image = UIImage(named: pic.image)
        
        return cell
    }
    
}

// MARK: -
// MARK: - CollectionView delegate

extension AboutViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
}

// MARK: -
// MARK: - Scroll view delegate

extension AboutViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.frame.width
        pageControl.currentPage = Int(page)
    }
    
}

// MARK: -
// MARK: - Configure

private extension AboutViewController {
    
    func configure() {
        configureView()
        configureNavigationBar()
        configureCollectionView()
        configureImages()
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureNavigationBar() {
        navigationItem.title = "About us"
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureImages() {
        let images =  ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"]
        
        for index in 0..<images.count {
            let img = AboutModel(image: images[index])
            aboutImages.append(img)
        }
        
    }
    
}
