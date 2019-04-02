//
//  Extensions+TimeInterval.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 02.04.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

extension TimeInterval {
    func getDateStringFromUNIX() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}
