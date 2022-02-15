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
            return "You are above sea level!"
        } else if currentPressure > 100 {
            return "You are below sea level!"
        } else if currentPressure == 100 {
            return "You are at sea level!"
        }
        
        return "I don't know where you are!"
        
    }
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            Text ("Current Temperature:")
                .font(.title2)
                .padding(.vertical, 5)
            
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
            
            HStack {
                Spacer()
                Text("\(String(format: "%.0f", temperature)) °C")
                    .font(.largeTitle)
                .bold()
                Spacer()
            }
            
            Text("Current Pressure:")
                .font(.title2)
                .padding(.vertical, 5)
            
            HStack {
                Spacer()
                Text("\(String(format: "%.0f", currentPressure)) kPa")
                    .font(.largeTitle)
                .bold()
                Spacer()
            }
            
            HStack {
                Spacer()
                Text (feedback)
                    .italic()
                .padding()
                Spacer()
            }
            
            Spacer()
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
