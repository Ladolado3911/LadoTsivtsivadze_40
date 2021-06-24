//
//  TableCell3.swift
//  LadoTsivtsivadze_40
//
//  Created by Ladolado3911 on 6/24/21.
//

import UIKit

class TableCell3: UITableViewCell {

    @IBOutlet weak var collectView: UICollectionView!
    var data: [News] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configCollectView()
    }

    func configCollectView() {
        collectView.dataSource = self
        collectView.delegate = self

        let nib = UINib(nibName: "CollectCell3", bundle: nil)
        collectView.register(nib, forCellWithReuseIdentifier: "CollectCell3")
    }
}

extension TableCell3: Collect {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectCell3", for: indexPath) as? CollectCell3
        
        let item = data[indexPath.row]
        let title = item.Title
        let image = item.BigCoverPhotoUrl
        
        cell!.imgView.kf.setImage(with: URL(string: image!))
        cell!.title.text = title 
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 112, height: 154)
    }
}

