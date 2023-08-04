//
//  DayIntakeCardCollectionViewCell.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 8/1/23.
//

import UIKit


extension Array<HydrationLog> {
    func getDayIntakeModels() -> [DayIntakeDataModel] {
        var daysIntakePerType: [DayIntakeDataModel] = []
        
        let totalOunces = self.reduce(0.0) { partialResult, log in
            return partialResult + log.measurement
        }
        
        for type in HydrationType.allCases {
            let filteredLogs = self.filter({$0.type == type})
            
            let totalMeasurement = filteredLogs.reduce(0.0) { partialResult, log in
                return partialResult + log.measurement
            }
            
            if filteredLogs.count > 0 {
                daysIntakePerType.append(.init(
                    hydrationType: type,
                    totalMeasurement: totalMeasurement,
                    percentage: totalMeasurement / totalOunces))
            }
        }
        
        return daysIntakePerType
    }
}

class DayIntakeDataModel {
    var hydrationType: HydrationType
    var totalMeasurement: Double
    var percentage: Double
    
    init(hydrationType: HydrationType, totalMeasurement: Double, percentage: Double) {
        self.hydrationType = hydrationType
        self.totalMeasurement = totalMeasurement
        self.percentage = percentage
    }
}

class DayIntakeCardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var hydrationTypeImageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var hydrationTypeTitleLabel: UILabel!
    @IBOutlet weak var measurementLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    var dayIntakeModel: DayIntakeDataModel? {
        didSet {
            updateView()
        }
    }
    
    override func layoutSubviews() {
        updateView()
    }
    
    func updateView() {
        let image = dayIntakeModel?.hydrationType.image.withRenderingMode(.alwaysTemplate)
        hydrationTypeImageView.image = image
        hydrationTypeImageView.tintColor = dayIntakeModel?.hydrationType.color
        
        hydrationTypeTitleLabel.text = dayIntakeModel?.hydrationType.title
        measurementLabel.text = "\(dayIntakeModel!.totalMeasurement.twoDecimalPlaces()) oz"
        percentageLabel.text = "\((dayIntakeModel!.percentage * 100).twoDecimalPlaces()) %"
    }
}
