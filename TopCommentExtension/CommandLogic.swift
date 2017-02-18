
import Foundation

func removeTopComment(from lines: NSMutableArray) {
    
    guard
        let firstLine = (lines.firstObject as? String), firstLine.hasPrefix("//")
        else {
            return
    }
    
    var firstEmpty = 0
    for (i, bufferLine) in lines.enumerated() {
        let line = bufferLine as! String
        if line == "\n" {
            firstEmpty = i
            break
        }
    }
    
    lines.removeObjects(in: NSRange(location: 0, length: firstEmpty))
}

func changeDate(in lines: NSMutableArray) {
    
    guard
        let firstLine = (lines.firstObject as? String), firstLine.hasPrefix("//")
        else {
            return
    }
    
    let dateLine = lines.first(where: {
        return ($0 as! String).hasPrefix("//  Created by")
    }) as! String
    
    let pattern = "\\d\\d([/])\\d\\d([/])\\d\\d\\d\\d"
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    let today = dateFormatter.string(from: Date())
    
    let newLine = regex.stringByReplacingMatches(in: dateLine, options: [], range: dateLine.fullRange, withTemplate: today)
    
    lines.replaceObject(at: lines.index(of: dateLine), with: newLine)
}


extension String {
    
    var fullRange: NSRange {
        return NSRange(location: 0, length: characters.count)
    }
    
}
