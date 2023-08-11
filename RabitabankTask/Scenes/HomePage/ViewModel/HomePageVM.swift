//
//  HomePageVM.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import Foundation

class ViewModel {
    
    var homePageModel = [HomePageModel]()

    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "HomePage", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                homePageModel = try JSONDecoder().decode([HomePageModel].self, from: data)
            }
            catch {
                print(error)
            }
        }
        else{
        }
    }
    }
