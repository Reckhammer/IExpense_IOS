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
    
    var body: some View
    {
        NavigationStack
        {
            List
            {
                ForEach(expenses.items, id: \.name)
                {   item in
                    
                    Text(item.name);
                }
                .onDelete(perform: removeItems);
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus")
                {
                    let expense = ExpenseItem(name: "Test", type:"Personal", amount: 5);
                    expenses.items.append(expense);
                }
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
