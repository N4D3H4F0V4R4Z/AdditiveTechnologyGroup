//
//  SlidersViewController.swift
//  ATG
//
//  Created by Наджафов Араз on 03.11.2020.
//

import UIKit

class SlidersViewController: UIViewController {
    
    // - Variable
    var volume: Double = 125
    var material: Double = 1
    var additioalFactor: Double = 0
    var quantity: Int = 1
    var isEngLang: Bool = true
    
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
    
    // - Labels
    @IBOutlet weak var partDimensionLabelView: UILabel!
    @IBOutlet weak var volumeLabelView: UILabel!
    @IBOutlet weak var materialOptionsLabelView: UILabel!
    @IBOutlet weak var quantityRequiredLabelView: UILabel!
    @IBOutlet weak var economyLabelView: UILabel!
    @IBOutlet weak var expressLabelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        xSlider.value = 50
        ySlider.value = 50
        zSlider.value = 50
        
        activityTypeButtons.first?.isSelected = true
        
        imageView.image = UIImage(named: "White Nylon")
        calculateSum()
    }
    
    @IBAction func russianVCButtonAction(_ sender: Any) {
        
        isEngLang.toggle()
        UIView.transition(with: self.view, duration: 0.4, options: .transitionFlipFromRight) {
            
        } completion: { [weak self] (_) in
            guard let self = self else { return }
            // Safe unwrap - это обычный if, просто мы не тащим за собой фигурные скобки, есои проверка не пройдена и будет nil, то сработает else и выйдет из кода
            guard let selectedButton = self.activityTypeButtons.first(where: { $0.isSelected }) else {
                // alert, например
                return
            }
            self.changeLabels()
            self.configureNavigationBar()
            self.materialButtonAction(selectedButton)
        }
        
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
        
        if isEngLang {
            economyUnitCostLabel.text = "Unit cost: €137"
            economyTotalCostLabel.text = "Total cost: €137"
            
            expressUnitCostLabel.text = "Unit cost: €187"
            expressTotalCostLabel.text = "Total cost: €187"
        } else {
            economyUnitCostLabel.text = "Поштучно: 11250₽"
            economyTotalCostLabel.text = "Оптом: 11250₽"
            
            expressUnitCostLabel.text = "Поштучно: 15000₽"
            expressTotalCostLabel.text = "Оптом: 15000₽"
        }
        
        print("resetButtonAction")
    }
    
    // - Part Dimensions(mm)
    @IBAction func partDimensionsActionButton(_ sender: Any) {
        
        let title: String
        let message: String
        let gotIt: String
        
        if isEngLang {
            title = "Part Dimensions(mm)"
            message = """
Choose maximum width, depth and height of your part.

The build size is 280*330*410 mm.
"""
            gotIt = "Got it"
        } else {
            title = "Габариты детали(мм)"
            message = """
    Выберите максимальные габариты детали по осям X, Y, Z.

    Область построения- 280*330*410 мм.
    """
            gotIt = "Понятно"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: gotIt, style: .default) {_ in }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func xSliderAction(_ sender: UISlider) {
        let value: String = "\(Int(sender.value))"
        
        volume = Double(Int(xSlider.value) * Int(ySlider.value) * Int(zSlider.value)) * 0.001
        
        switch sender.tag {
        case 0:
            xLabelView.text = value
        case 1:
            yLabelView.text = value
        case 2:
            zLabelView.text = value
        default: break
        }
        
        calculateSum()
        
        print("xSliderAction")
    }
    
    
    // - Volume
    @IBAction func volumeActionButton(_ sender: Any) {
        
        let title: String
        let message: String
        let gotIt: String
        
        if isEngLang {
            title = "Volume"
            message = """
                Volume
"""
            gotIt = "Got it"
        } else {
            title = "Обьем"
            message = """
    Обьем
    """
            gotIt = "Понятно"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: gotIt, style: .default) {_ in }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func goVolumeButtonAction(_ sender: Any) {
        // If isEmpty = false willbe true and we will go on straight
        guard !(volumeFieldView.text?.isEmpty ?? true),
              let value = Double(volumeFieldView.text ?? "") else { return }
        
        volume = value
        xSlider.value = 0
        ySlider.value = 0
        zSlider.value = 0
        xLabelView.text = "0"
        yLabelView.text = "0"
        zLabelView.text = "0"
        
        calculateSum()
        
        print("Volume Button")
    }
    
    // - Material Options
    @IBAction func materialOptionsActionButton(_ sender: Any) {
        
        let title: String
        let message: String
        let gotIt: String
        
        if isEngLang {
            title = "Material Options"
            message = """
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
"""
            gotIt = "Got it"
        } else {
            title = "Выбор материала"
            message = """
    (Добавить выбор материала)
    - Полиамид EOS PA 2200
    - Полиамид EOS PA 3200 GF (стеклонаполненный)
    
    (Добавить выбор доп. обработки)
    Дополнительная обработка:
    - Галтование (шлифование поверхности в галтовочном барабане) (*)
    *Обратите внимание, что острые углы, а также мельчайшие элементы могут быть сглажены.
    
    - Покраска методом травления пигментом (*)
    *Детали из полиамида имеют белый цвет по умолчанию.

    Услуга дополнительной обработки поверхности занимает обычно 1-2 рабочих дня.
    """
            gotIt = "Понятно"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: gotIt, style: .default) {_ in }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func activityTypeSelected(_ sender: UIButton) {
        activityTypeButtons.forEach { $0.isSelected = false
        }
        
        print("activityTypeSelected")
    }
    
    // Функция, которая отвечает за смену коэффициентов при выборе материала: у каждого материала есть свой id, который берется в зависимости от нажатой кнопки. Когда мы меняем язык, у нас эта функция должна заново вызываться и подставлять в sender ту кнопку, у которой is selected = true
    @IBAction func materialButtonAction(_ sender: UIButton) {
        
        let imageName: String
        
        activityTypeButtons.forEach({ $0.isSelected = false })
        sender.isSelected = true
        
        additioalFactor = 0
        
        if isEngLang {
            switch sender.tag {
            case 0:
                material = 1
                imageName = "White Nylon"
            case 1:
                material = 1
                additioalFactor = 35
                imageName = "White Nylon - Polished"
            case 2:
                material = 1.1
                imageName = "Carbon Black Nylon"
            case 3:
                material = 1.1
                additioalFactor = 35
                imageName = "Carbon Black Nylon - Polished"
            default: return
            }
        } else {
            switch sender.tag {
            case 0:
                material = 1
                imageName = "White Nylon"
            case 1:
                material = 1
                additioalFactor = 3000
                imageName = "White Nylon - Polished"
            case 2:
                additioalFactor = 10
                imageName = "Carbon Black Nylon"
            case 3:
                additioalFactor = 3010
                imageName = "Carbon Black Nylon - Polished"
            default: return
            }
            
            imageView.image = UIImage(named: imageName)
            
            print("whiteNylonButtonAction")
        }
        
        calculateSum()
    }
    
    // - Quantity Required
    @IBAction func quantityRequiredActionButton(_ sender: Any) {
        
        let title: String
        let message: String
        let gotIt: String
        
        if isEngLang {
            title = "Quantity"
            message = """
Choose the required amount of copies. (*)
*We provide discount for volume production.
*High volume production may take longer time.
"""
            gotIt = "Got it"
        } else {
            title = "Количество/тираж"
            message = """
    Укажите требуемое количество деталей. (*)
    *При заказе партии деталей предусмотрена скидка.
    *Изготовление партии деталей может занять более длительный срок.
    """
            gotIt = "Понятно"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: gotIt, style: .default) {_ in }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func quantityRequiredSliderAction(_ sender: Any) {
        quantityRequiredLabel.text = String(Int(quantityRequiredSlider.value))
        
        quantity = Int(quantityRequiredSlider.value)
        
        calculateSum()
        
        print("quantityRequiredSliderAction")
    }
    
    // - Economy
    @IBAction func economyActionButton(_ sender: Any) {
        
        let title: String
        let message: String
        let gotIt: String
        
        if isEngLang {
            title = "Economy"
            message = """
Cost: (Price in EUR) (*)
*This is approximate price of 3d printing.
Please contact us to confirm.

Term: 2-4 working days + shipping (*)
*High volume production may take longer time.
"""
            gotIt = "Got it"
        } else {
            title = "Эконом"
            message = """
    Стоимость: (Цена в рублях) (*)
    *Это ориентировочная стоимость 3d печати.
    Свяжитесь с нами для подтверждения.

    Сроки: 3-7 рабочих дней + доставка (*)
    *Изготовление партии деталей может занять более длительный срок.
    """
            gotIt = "Понятно"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: gotIt, style: .default) {_ in }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    // - Express
    @IBAction func expressActionButton(_ sender: Any) {
        
        let title: String
        let message: String
        let gotIt: String
        
        if isEngLang {
            title = "Express"
            message = """
Cost: (Price in EUR) (*)
*This is approximate price of 3d printing.
Please contact us to confirm.

Term: 3-7 working days + shipping (*)
*High volume production may take longer time.
"""
            gotIt = "Got it"
        } else {
            title = "Экспресс"
            message = """
    Стоимость: (Цена в рублях) (*)
    *Это ориентировочная стоимость 3d печати.
    Свяжитесь с нами для подтверждения.

    Сроки: 2-4 рабочих дней + доставка (*)
    *Изготовление партии деталей может занять более длительный срок.
    """
            gotIt = "Понятно"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: gotIt, style: .default) {_ in }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: -
// MARK: - Configure

private extension SlidersViewController {
    
    func configure() {
        configureView()
        configureNavigationBar()
        changeLabels()
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureNavigationBar() {
        if isEngLang {
            navigationItem.title = "Slider"
        } else {
            navigationItem.title = "Слайдер"
        }
    }
    
    func calculateSum() {
        
        // if additioalFactor == true { sum += 35 } else { sum += 0 }
        let unit: Double = volume * material
        let economyKoef = isEngLang ? 1.1 : 90
        let expressKoef = isEngLang ? 1.5 : 120
        
        let economyUnit: Int = Int(unit * economyKoef + additioalFactor)
        let economyTotal: Int = Int(unit * economyKoef * Double(quantity) + additioalFactor)
        let expressUnit: Int = Int(unit * expressKoef + additioalFactor)
        let expressTotal: Int = Int(unit * expressKoef * Double(quantity) + additioalFactor)
        
        let unitText = isEngLang ? "Unit cost: " : "Поштучно: "
        let totalText = isEngLang ? "Total cost: " : "Оптом: "
        let quantity = isEngLang ? "€" : "₽"
        
        economyUnitCostLabel.text = unitText + "\(economyUnit)" + quantity
        economyTotalCostLabel.text = totalText + "\(economyTotal)" + quantity
        
        expressUnitCostLabel.text = unitText + "\(expressUnit)" + quantity
        expressTotalCostLabel.text = totalText + "\(expressTotal)" + quantity
    }
    
    func changeLabels() {
        if isEngLang {
            partDimensionLabelView.text = "Part Dimension"
            volumeLabelView.text = "Volume"
            materialOptionsLabelView.text = "Material Options"
            quantityRequiredLabelView.text = "Quantity"
            economyLabelView.text = "Economy"
            expressLabelView.text = "Express"
        } else {
            partDimensionLabelView.text = "Габариты детали"
            volumeLabelView.text = "Обьем"
            materialOptionsLabelView.text = "Выбор материала"
            quantityRequiredLabelView.text = "Количество"
            economyLabelView.text = "Эконом"
            expressLabelView.text = "Экспресс"
        }
    }
    
}
