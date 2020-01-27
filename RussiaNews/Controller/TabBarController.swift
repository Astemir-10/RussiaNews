//
//  TabBarController.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 25.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    let navigationControllerNewsFeed = NavigationController(rootViewController: ViewController())
    let navigationControllerSearch = NavigationController(rootViewController: SearchNewsViewController())
    let navigationControllerSetting = NavigationController(rootViewController: SettingViewController())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "CloseIcon"), tag: 1)
        tabBarItem.badgeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let searchBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "CloseIcon"), tag: 1)
        tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let settingBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "CloseIcon"), tag: 1)
        
        navigationControllerNewsFeed.tabBarItem = tabBarItem
        navigationControllerSearch.tabBarItem = searchBarItem
        navigationControllerSetting.tabBarItem = settingBarItem
        tabBarController?.tabBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tabBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
            
        setViewControllers([navigationControllerNewsFeed, navigationControllerSearch, navigationControllerSetting], animated: true)
        selectedViewController = navigationControllerNewsFeed
        
        tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

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
