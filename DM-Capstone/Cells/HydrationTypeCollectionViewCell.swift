//
//  HydrationTypeCollectionViewCell.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 8/1/23.
//

import UIKit

protocol HydrationTypeCollectionViewCellDelegate {
    func hydrationTypeCollectionViewCell(didSelect cell: HydrationTypeCollectionViewCell)
}

class HydrationTypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var hydrationTypeImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var delegate: HydrationTypeCollectionViewCellDelegate?
    
    var type: HydrationType? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        let image = type!.image.withRenderingMode(.alwaysTemplate)
        hydrationTypeImage.image = image
        hydrationTypeImage.tintColor = .white
        
        button.tintColor = type!.color
    }
    
    @IBAction func onTapped(_ sender: Any) {
        delegate?.hydrationTypeCollectionViewCell(didSelect: self)
    }
}
