//
//  HydrationLogTableViewCell.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 8/1/23.
//

import UIKit

class HydrationLogTableViewCell: UITableViewCell {

    @IBOutlet weak var hydrationTypeImageView: UIImageView!
    @IBOutlet weak var hydrationTypeTitleLabel: UILabel!
    @IBOutlet weak var measurementLabel: UILabel!
    @IBOutlet weak var hydrationLogDateLabel: UILabel!
    
    var hydrationLog: HydrationLog? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews() {
        let image = hydrationLog?.type.image.withRenderingMode(.alwaysTemplate)
        hydrationTypeImageView.image = image
        hydrationTypeImageView.tintColor = hydrationLog?.type.color
        
        hydrationTypeTitleLabel.text = hydrationLog?.type.title
        measurementLabel.text = "\(hydrationLog!.measurementDisplayString)"
        hydrationLogDateLabel.text = hydrationLog?.date?.formatted()
    }

}
