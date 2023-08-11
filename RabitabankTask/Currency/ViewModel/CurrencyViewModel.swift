//
//  CurrencyViewModel.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import Foundation

class CurrencyViewModel {
    
    var currencyModel = [CurrencyModel]()
    
    init() {
        jsonSetup()
    }

    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "CashCurrencyModel", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                currencyModel = try JSONDecoder().decode([CurrencyModel].self, from: data)
            }
            catch {
                print(error)
            }
        }
        else{
        }
    }
    
    func SalesJsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "Currency", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                currencyModel = try JSONDecoder().decode([CurrencyModel].self, from: data)
            }
            catch {
                print(error)
            }
        }
        else{
        }
    }
}

