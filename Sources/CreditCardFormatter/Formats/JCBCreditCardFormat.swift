//
//  JCBCreditCardFormat.swift
//  CreditCardFormatter
//
//  Created by barbarity on 12/12/2019.
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

public struct JCBCreditCardFormat: CreditCardFormat {
    public let blocks: [Int] = [4, 4, 4, 4, 3]
    public let brand: CreditCardBrand = .jcb
    public let cvvLength: Int = 3
    
    private let maxLength = 19
    private let minLength = 16
    
    public init() {}
    
    public func shouldFormat(_ string: String) -> Bool {
        return string.starts(between: "3528", and: "3589")
    }
    
    public func isValid(_ string: String) -> Bool {
        guard shouldFormat(string) else { return false }
        guard string.count >= minLength, string.count <= maxLength else { return false }
        return ValidationAlgorithms.luhnCheck(string)
    }
}
