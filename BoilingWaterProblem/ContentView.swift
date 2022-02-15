//
//  ContentView.swift
//  BoilingWaterProblem
//
//  Created by Franka Keil on 2022-02-15.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    @State var temperature = 0.0
    
    // MARK: Computed properties
    
    var currentPressure: Double {
        return (5 * temperature) - 400
    }
    
    var feedback: String {
        if currentPressure < 100 {
            return "You are above sea level"
        } else if currentPressure > 100 {
            return "You are below sea level"
        } else if currentPressure == 100 {
            return "You are at sea level"
        }
        
        return "I don't know where you are"
        
    }
    
    var body: some View {
        
        VStack {
            Slider(value: $temperature,
                   in: 80...200,
                   step: 1,
                   label: {
                Text("Temperature")
            },
                   minimumValueLabel: {
                Text("80 °C")
            },
                   maximumValueLabel: {
                Text("200 °C")
            })
            
            Text("\(String(format: "%.1f", temperature)) °C")
                .font(.largeTitle)
                .bold()
            
            Text("Current Pressure:")
                .font(.title2)
            
            Text("\(String(format: "%.1f", currentPressure)) kPa")
                .font(.largeTitle)
                .bold()
            
            Text (feedback)
                .italic()
                .padding()
        }
        .navigationTitle("Boiling water")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
