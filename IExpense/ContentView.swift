//
//  ContentView.swift
//  IExpense
//
//  Created by Joshua Rechkemmer on 4/11/24.
//

import SwiftUI
import Observation

@Observable
class User
{
    var firstName = "Joshua";
    var lastName = "Rechkemmer";
}

struct SecondView: View
{
    @Environment(\.dismiss) var dismiss;
    
    var body: some View
    {
        Button("Dismiss")
        {
            dismiss();
        }
    }
}

struct ContentView: View 
{
    @State private var user = User();
    @State private var showingSheet = false;
    
    @State private var numbers = [Int]();
    @State private var currentNumber = 1;
    
    @AppStorage("tapCount") private var tapCount = 0;
    
    var body: some View
    {
        NavigationStack
        {
            VStack
            {
                Text("Your name is \(user.firstName) \(user.lastName)");
                
                TextField("First Name", text: $user.firstName);
                TextField("Last Name", text: $user.lastName);
                
                Button("Tap Count: \(tapCount)")
                {
                    tapCount += 1;
                }
                
                VStack
                {
                    List
                    {
                        ForEach(numbers, id: \.self)
                        {
                            Text("Row \($0)");
                        }
                        .onDelete(perform: removeRows)
                    }
                    
                    Button("Add Number")
                    {
                        numbers.append(currentNumber);
                        currentNumber += 1;
                    }
                }
                
                Button("Show Sheet")
                {
                    showingSheet.toggle();
                }
                .sheet(isPresented: $showingSheet )
                {
                    SecondView();
                }
            }
            .padding()
            .toolbar {
                EditButton();
            }
        }
    }
    
    func removeRows(at offsets: IndexSet)
    {
        numbers.remove(atOffsets: offsets);
    }
}

#Preview {
    ContentView()
}
