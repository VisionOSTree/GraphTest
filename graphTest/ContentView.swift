//
//  ContentView.swift
//  graphTest
//
//  Created by Daniel Braithwaite on 2/4/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Charts
import DequeModule
import SwiftCSV

//struct HeartRate {
////    HeartRate struct consists of heartRate
//    // Struct is here to add more info later if needed
//    var avgHeartRate = Double?(0)
//    var numInQ = Int?(0)
//}

struct HeartRate: Identifiable {
    let id = UUID()
    let time: Int
    let rate: Double
    init(time: Int, rate: Double) {
        self.time = time
        self.rate = rate
    }
}








struct ContentView: View {
    
    let hrVals = [
        HeartRate(time: 0, rate: 120.786),
        HeartRate(time: 1, rate: 119.487),
        HeartRate(time: 2, rate: 119.683),
        HeartRate(time: 3, rate: 118.828),
        HeartRate(time: 4, rate: 117.978),
        HeartRate(time: 5, rate: 116.65),
        HeartRate(time: 6, rate: 115.356),
        HeartRate(time: 7, rate: 114.682),
        HeartRate(time: 8, rate: 114.677),
        HeartRate(time: 9, rate: 113.291),
        HeartRate(time: 10, rate: 112.379),
        HeartRate(time: 11, rate: 111.437),
        HeartRate(time: 12, rate: 110.706),
        HeartRate(time: 13, rate: 108.767),
        HeartRate(time: 14, rate: 108.714),
        HeartRate(time: 15, rate: 107.585),
        HeartRate(time: 16, rate: 106.455),
        HeartRate(time: 17, rate: 105.276),
        HeartRate(time: 18, rate: 103.819),
        HeartRate(time: 19, rate: 102.924),
        HeartRate(time: 20, rate: 101.215),
        HeartRate(time: 21, rate: 99.276),
        HeartRate(time: 22, rate: 99.659),
        HeartRate(time: 23, rate: 98.403),
        HeartRate(time: 24, rate: 96.867),
        HeartRate(time: 25, rate: 96.37),
        HeartRate(time: 26, rate: 94.985),
        HeartRate(time: 27, rate: 94.18),
        HeartRate(time: 28, rate: 92.472),
        HeartRate(time: 29, rate: 91.167),
        HeartRate(time: 30, rate: 90.073),
        HeartRate(time: 31, rate: 88.067),
        HeartRate(time: 32, rate: 88.459),
        HeartRate(time: 33, rate: 87.006),
        HeartRate(time: 34, rate: 85.576),
        HeartRate(time: 35, rate: 84.588),
        HeartRate(time: 36, rate: 83.303),
        HeartRate(time: 37, rate: 81.679),
        HeartRate(time: 38, rate: 81.177),
        HeartRate(time: 39, rate: 79.803),
        HeartRate(time: 40, rate: 78.531),
        HeartRate(time: 41, rate: 77.197),
        HeartRate(time: 42, rate: 75.678),
        HeartRate(time: 43, rate: 74.393),
        HeartRate(time: 44, rate: 72.57),
        HeartRate(time: 45, rate: 71.748),
        HeartRate(time: 46, rate: 70.211),
        HeartRate(time: 47, rate: 68.53),
        HeartRate(time: 48, rate: 67.63),
        HeartRate(time: 49, rate: 65.897)
    ]

    
    
    var body: some View {
        Text("Chart:")
        GroupBox("Average Heart Rate:"){
            Chart{
                ForEach(hrVals){HeartRate in LineMark(x: .value("Time", HeartRate.time), y:.value("Heart Rate", HeartRate.rate) )
                }
            }
//            .chartPlotStyle { plotArea in
//                plotArea
//
//            }
            .foregroundStyle(.red)

        }
        
        
        .padding()
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
