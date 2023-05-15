//
//  ContentView.swift
//  iConvert
//
//  Created by Blair Duddy on 2023-05-09.
//

//  Task
//  Build an app that converts units.
//  User will select input unit and output unit.
//  User will enter a value, and see the output of that conversion.

//  You may need:
//  A segmented control for meters, km, fft, yrds, miles for the input unit.
//  A segmented control for m, km, ft, yds, miles for output unit
//  A text field where the user would enter a number
//  A text view showing the result of the conversion


import SwiftUI

struct ContentView: View {
    
    @FocusState private var inputFocused: Bool
    @State private var userInput = 0.0
    @State private var inputUnit = "meters"
    @State private var userOutput = 0.0
    @State private var outputUnit = "km"
    
    let measurementUnits = ["meters", "km", "feet", "yards", "miles"]
    let measurementUnitsValues = [1.0, 0.001, 3.28084, 1.09361, 0.000621371]
        
    var outputValue: Double {
        let inputValueInMeters = Double(userInput) * measurementUnitsValues[0]
        return inputValueInMeters / measurementUnitsValues[1]
    }
    
    
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Input", value: $userInput, format: .number)
                } header: {
                    Text("Input Measurement:")
                }
                
                
                Section {
                    Picker("Units", selection: $inputUnit) {
                        ForEach(measurementUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Units:")
                }
                
                
                Section {
                    Picker("Output Units", selection: $outputUnit) {
                        ForEach(measurementUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Translate measurement to:")
                }
                
                
                Section {
                    Text(outputValue, format: .number)
                } header: {
                    Text("Output Measurement:")
                }
                
            }
            .navigationTitle("iConvert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputFocused = false
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
