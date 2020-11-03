//
//  VideoViewController.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit

class VideoViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var tableView: UITableView!
    
    // - Cover
    private var videoCovers = [CoverModel]()
    let covers =  ["A", "B"]
    
    // - Data
    var videos:[Video] = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        let model = ContentModel()
        self.videos = model.getVideos()
    }
    
}

// MARK: -
// MARK: - UITableViewDataSource

extension VideoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = UIImage(named: covers[indexPath.row])
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        cell.previewImageView.image = image
        
        return cell
    }
}

// MARK: -
// MARK: - UITableViewDelegate

extension VideoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerVC = UIStoryboard(name: "Player", bundle: nil).instantiateInitialViewController() as! PlayerViewController
        playerVC.selectedVideo = videos[indexPath.row]
        present(playerVC, animated: true, completion: nil)
    }
  
}

// MARK: -
// MARK: - Configure

private extension VideoViewController {
    
    func configure() {
        configureView()
        configureNavigationBar()
        configureTableView()
        configureVideos()
    }

    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureNavigationBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "Liepota-Logo")
        imageView.image = image
        
        navigationItem.titleView = imageView
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureVideos() {
        for index in 0..<covers.count {
            let cover = CoverModel(cover: covers[index])
            videoCovers.append(cover)
        }
        
    }

}
