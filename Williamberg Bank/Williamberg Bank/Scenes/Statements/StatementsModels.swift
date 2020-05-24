//
//  StatementsModels.swift
//  Williamberg Bank
//
//  Created by padrao on 23/05/20.
//  Copyright (c) 2020 Williamberg. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Statements
{
  // MARK: Use cases
  
  enum LoadUserAccount
  {
    struct Request
    {
    }
    struct Response
    {
        let userAccount: UserAccount?
    }
    struct ViewModel
    {
        let name: String
        let account: String
        let balance: String
        let formatter = NumberFormatter()
        
        init(userAccount: UserAccount?) {
            name = userAccount?.name ?? "-"
            
            var formattedAccount = "-"
            if let _agency = userAccount?.agency{
                let secondIndex = _agency.index(after: _agency.startIndex)
                let prefix = _agency[_agency.startIndex...secondIndex]
                let last = _agency[ _agency.index(before: _agency.endIndex)]
                let middle = _agency[ secondIndex..<_agency.index(before: _agency.endIndex) ]
                formattedAccount = String(prefix) + " ." + String(middle) + "-" + String(last)
            }
            account = (userAccount?.bankAccount ?? "") + " /" + formattedAccount
                
            formatter.numberStyle = .currency
            if let formattedAmount = formatter.string(from: NSNumber(value: (userAccount?.balance ?? 0))) {
                balance = formattedAmount
            }
            else{
                balance = "-"
            }
        }
    }
  }
}
