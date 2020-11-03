//
//  ContentModel.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit

class ContentModel: NSObject {
    
    func getVideos() -> [Video] {
        
        var videos = [Video]()
        
        let video1 = Video()
        video1.id = "2K13Rl0DJJE"
        video1.title = "Vibro Polishing after 3D printing SLS polyamide EOS PA2200"
        video1.descript = """
        Vibro Polishing after 3D printing SLS polyamide EOS PA2200
        """
        videos.append(video1)
        
        let video2 = Video()
        video2.id = "DEkSjXrrPVA"
        video2.title = "ATG3D: Rapid prototyping center in Europe."
        video2.descript = """
        Selective Laser Sintering, Vibro Polishing, EOS Formiga P100, 3D Systems ProX 500, 3D printing, Polyamide P2200
        """
        videos.append(video2)
        
        return videos
        
    }

}
