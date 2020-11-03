//
//  PlayerViewController.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit

class PlayerViewController: UIViewController {

    // - UI
    @IBOutlet weak var videoWebView: UIWebView!
    @IBOutlet weak var titleLabelView: UILabel!
    @IBOutlet weak var descriptionLabelView: UILabel!
    
    var selectedVideo: Video!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getVideo(videoKey: selectedVideo.id)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
    }
    
    // - For iOS - 12
    var viewTranslation = CGPoint(x: 0, y: 0)
    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 200 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let vid = self.selectedVideo {
            self.titleLabelView.text = vid.title
            self.descriptionLabelView.text = vid.descript
            
            let videoEmbedString = "<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe frameBorder=\"0\" height=\"280\" width=\"420\" src=\"http://www.youtube.com/embed/" + vid.id + "?showinfo=0&modestbranding=1&frameborder=0&rel=0\"></iframe></body></html>"
            
            self.videoWebView.loadHTMLString(videoEmbedString, baseURL: nil)
            
        }
    }
    
    func getVideo(videoKey: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        videoWebView.loadRequest(URLRequest(url: url!))
    }

}
