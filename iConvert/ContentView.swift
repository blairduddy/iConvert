//
//  ContentView.swift
//  iConvert
//
//  Created by Blair Duddy on 2023-05-09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userInput = 0.0
    @State private var userUnit = "meter"
    @State private var userOutput = 0.0
    
    let measurementUnits = ["meter", "km", "feet", "yards", "miles"]
    
    
    //logic
    //find the smallest denominator, then multiply that for everything
    
    // 1 foot -> 1 meter = 1 * 3.28084
    // 1 foot -> 1 yard = 1 * 3
    // 1 foot -> 1 kilometer = 1 * 3280.84
    // 1 foot -> 1 mile = 1 * 5280
    
    
    
    
    
    
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Input", value: $userInput, format: .number)
                } header: {
                    Text("Input Measurement:")
                }
                
                
                Section {
                    Picker("Units", selection: $userUnit) {
                        ForEach(measurementUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Units:")
                }
                
                
                Section {
                    Picker("Output Units", selection: $userUnit) {
                        ForEach(measurementUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Translate measurement to:")
                }
                
                
                Section {
                    Text(userOutput, format: .number)
                } header: {
                    Text("Output Measurement:")
                }
                
            }
            .navigationTitle("iConvert")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Build an app that converts units.
//User will select input unit and output unit.
//User will enter a value, and see the output of that conversion.

//You may need:
//A segmented control for meters, km, fft, yrds, miles for the input unit.
//A segmented control for m, km, ft, yds, miles for output unit
//A text field where the user would enter a number
//A text view showing the result of the conversion
