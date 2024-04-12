//
//  ExpenseContentView.swift
//  IExpense
//
//  Created by Joshua Rechkemmer on 4/11/24.
//

import SwiftUI

struct ExpenseContentView: View 
{
    @State private var expenses = Expenses();
    @State private var showingAddExpense = false;
    
    var body: some View
    {
        NavigationStack
        {
            List
            {
                ForEach(expenses.items)
                {   item in
                    
                    Text(item.name);
                }
                .onDelete(perform: removeItems);
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus")
                {
                    showingAddExpense = true;
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses);
            }
        }
    }
    
    func removeItems(at offsets: IndexSet)
    {
        expenses.items.remove(atOffsets: offsets);
    }
}

#Preview {
    ExpenseContentView()
}
