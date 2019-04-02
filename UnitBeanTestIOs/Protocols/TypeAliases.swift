//
//  TypeAliases.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 30.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

typealias ItemClosure<T> = ((T) -> Void)
typealias OptionalItemClosureWithError<T> = ((T?,Error?) -> Void)
typealias VoidClosure = (() -> Void)


