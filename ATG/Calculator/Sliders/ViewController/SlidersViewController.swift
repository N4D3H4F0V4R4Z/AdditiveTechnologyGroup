//
//  SlidersViewController.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit

class SlidersViewController: UIViewController {
    
    // - Navigation
    @IBOutlet weak var russianVCButtonView: UIBarButtonItem!
    
    // - Reset
    @IBOutlet weak var resetButtonView: UIButton!
    
    // - Part Dimensions(mm)
    @IBOutlet weak var partDimensionsAlert: UIButton!
    
    @IBOutlet weak var xSlider: UISlider!
    @IBOutlet weak var ySlider: UISlider!
    @IBOutlet weak var zSlider: UISlider!
    
    @IBOutlet weak var xLabelView: UILabel!
    @IBOutlet weak var yLabelView: UILabel!
    @IBOutlet weak var zLabelView: UILabel!
    
    // - Volume
    @IBOutlet weak var volumeAlert: UIButton!
    
    @IBOutlet weak var volumeFieldView: UITextField!
    
    @IBOutlet weak var goVolumeButtonView: UIButton!
    
    // - Material Options
    @IBOutlet weak var materialOptionsAlert: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var activityTypeButtons: [UIButton]!
    
    @IBOutlet weak var whiteNylonButton: UIButton!
    @IBOutlet weak var whiteNylonPolishedButton: UIButton!
    @IBOutlet weak var carbonBlackNylonButton: UIButton!
    @IBOutlet weak var carbonBlackNylonPolishedButton: UIButton!
    
    // - Quantity Required
    @IBOutlet weak var quantityRequiredAlert: UIButton!
    
    @IBOutlet weak var quantityRequiredSlider: UISlider!
    
    @IBOutlet weak var quantityRequiredLabel: UILabel!
    
    // - Economy
    @IBOutlet weak var economyAlert: UIButton!
    
    @IBOutlet weak var economyUnitCostLabel: UILabel!
    
    @IBOutlet weak var economyTotalCostLabel: UILabel!
    
    // - Express
    @IBOutlet weak var expressAlert: UIButton!
    
    @IBOutlet weak var expressUnitCostLabel: UILabel!
    
    @IBOutlet weak var expressTotalCostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        xSlider.value = 50
        ySlider.value = 50
        zSlider.value = 50
        
        activityTypeButtons.first?.isSelected = true
        
        imageView.image = UIImage(named: "White Nylon")
    }
    
    @IBAction func russianVCButtonAction(_ sender: Any) {
        let russianVC = UIStoryboard(name: "RusSliders", bundle: nil).instantiateInitialViewController() as! RusSlidersViewController
        navigationController?.pushViewController(russianVC, animated: true)
        
        print("russianVCButtonAction")
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        xSlider.value = 50
        ySlider.value = 50
        zSlider.value = 50
        
        xLabelView.text = "50"
        yLabelView.text = "50"
        zLabelView.text = "50"
        
        volumeFieldView.text = ""
        goVolumeButtonView.isEnabled = true
        
        activityTypeButtons.forEach { $0.isSelected = false
        }
        activityTypeButtons.first?.isSelected = true
        
        imageView.image = UIImage(named: "White Nylon")
        
        quantityRequiredSlider.value = 1
        quantityRequiredLabel.text = "1"
        
        economyUnitCostLabel.text = "Unit cost: €50.00"
        economyTotalCostLabel.text = "Total cost: €50.00"
        
        expressUnitCostLabel.text = "Unit cost: €50.00"
        expressTotalCostLabel.text = "Total cost: €50.00"
        
        print("resetButtonAction")
    }
    
    // - Part Dimensions(mm)
    @IBAction func partDimensionsActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Part Dimensions(mm)", message: """
