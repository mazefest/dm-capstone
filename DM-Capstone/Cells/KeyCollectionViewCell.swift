//
//  KeyCollectionViewCell.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 8/1/23.
//

import UIKit

protocol KeyCollectionViewCellDelegate {
    func keyCollectionViewCell(_ cell: KeyCollectionViewCell, withType: KeyType)
}

class KeyCollectionViewCell: UICollectionViewCell {
    
    var delegate: KeyCollectionViewCellDelegate?
    @IBOutlet weak var keyButton: UIButton!
    
    var key: KeyType? {
        didSet {
            updateView()
        }
    }
    
    @IBAction func onButtonTap(_ sender: Any) {
        delegate?.keyCollectionViewCell(self, withType: key!)
    }
    
    override func layoutSubviews() {
        updateView()
    }
    
    func updateView() {
        keyButton.clipsToBounds = true
        keyButton.backgroundColor = .lightGray
        keyButton.setTitle(key!.representation, for: .normal)
        keyButton.layer.cornerRadius = 10
    }
}
