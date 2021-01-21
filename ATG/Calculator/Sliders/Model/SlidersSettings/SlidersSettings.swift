//
//  SlidersSettings.swift
//  ATG
//
//  Created by Наджафов Араз on 03.01.2021.
//

import Foundation

final class SlidersSettings {
    
    private enum SettingsKeys: String {
        case slidersModel
    }
    
    static var slidersModel: SlidersModel! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.slidersModel.rawValue) as? Data, let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? SlidersModel else { return nil }
            return decodedModel
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingsKeys.slidersModel.rawValue
            
            if let slidersModel = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: slidersModel, requiringSecureCoding: false) {
                    defaults.set(savedData, forKey: key)
                }
            }
            
        }
    }
    
}
