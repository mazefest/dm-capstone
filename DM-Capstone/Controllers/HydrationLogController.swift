//
//  HydrationLogController.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/25/23.
//

import Foundation

class HydrationLogcontroller {
    static var shared = HydrationLogcontroller()
    
    var logs: [HydrationLog] = []
    
    init() {
        load()
    }
    
    func add(_ hydrationLog: HydrationLog) {
        logs.append(hydrationLog)
        cache()
    }
    
    func remove(_ hydrationLog: HydrationLog) {
        guard let index = logs.firstIndex(where: {$0.id == hydrationLog.id}) else { return }
        logs.remove(at: index)
        cache()
    }
    
    func update(_ hydrationLog: HydrationLog) {
        guard let index = logs.firstIndex(where: {$0.id == hydrationLog.id}) else { return }
        logs[index] = hydrationLog
        cache()
    }
    
    func cache() {
        //
    }
    
    func load() {
        //
    }
}
