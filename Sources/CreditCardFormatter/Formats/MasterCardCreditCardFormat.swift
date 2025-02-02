//
//  MasterCardCreditCardFormat.swift
//  CreditCardFormatter
//
//  Created by barbarity on 06/12/2019.
//  Copyright (c) 2019 Barbarity Apps
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

public struct MasterCardCreditCardFormat: CreditCardFormat {
    public let blocks: [Int] = [4, 4, 4, 4]
    public let brand: CreditCardBrand = .masterCard
    public let cvvLength: Int = 3
    
    public init() {}
    
    public func shouldFormat(_ string: String) -> Bool {
        let allowedRanges = [("2221", "2720"), ("51", "55")]
        for allowedRange in allowedRanges {
            if string.starts(between: allowedRange.0, and: allowedRange.1) {
                return true
            }
        }
        return false
    }
}
