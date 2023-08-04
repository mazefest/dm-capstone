//
//  HydrationProgressViewController.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 8/1/23.
//

import UIKit

class HydrationProgressViewController: UIViewController {
    @IBOutlet weak var intakeTypeCollevtionView: UICollectionView!
    @IBOutlet weak var hydrationLogsTableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var logs: [HydrationLog] {
        let start = todaysDate.modified(by: dayIndex, component: .day).startOfDay
        let end = todaysDate.modified(by: dayIndex, component: .day).endOfDay
        return HydrationLogcontroller.shared.logsInRange(start: start, end: end)
    }
    
    var todaysDate: Date = Date()
    var dayIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hydrationLogsTableView.dataSource = self
        hydrationLogsTableView.delegate = self
        
        intakeTypeCollevtionView.dataSource = self
        intakeTypeCollevtionView.delegate = self
        
        dateLabel.text = todaysDate.modified(by: dayIndex, component: .day).formatted(date: .abbreviated, time: .omitted)
    }
    
    func uppdateViews() {
        dateLabel.text = todaysDate.modified(by: dayIndex, component: .day).formatted(date: .abbreviated, time: .omitted)
        hydrationLogsTableView.reloadData()
        intakeTypeCollevtionView.reloadData()
    }
    

    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toAddLogVC" {
             guard let destinactionVC = segue.destination as? HydrationLogViewController else { return }
             destinactionVC.delegate = self
         }
     }
    
    override func viewWillAppear(_ animated: Bool) {

    }

    //MARK: - Intents
    @IBAction func decrementDateTapped(_ sender: Any) {
        dayIndex = dayIndex - 1
        print(dayIndex)
        uppdateViews()
    }
    
    @IBAction func incrementDateTapped(_ sender: Any) {
        dayIndex = dayIndex + 1
        print(dayIndex)
        uppdateViews()
    }
    

}

// HYDRATION-LOG-TABLE-VIEW-CONTROLLER
extension HydrationProgressViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let start = todaysDate.modified(by: dayIndex, component: .day).startOfDay
        let end = todaysDate.modified(by: dayIndex, component: .day).endOfDay
        let logs = HydrationLogcontroller.shared.logsInRange(start: start, end: end)
        print("co: \(logs.count)")
        return logs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConstantsUtil.logCellIdentifier, for: indexPath) as? HydrationLogTableViewCell else { return UITableViewCell()}
        let index = indexPath.row
        print("index: \(index)")
        let start = todaysDate.modified(by: dayIndex, component: .day).startOfDay
        let end = todaysDate.modified(by: dayIndex, component: .day).endOfDay
        let logs = HydrationLogcontroller.shared.logsInRange(start: start, end: end)
        print(logs.count)
        let log = logs[index]
        cell.hydrationLog = log
        return cell
    }
}

// HYDRATION-PROGRESS-TABLE-VIEW-CONTROLLER
extension HydrationProgressViewController: HydrationLogDelegate {
    func hydrationLogViewController(didFinishWith hydrationLog: HydrationLog) {
        HydrationLogcontroller.shared.add(hydrationLog)
        hydrationLogsTableView.reloadData()
    }
}

// INTAKE-TYPE-COLLECTION-VIEW
extension HydrationProgressViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logs.getDayIntakeModels().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let intakeTypes = logs.getDayIntakeModels()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "intakeTypeCardCellIdentifier", for: indexPath) as? DayIntakeCardCollectionViewCell else { return UICollectionViewCell() }
        cell.dayIntakeModel = intakeTypes[index]
        return cell
        
    }
}
