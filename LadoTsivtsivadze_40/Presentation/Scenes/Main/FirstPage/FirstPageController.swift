//
//  ViewController.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import UIKit

class FirstPageController: UIViewController {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    var data: [News] = []
    
    private var networkManager: NetworkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        refresh()

    }

    func configTableView() {
        let nib1 = UINib(nibName: "TableCell1", bundle: nil)
        let nib2 = UINib(nibName: "TableCell2", bundle: nil)
        let nib3 = UINib(nibName: "TableCell3", bundle: nil)
        
        tblView.register(nib1, forCellReuseIdentifier: "TableCell1")
        tblView.register(nib2, forCellReuseIdentifier: "TableCell2")
        tblView.register(nib3, forCellReuseIdentifier: "TableCell3")
        
        tblView.dataSource = self
        tblView.delegate = self
    }
    
    func refresh() {
        networkManager.fetchNews { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.data = response.List
                    self.tblView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
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
            let smallData = Array(data.shuffled().prefix(3)).map { $0.BigCoverPhotoUrl }
            cell1!.collectData = smallData
            cell1!.collectView.reloadData()
            return cell1!
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "TableCell2") as? TableCell2
            let smallData = Array(data.shuffled().prefix(5))
            cell2!.data = smallData
            cell2!.collectView.reloadData()
            return cell2!
        case 2:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "TableCell3") as? TableCell3
            let smallData = Array(data.shuffled().prefix(5))
            cell3!.data = smallData
            cell3!.collectView.reloadData()
            return cell3!
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
}

