//
//  SecondPageController.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import UIKit

class SecondPageController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var newsData: [String] = []
    weak var detailsPage: DetailsPageController? {
        let vc = getController(storyboardID: .main, controllerID: .detailsPage) as? DetailsPageController
        //vc!.navigationItem.hidesBackButton = true
        vc!.modalPresentationStyle = .fullScreen
        return vc!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()

    }
    
    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        let nib = UINib(nibName: "TableCell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "TableCell")
    }
}

extension SecondPageController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // go to details page
        guard let detailsPage = detailsPage else { return }
        present(detailsPage, animated: true, completion: nil)
//        pushController(from: self, to: detailsPage, method: .withBackItem)
    }
}
