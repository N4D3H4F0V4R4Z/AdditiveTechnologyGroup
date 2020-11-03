//
//  ContactViewController.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit
import MapKit

class ContactViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var contactLabelView: UILabel!
    
    @IBOutlet weak var instButtonView: UIButton!
    @IBOutlet weak var mailButtonView: UIButton!
    @IBOutlet weak var atgButtonView: UIButton!
    @IBOutlet weak var phoneButtonView: UIButton!
    @IBOutlet weak var telegramButtonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 59.9644312, longitude: 30.3306467)
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        
        contactLabelView.text = """
ADDITIVE TECHNOLOGY GROUP

197101, г. Санкт-Петербург, ул. Чапаева, д. 25, литера А, этаж 5, офис 503

web: atg3d.eu
E-mail: ek@atg3d.eu
Phone: +371 2 026 15 72
"""
    }
    
    @IBAction func instButtonAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.instagram.com/atg3d/?hl=ru")! as URL, options: [:], completionHandler: nil)
        
        print("Instagram")
    }
    
    @IBAction func mailButtonAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "mailto:ek@atg3d.eu")! as URL, options: [:], completionHandler: nil)
        
        print("Mail")
    }
    
    @IBAction func atgButtonAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://atg3d.ru")! as URL, options: [:], completionHandler: nil)
        
        print("ATG")
    }
    
    @IBAction func phoneButtonAction(_ sender: Any) {
        if let phoneURL = URL(string: "tel://+37120261572") {
            let alert = UIAlertController(title: ("Call by number " + "+37120261572" + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.openURL(phoneURL)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            UIApplication.shared.open(URL(string: "+37120261572")! as URL, options: [:], completionHandler: nil)
            
            print("Phone")
        }
    }
    
    @IBAction func telegramButtonAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://t.me/kregers")! as URL, options: [:], completionHandler: nil)
        
        print("Telegram")
    }
}
