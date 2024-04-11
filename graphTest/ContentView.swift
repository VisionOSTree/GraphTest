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
    
    @State var count: Int = 1
    @State var latest: Int = 1
    @State var stop: Bool = true
    
    func callFunc() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                hrVals.append(HeartRate(time: count, rate: Double.random(in: 60...120)))
                if(hrVals.count > 20){
                    hrVals.removeFirst()
                }
                print("got heart rate: \(count)")
                count = count + 1
                if !stop {
                    callFunc()
                }
            }
        }
    
    @State var hrVals = [
        HeartRate(time: 0, rate: 120.786)
    ]

    
    
    var body: some View {
        Text("Chart:")
        GroupBox("Average Heart Rate:"){
            Chart{
                ForEach(hrVals){HeartRate in LineMark(x: .value("Time", HeartRate.time), y:.value("Heart Rate", HeartRate.rate) )
                }
            }
            .chartXScale(domain: count > 20 ? [count-20, count] : [0, 20])
//            .chartPlotStyle { plotArea in
//                plotArea
//
//            }
            .foregroundStyle(.red)
            
            

        }
        Text("Your heart rate is: \(hrVals.index(before: count))")
        Button(action: startStop, label: {
            Text("stopped: \(stop)")
        })
        
        
        .padding()
        
    }
    
    private func startStop(){
        if stop { //Continue loop
            stop = false
            callFunc()
        } else { //Stop loop
            stop = true
        }
    }
    
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
