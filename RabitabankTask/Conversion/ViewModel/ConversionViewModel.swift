//
//  ConversionViewModel.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import Foundation

class ConversionViewModel {
    
    var conversionModel = [ConversionModel]()
    
    init() {
        jsonSetup()
    }

    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "Conversion", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                conversionModel = try JSONDecoder().decode([ConversionModel].self, from: data)
            }
            catch {
                print(error)
            }
        }
        else{
        }
    }
    
    func SalesJsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "SalesConversion", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                conversionModel = try JSONDecoder().decode([ConversionModel].self, from: data)
            }
            catch {
                print(error)
            }
        }
        else{
        }
    }
}
