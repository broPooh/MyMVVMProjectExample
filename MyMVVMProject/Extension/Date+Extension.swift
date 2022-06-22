//
//  Date+Extension.swift
//  MyMVVMProject
//
//  Created by bro on 2022/06/22.
//

import Foundation


extension Date {
    var toString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        
        return formatter.string(from: self)
    }
}


extension String {
    
    var toDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)!
        return date
    }
}
