//
//  ExpenseItem.swift
//  IExpense
//
//  Created by Joshua Rechkemmer on 4/11/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable
{
    var id = UUID();
    let name: String;
    let type: String;
    let amount: Double;
}
