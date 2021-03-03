//
//  IPLSequence.swift
//  MyIPL
//
//  Created by Piyush Sharma on 03/03/21.
//

import Foundation

extension Array {
    public mutating func shuffle()
    {
        for i in stride(from: count - 1, through: 1, by: -1) {
            let j = Int.random(in: 0...i)
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
    
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
