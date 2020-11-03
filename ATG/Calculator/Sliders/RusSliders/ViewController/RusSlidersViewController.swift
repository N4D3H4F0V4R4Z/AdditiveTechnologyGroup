//
//  RusSlidersViewController.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit

class RusSlidersViewController: UIViewController {
    
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
    
    @IBAction func resetButtonAction(_ sender: Any) {
        xSlider.value = 50
        ySlider.value = 50
        zSlider.value = 50
        
        xLabelView.text = "50"
        yLabelView.text = "50"
        zLabelView.text = "50"
        
        activityTypeButtons.forEach { $0.isSelected = false
        }
        activityTypeButtons.first?.isSelected = true
        
        imageView.image = UIImage(named: "White Nylon")
        
        quantityRequiredSlider.value = 1
        quantityRequiredLabel.text = "1"
        
        economyUnitCostLabel.text = "Unit cost: 99.00₽"
        economyTotalCostLabel.text = "Total cost: 99.00₽"
        
        expressUnitCostLabel.text = "Unit cost: 99.00₽"
        expressTotalCostLabel.text = "Total cost: 99.00₽"
        
        print("resetButtonAction")
    }
    
    // - Part Dimensions(mm)
    @IBAction func partDimensionsActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Габариты детали(мм)", message: """
Выберите максимальные габариты детали по осям X, Y, Z.

Область построения- 280*330*410 мм.
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
        
        let xEconomyUnitCost = Int(xSlider.value * ySlider.value * zSlider.value)
        let xEconomyTotalCost = Int(xSlider.value * ySlider.value * zSlider.value)
        
        let xExpressUnitCost = Int(xSlider.value * ySlider.value * zSlider.value)
        let xExpressTotalCost = Int(xSlider.value * ySlider.value * zSlider.value)
        
        economyUnitCostLabel.text = "Unit cost: \(xEconomyUnitCost)₽"
        economyTotalCostLabel.text = "Total cost: \(xEconomyTotalCost)₽"
        
        expressUnitCostLabel.text = "Unit cost: \(xExpressUnitCost)₽"
        expressTotalCostLabel.text = "Total cost: \(xExpressTotalCost)₽"
        
