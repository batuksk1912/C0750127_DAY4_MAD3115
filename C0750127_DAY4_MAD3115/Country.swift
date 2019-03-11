//
//  Country.swift
//  C0750127_DAY4_MAD3115
//
//  Created by Baturay Kayatürk on 2019-03-08.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import Foundation

class Country {
    
    private var name: String
    private var cities : [String]
    
    init(name: String, cities: [String]) {
        self.name = name
        self.cities = cities
    }
    
    public func getNames() -> String {
        return name
    }
    
    public func getCities() -> [String] {
        return self.cities
    }
}
