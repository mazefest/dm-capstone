//
//  HydrationLogViewController.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 8/1/23.
//

import UIKit

class HydrationLogViewController: UIViewController {
    @IBOutlet weak var hydrationTypeCollectionView: UICollectionView!
    @IBOutlet weak var numberPadCollectionView: UICollectionView!
    
    @IBOutlet weak var currentSelectedMeasurementLabel: UILabel!
    @IBOutlet weak var currentSelectedTypeImageView: UIImageView!
    @IBOutlet weak var currentSelectedTypeTitleLabel: UILabel!
   
    var delegate: HydrationLogDelegate?
    
    var currentSelectedType: HydrationType = .water
    var measurement: Double = 12.0
    var measurementString: String = "12.0"
    var measurementDisplayString: String {
        if currentSelectedType.hydrationImpact != 1.0 {
            if let m = Double(measurementString) {
                return "\(measurementString) (\((currentSelectedType.hydrationImpact * m).twoDecimalPlaces())) ounces"
            } else {
                return measurementString
            }
        }
        return measurementString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentSelectedType = .water
        measurement = 12.0
        
        hydrationTypeCollectionView.delegate = self
        hydrationTypeCollectionView.dataSource = self
        
        numberPadCollectionView.delegate = self
        numberPadCollectionView.dataSource = self
        
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        let image = currentSelectedType.image.withRenderingMode(.alwaysTemplate)
        currentSelectedTypeImageView.image = image
        currentSelectedTypeImageView.tintColor = currentSelectedType.color
        
        currentSelectedTypeTitleLabel.text = currentSelectedType.title
        currentSelectedMeasurementLabel.text = measurementDisplayString
        self.reloadInputViews()
        
    }

    @IBAction func addLogButtonTapped(_ sender: Any) {
        let newLog = HydrationLog(
            measurement: Double(measurementString) ?? 0.0, // error handle this
            date: .init(),
            hydrationType: currentSelectedType
        )
        if delegate == nil {
            print("we nil")
        }
        delegate?.hydrationLogViewController(didFinishWith: newLog)
        dismiss(animated: true)
    }

}

extension HydrationLogViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("returning \(section) \(HydrationType.allCases.count)")
        if collectionView == hydrationTypeCollectionView {
            return HydrationType.allCases.count
            
        } else {//else if collectionView == numberPadCollectionView {
            return KeyType.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == hydrationTypeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsUtil.hydrationTypeCellIdentifier, for: indexPath) as? HydrationTypeCollectionViewCell else {
                return UICollectionViewCell() }
            let type = HydrationType.allCases[indexPath.row]
            cell.type = type
            cell.delegate = self
            return cell
            
        } else if collectionView == numberPadCollectionView {
            // hre
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsUtil.keyCellIdentifier, for: indexPath) as? KeyCollectionViewCell else {
                return UICollectionViewCell()
            }
            let index = indexPath.row
            let keyType = KeyType.allCases[index]
            cell.key = keyType
            cell.delegate = self
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension HydrationLogViewController: HydrationTypeCollectionViewCellDelegate {
    func hydrationTypeCollectionViewCell(didSelect cell: HydrationTypeCollectionViewCell) {
        self.currentSelectedType = cell.type!
        updateViews()
    }
}

extension HydrationLogViewController: KeyCollectionViewCellDelegate {
    func keyCollectionViewCell(_ cell: KeyCollectionViewCell, withType: KeyType) {
        switch withType {
        case .delete:
            measurementString = measurementString.removingLastCharacter()
        default:
            if measurementString == "12.0" {
                measurementString = "\(withType.representation)"
            } else {
                measurementString = "\(measurementString)\(withType.representation)"
            }
        }
        updateViews()
    }
}
