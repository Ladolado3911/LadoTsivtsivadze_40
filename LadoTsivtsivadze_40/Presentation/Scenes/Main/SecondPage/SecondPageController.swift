//
//  SecondPageController.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import UIKit

class SecondPageController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var data: [News] = []
    weak var detailsPage: DetailsPageController? {
        let vc = getController(storyboardID: .main, controllerID: .detailsPage) as? DetailsPageController
        //vc!.navigationItem.hidesBackButton = true
        vc!.modalPresentationStyle = .fullScreen
        return vc!
    }
    
    private var networkManager: NetworkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refresh()
    }
    
    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        let nib = UINib(nibName: "TableCell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "TableCell")
    }
    
    func refresh() {
        networkManager.fetchNews { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.data = Array(response.List.shuffled().prefix(7))
                    self.tblView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension SecondPageController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? TableCell
        
        let item = data[indexPath.row]
        let image = item.BigCoverPhotoUrl
        let title = item.Title
        let subtitle = item.ShortDescription
        let date = item.Date
        
        cell!.imgView.kf.setImage(with: URL(string: image!))
        cell!.title.text = title
        cell!.subtitle.text = subtitle
        cell!.date.text = date
        
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
