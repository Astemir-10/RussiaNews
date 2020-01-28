//
//  TabBarController.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 28.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    let navigationControllerNewsFeed = NavigationController(rootViewController: ViewController())
    let navigationControllerSearch = NavigationController(rootViewController: SearchNewsViewController())
    let navigationControllerSetting = NavigationController(rootViewController: SettingViewController())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        
        let tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "home"), tag: 1)

        let searchBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "search"), tag: 1)

        let settingBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "settings"), tag: 1)
        
        navigationControllerNewsFeed.tabBarItem = tabBarItem
        navigationControllerSearch.tabBarItem = searchBarItem
        navigationControllerSetting.tabBarItem = settingBarItem
        
        
            
        setViewControllers([navigationControllerNewsFeed, navigationControllerSearch, navigationControllerSetting], animated: true)
        selectedViewController = navigationControllerNewsFeed
        


        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
