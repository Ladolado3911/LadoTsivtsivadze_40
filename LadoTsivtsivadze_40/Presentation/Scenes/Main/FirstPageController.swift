//
//  ViewController.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import UIKit

class FirstPageController: UIViewController {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        let nib1 = UINib(nibName: "TableCell1", bundle: nil)
        let nib2 = UINib(nibName: "TableCell2", bundle: nil)
        let nib3 = UINib(nibName: "TableCell3", bundle: nil)
        
        tblView.register(nib1, forCellReuseIdentifier: "TableCell1")
        tblView.register(nib2, forCellReuseIdentifier: "TableCell2")
        tblView.register(nib3, forCellReuseIdentifier: "TableCell3")
    }
}



extension FirstPageController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

