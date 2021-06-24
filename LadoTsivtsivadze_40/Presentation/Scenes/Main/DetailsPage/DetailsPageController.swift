//
//  DetailsPage.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import UIKit

class DetailsPageController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var articleSource: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var contentView: UITextView!
    
    var item: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        time.layer.cornerRadius = 20
        articleSource.layer.cornerRadius = 20
        
        guard let item = item else { return }
        setData(itm: item)
    }
    
    func setData(itm item: News) {
        articleSource.text = item.ArticleSource
        tittle.text = item.Title
        subtitle.text = item.ShortDescription
        time.text = item.Time
        imgView.kf.setImage(with: URL(string: item.BigCoverPhotoUrl!))
        contentView.text = item.Content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
 
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
