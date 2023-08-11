//
//  HomePageVM.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import Foundation

class ViewModel {
    
    var homePageModel = [Model]()

    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "HomePageCell", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                homePageModel = try JSONDecoder().decode([Model].self, from: data)
            }
            catch {
                print(error)
            }
        }
        else{
        }
    }
    }
