//
//  AppDelegate.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var loginMainVC: BaseNC?
    var mainVC: LoginController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.windowScene = windowScene

        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            main()
        }
        else{
            login()
        }
        return true
    }
    
    func login() {
        
        self.loginMainVC = BaseNC(rootViewController: LoginController())
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window?.rootViewController = loginMainVC
        window?.makeKeyAndVisible()
    }
    
    func main() {
        
        self.window?.rootViewController?.dismiss(animated: false, completion: nil)
        self.window?.rootViewController = nil
        
        self.loginMainVC = BaseNC(rootViewController: HomePageController())

        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window?.rootViewController = loginMainVC
        window?.makeKeyAndVisible()
    }
}
