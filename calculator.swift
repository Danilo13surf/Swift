import Foundation
import UIKit

func minMaxSum(value: [Int]) -> [Int] {
    guard let minValue = value.min(), let maxValue = value.max() else { return [] }
    
    let totalValue = value.reduce(0,+)
    
    let min = totalValue - maxValue
    let max = totalValue - minValue
    let newArray = [min, max]
    print([min, max])
    return newArray
}