        print("xSliderAction")
    }
    
    @IBAction func ySliderAction(_ sender: Any) {
        yLabelView.text = String(Int(ySlider.value))
        
        let yEconomyUnitCost = Int(xSlider.value * ySlider.value * zSlider.value)
        let yEconomyTotalCost = Int(xSlider.value * ySlider.value * zSlider.value)
        
        let yExpressUnitCost = Int(xSlider.value * ySlider.value * zSlider.value)
        let yExpressTotalCost = Int(xSlider.value * ySlider.value * zSlider.value)
        
        economyUnitCostLabel.text = "Unit cost: \(yEconomyUnitCost)₽"
        economyTotalCostLabel.text = "Total cost: \(yEconomyTotalCost)₽"
        
        expressUnitCostLabel.text = "Unit cost: \(yExpressUnitCost)₽"
        expressTotalCostLabel.text = "Total cost: \(yExpressTotalCost)₽"
        
        print("ySliderAction")
    }
    
    @IBAction func zSliderAction(_ sender: Any) {
        zLabelView.text = String(Int(zSlider.value))
        
        let zEconomyUnitCost = Int(xSlider.value * ySlider.value * zSlider.value)
        let zEconomyTotalCost = Int(xSlider.value * ySlider.value * zSlider.value)
        
        let zExpressUnitCost = Int(xSlider.value * ySlider.value * zSlider.value)
        let zExpressTotalCost = Int(xSlider.value * ySlider.value * zSlider.value)
        
        economyUnitCostLabel.text = "Unit cost: \(zEconomyUnitCost)₽"
        economyTotalCostLabel.text = "Total cost: \(zEconomyTotalCost)₽"
        
        expressUnitCostLabel.text = "Unit cost: \(zExpressUnitCost)₽"
        expressTotalCostLabel.text = "Total cost: \(zExpressTotalCost)₽"
        
        print("zSliderAction")
    }
    
    // - Volume
    @IBAction func volumeActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Надпись", message: """
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
        
        print("Volume Button")
    }
    
    // - Material Options
    @IBAction func materialOptionsActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Выбор материала", message: """
        (Добавить выбор материала)
        - Полиамид EOS PA 2200
        - Полиамид EOS PA 3200 GF (стеклонаполненный)

        (Добавить выбор доп. обработки)
        Дополнительная обработка:
        - Галтование (шлифование поверхности в галтовочном барабане) (*)
        *Обратите внимание, что острые углы, а также мельчайшие элементы могут быть сглажены.

        Покраска методом травления пигментом (*)
        *Детали из полиамида имеют белый цвет по умолчанию.

         Услуга дополнительной обработки поверхности занимает обычно 1-2 рабочих дня.
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
        imageView.image = UIImage(named: "White Nylon")
        whiteNylonButton.isSelected = true
        
        print("whiteNylonButtonAction")
    }
    
    @IBAction func whiteNylonPolishedButtonAction(_ sender: Any) {
        imageView.image = UIImage(named: "White Nylon - Polished")
        whiteNylonPolishedButton.isSelected = true
        
        print("whiteNylonPolishedButtonAction")
    }
    
    @IBAction func carbonBlackNylonButtonAction(_ sender: Any) {
        imageView.image = UIImage(named: "Carbon Black Nylon")
        carbonBlackNylonButton.isSelected = true
        
        print("carbonBlackNylonButtonAction")
    }
    
    @IBAction func carbonBlackNylonPolishedButtonAction(_ sender: Any) {
        imageView.image = UIImage(named: "Carbon Black Nylon - Polished")
        carbonBlackNylonPolishedButton.isSelected = true
        
        print("carbonBlackNylonPolishedButtonAction")
    }
    
    // - Quantity Required
    @IBAction func quantityRequiredActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Количество/тираж", message: """
        Укажите требуемое количество деталей. (*)
        *При заказе партии деталей предусмотрена скидка.
        *Изготовление партии деталей может занять более длительный срок.
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
        
        let quantityRequiredEconomyUnitCost = Int(quantityRequiredSlider.value * 50)
        let quantityRequiredEconomyTotalCost = Int(quantityRequiredSlider.value * 50)
        
        let quantityRequiredExpressUnitCost = Int(quantityRequiredSlider.value * 50)
        let quantityRequiredExpressTotalCost = Int(quantityRequiredSlider.value * 50)
        
        economyUnitCostLabel.text = "Unit cost: \(quantityRequiredEconomyUnitCost)₽"
        economyTotalCostLabel.text = "Total cost: \(quantityRequiredEconomyTotalCost)₽"
        
        expressUnitCostLabel.text = "Unit cost: \(quantityRequiredExpressUnitCost)₽"
        expressTotalCostLabel.text = "Total cost: \(quantityRequiredExpressTotalCost)₽"
        
        print("quantityRequiredSliderAction")
    }
    
    // - Economy
    @IBAction func economyActionButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Эконом", message: """
        Стоимость: (Цена в рублях) (*)
        *Это ориентировочная стоимость 3d печати.
        Свяжитесь с нами для подтверждения.

        Сроки: 3-7 рабочих дней + доставка (*)
        *Изготовление партии деталей может занять более длительный срок.
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
        let alertController = UIAlertController(title: "Экспресс", message: """
        Стоимость: (Цена в рублях) (*)
        *Это ориентировочная стоимость 3d печати.
        Свяжитесь с нами для подтверждения.

        Сроки: 2-4 рабочих дней + доставка (*)
        *Изготовление партии деталей может занять более длительный срок.
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

private extension RusSlidersViewController {
    
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