Choose maximum width, depth and height of your part.
The build size is 280*330*410 mm.
""", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            print("Did tap on Ok Action")
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        print("Part Dimensions(mm)")
    }
    
    @IBAction func xSliderAction(_ sender: UISlider) {
        xLabelView.text = String(Int(xSlider.value))
        
        if xLabelView.text == "" {
            xLabelView.text = ""
        } else {
            volumeFieldView.text = "Только одно"
        }
        
        let sumX = xSlider.value * ySlider.value * zSlider.value
        
        let xEconomyUnitCost = Int(sumX * quantityRequiredSlider.value * 8)
        let xEconomyTotalCost = Int(sumX * quantityRequiredSlider.value * 8)
        
        let xExpressUnitCost = Int(sumX * quantityRequiredSlider.value * 12)
        let xExpressTotalCost = Int(sumX * quantityRequiredSlider.value * 12)
        
        economyUnitCostLabel.text = "Unit cost: €\(xEconomyUnitCost)"
        economyTotalCostLabel.text = "Total cost: €\(xEconomyTotalCost)"
        
        expressUnitCostLabel.text = "Unit cost: €\(xExpressUnitCost)"
        expressTotalCostLabel.text = "Total cost: €\(xExpressTotalCost)"
        
        print("xSliderAction")
    }
    
    @IBAction func ySliderAction(_ sender: Any) {
        yLabelView.text = String(Int(ySlider.value))
        
        if yLabelView.text == "" {
            yLabelView.text = ""
        } else {
            volumeFieldView.text = "Только одно"
        }
        
        let sumY = xSlider.value * ySlider.value * zSlider.value
        
        let yEconomyUnitCost = Int(sumY * quantityRequiredSlider.value * 8)
        let yEconomyTotalCost = Int(sumY * quantityRequiredSlider.value * 8)
        
        let yExpressUnitCost = Int(sumY * quantityRequiredSlider.value * 12)
        let yExpressTotalCost = Int(sumY * quantityRequiredSlider.value * 12)
        
        economyUnitCostLabel.text = "Unit cost: €\(yEconomyUnitCost)"
        economyTotalCostLabel.text = "Total cost: €\(yEconomyTotalCost)"
        
        expressUnitCostLabel.text = "Unit cost: €\(yExpressUnitCost)"
        expressTotalCostLabel.text = "Total cost: €\(yExpressTotalCost)"
        
        print("ySliderAction")
    }
    
    @IBAction func zSliderAction(_ sender: Any) {
        zLabelView.text = String(Int(zSlider.value))
        
        if zLabelView.text == "" {
            zLabelView.text = ""
        } else {
            volumeFieldView.text = "Только одно"
        }
        
        let sumZ = xSlider.value * ySlider.value * zSlider.value
        
        let zEconomyUnitCost = Int(sumZ * quantityRequiredSlider.value * 8)
        let zEconomyTotalCost = Int(sumZ * quantityRequiredSlider.value * 8)
        
        let zExpressUnitCost = Int(sumZ * quantityRequiredSlider.value * 12)
        let zExpressTotalCost = Int(sumZ * quantityRequiredSlider.value * 12)
        
        economyUnitCostLabel.text = "Unit cost: €\(zEconomyUnitCost)"
        economyTotalCostLabel.text = "Total cost: €\(zEconomyTotalCost)"
        
        expressUnitCostLabel.text = "Unit cost: €\(zExpressUnitCost)"
        expressTotalCostLabel.text = "Total cost: €\(zExpressTotalCost)"
        
        print("zSliderAction")
    }
    
    // - Volume
    @IBAction func volumeActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Volume", message: """
        Сообщение
                Volume
        """, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            print("Did tap on Ok Action")
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        print("Volume")
    }
    
    @IBAction func goVolumeButtonAction(_ sender: Any) {
        
        if volumeFieldView.text == "" {
            volumeFieldView.text = ""
        } else {
            xSlider.value = 0
            ySlider.value = 0
            zSlider.value = 0
            xLabelView.text = "0"
            yLabelView.text = "0"
            zLabelView.text = "0"
        }
        
        let volume = Int(volumeFieldView.text ?? "")
        let sumVolume = Int(volume ?? 0) * Int(quantityRequiredSlider.value)
        
        let volumeEconomyUnitCost = Int(sumVolume * 90)
        let volumeEconomyTotalCost = Int(sumVolume * 90)
        
        let volumeExpressUnitCost = Int(sumVolume * 120)
        let volumeExpressTotalCost = Int(sumVolume * 120)
        
        economyUnitCostLabel.text = "Unit cost: €\(volumeEconomyUnitCost)"
        economyTotalCostLabel.text = "Total cost: €\(volumeEconomyTotalCost)"
        
        expressUnitCostLabel.text = "Unit cost: €\(volumeExpressUnitCost)"
        expressTotalCostLabel.text = "Total cost: €\(volumeExpressTotalCost)"
        
        print("Volume Button")
    }
    
    // - Material Options
    @IBAction func materialOptionsActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Material Options", message: """
        (Добавить выбор материала)
        - Nylon EOS PA 2200
        - Nylon EOS PA 3200 GF (glass-filled)

        (Добавить выбор доп. обработки)
        Extra post processing available:
        - Polishing (*)
        *Mind that sharp corners and thin details may be slightly damaged.

        - Dyeing (*)
        *Mind that parts will be snow-white by default.

         Post processing services may increase total manufacturing time for 1-2 working days.
        """, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            print("Did tap on Ok Action")
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        print("Material Options")
    }
    
    @IBAction func activityTypeSelected(_ sender: UIButton) {
        activityTypeButtons.forEach { $0.isSelected = false
        }
        
        print("activityTypeSelected")
    }
    
    @IBAction func whiteNylonButtonAction(_ sender: Any) {
        let sumXYZ = xSlider.value * ySlider.value * zSlider.value
        
        imageView.image = UIImage(named: "White Nylon")
        whiteNylonButton.isSelected = true
        
        if whiteNylonButton.isSelected == true {
            economyUnitCostLabel.text = "Unit cost: €\(sumXYZ * quantityRequiredSlider.value * 8)"
            economyTotalCostLabel.text = "Total cost: €\(sumXYZ * quantityRequiredSlider.value * 8)"

            expressUnitCostLabel.text = "Unit cost: €\(sumXYZ * quantityRequiredSlider.value * 12)"
            expressTotalCostLabel.text = "Total cost: €\(sumXYZ * quantityRequiredSlider.value * 12)"
        } else {

        }
        
        print("whiteNylonButtonAction")
    }
    
    @IBAction func whiteNylonPolishedButtonAction(_ sender: Any) {
        let sumXYZ = xSlider.value * ySlider.value * zSlider.value
        
        imageView.image = UIImage(named: "White Nylon - Polished")
        whiteNylonPolishedButton.isSelected = true
        
        if whiteNylonPolishedButton.isSelected == true {
            economyUnitCostLabel.text = "Unit cost: €\(sumXYZ + 3000 * quantityRequiredSlider.value * 8)"
            economyTotalCostLabel.text = "Total cost: €\(sumXYZ + 3000 * quantityRequiredSlider.value * 8)"

            expressUnitCostLabel.text = "Unit cost: €\(sumXYZ + 3000 * quantityRequiredSlider.value * 12)"
            expressTotalCostLabel.text = "Total cost: €\(sumXYZ + 3000 * quantityRequiredSlider.value * 12)"
        } else {

        }
        
        print("whiteNylonPolishedButtonAction")
    }
    
    @IBAction func carbonBlackNylonButtonAction(_ sender: Any) {
        let sumXYZ = xSlider.value * ySlider.value * zSlider.value
        
        imageView.image = UIImage(named: "Carbon Black Nylon")
        carbonBlackNylonButton.isSelected = true
        
        if carbonBlackNylonButton.isSelected == true {
            economyUnitCostLabel.text = "Unit cost: €\(sumXYZ * 1.1 * quantityRequiredSlider.value * 8)"
            economyTotalCostLabel.text = "Total cost: €\(sumXYZ * 1.1 * quantityRequiredSlider.value * 8)"

            expressUnitCostLabel.text = "Unit cost: €\(sumXYZ * 1.1 * quantityRequiredSlider.value * 12)"
            expressTotalCostLabel.text = "Total cost: €\(sumXYZ * 1.1 * quantityRequiredSlider.value * 12)"
        } else {

        }
        
        print("carbonBlackNylonButtonAction")
    }
    
    @IBAction func carbonBlackNylonPolishedButtonAction(_ sender: Any) {
        let sumXYZ = xSlider.value * ySlider.value * zSlider.value
        
        imageView.image = UIImage(named: "Carbon Black Nylon - Polished")
        carbonBlackNylonPolishedButton.isSelected = true
        
        if carbonBlackNylonPolishedButton.isSelected == true {
            economyUnitCostLabel.text = "Unit cost: €\(sumXYZ * 1.1 + 3000 * quantityRequiredSlider.value * 8)"
            economyTotalCostLabel.text = "Total cost: €\(sumXYZ * 1.1 + 3000 * quantityRequiredSlider.value * 8)"

            expressUnitCostLabel.text = "Unit cost: €\(sumXYZ * 1.1 + 3000 * quantityRequiredSlider.value * 12)"
            expressTotalCostLabel.text = "Total cost: €\(sumXYZ * 1.1 + 3000 * quantityRequiredSlider.value * 12)"
        } else {

        }
        
        print("carbonBlackNylonPolishedButtonAction")
    }
    
    // - Quantity Required
    @IBAction func quantityRequiredActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Quantity", message: """
        Choose the required amount of copies. (*)
        *We provide discount for volume production.
        *High volume production may take longer time.
        """, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            print("Did tap on Ok Action")
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        print("Quantity Required")
    }
    
    @IBAction func quantityRequiredSliderAction(_ sender: Any) {
        quantityRequiredLabel.text = String(Int(quantityRequiredSlider.value))
        
        let quantityRequiredEconomyUnitCost = Int(quantityRequiredSlider.value)
        let quantityRequiredEconomyTotalCost = Int(quantityRequiredSlider.value)
        
        let quantityRequiredExpressUnitCost = Int(quantityRequiredSlider.value)
        let quantityRequiredExpressTotalCost = Int(quantityRequiredSlider.value)
        
        economyUnitCostLabel.text = "Unit cost: €\(quantityRequiredEconomyUnitCost)"
        economyTotalCostLabel.text = "Total cost: €\(quantityRequiredEconomyTotalCost)"
        
        expressUnitCostLabel.text = "Unit cost: €\(quantityRequiredExpressUnitCost)"
        expressTotalCostLabel.text = "Total cost: €\(quantityRequiredExpressTotalCost)"
        
        print("quantityRequiredSliderAction")
    }
    
    // - Economy
    @IBAction func economyActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Economy", message: """
        Cost: (Price in EUR) (*)
        *This is approximate price of 3d printing.
        Please contact us to confirm.

        Term: 2-4 working days + shipping (*)
        *High volume production may take longer time.
        """, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            print("Did tap on Ok Action")
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        print("Economy")
    }
    
    // - Express
    @IBAction func expressActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Express", message: """
        Cost: (Price in EUR) (*)
        *This is approximate price of 3d printing.
        Please contact us to confirm.

        Term: 3-7 working days + shipping (*)
        *High volume production may take longer time.
        """, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { _ in
            print("Did tap on Ok Action")
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
        print("Express")
    }
    
}

// MARK: -
// MARK: - Configure

private extension SlidersViewController {
    
    func configure() {
        configureView()
        configureNavigationBar()
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Slider"
    }
    
}

