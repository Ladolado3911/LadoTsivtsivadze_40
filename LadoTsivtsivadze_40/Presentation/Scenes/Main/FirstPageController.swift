//
//  ViewController.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import UIKit

class FirstPageController: UIViewController {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    var tableCell1Data: [String] = []
    var tableCell2Data: [String] = []
    var tableCell3Data: [String] = []
    
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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "TableCell1") as? TableCell1
            return cell1!
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "TableCell2") as? TableCell2
            return cell2!
        case 2:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "TableCell3") as? TableCell3
            return cell3!
        default:
            return UITableViewCell()
        }
    }
}

