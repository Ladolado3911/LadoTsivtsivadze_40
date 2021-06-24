//
//  DetailsPage.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import UIKit

class DetailsPageController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
 
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
