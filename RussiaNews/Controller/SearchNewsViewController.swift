//
//  SearchNewsViewController.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 25.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import UIKit

class SearchNewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
