//
//  HydrationProgressTableViewController.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 8/1/23.
//

import UIKit

class HydrationProgressTableViewController: UITableViewController {
    var dayIndex: Int = 0
    var today: Date = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return HydrationLogcontroller.shared.logs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConstantsUtil.logCellIdentifier, for: indexPath) as? HydrationLogTableViewCell else { return UITableViewCell()}
        let index = indexPath.row
        let log = HydrationLogcontroller.shared.logs[index]
        cell.hydrationLog = log
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        today = Date()
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        print("we are here \(segue.identifier)")
        if segue.identifier == "toAddLogVC" {
            guard let destinactionVC = segue.destination as? HydrationLogViewController else {
                print("we returned")
                return }
            print("setting delegate")
            destinactionVC.delegate = self
        }
    }
    

}

extension HydrationProgressTableViewController: HydrationLogDelegate {
    func hydrationLogViewController(didFinishWith hydrationLog: HydrationLog) {
        print("here inside")
        HydrationLogcontroller.shared.add(hydrationLog)
        self.tableView.reloadData()
    }
}
