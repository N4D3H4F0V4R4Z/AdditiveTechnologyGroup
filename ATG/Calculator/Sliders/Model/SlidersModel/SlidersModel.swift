//
//  SlidersModel.swift
//  ATG
//
//  Created by Наджафов Араз on 03.01.2021.
//

import Foundation

enum MaterialType: String {
    
    case a
    case b
    case c
    case d
    
}

class SlidersModel: NSObject, NSCoding {
    
    let x: String
    let y: String
    let z: String
    let volume: String
    let materials: MaterialType
    let quantity: String
    
    init(x: String, y: String, z: String, volume: String, materials: MaterialType, quantity: String) {
        self.x = x
        self.y = y
        self.z = z
        self.volume = volume
        self.materials = materials
        self.quantity = quantity
    }

    func encode(with coder: NSCoder) {
        coder.encode(x, forKey: "x")
        coder.encode(y, forKey: "y")
        coder.encode(z, forKey: "z")
        coder.encode(volume, forKey: "volume")
        coder.encode(materials.rawValue, forKey: "materialsx")
        coder.encode(quantity, forKey: "quantity")
    }
    
    required init?(coder: NSCoder) {
        x = coder.decodeObject(forKey: "x") as? String ?? ""
        y = coder.decodeObject(forKey: "y") as? String ?? ""
        z = coder.decodeObject(forKey: "z") as? String ?? ""
        volume = coder.decodeObject(forKey: "volume") as? String ?? ""
        materials = MaterialType(rawValue: coder.decodeObject(forKey: "materials") as! String) ?? MaterialType.a
        quantity = coder.decodeObject(forKey: "quantity") as? String ?? ""
    }
    
}
