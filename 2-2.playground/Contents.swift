import UIKit
import PlaygroundSupport

func open(fileName: String) -> String {
    let fileURL = playgroundSharedDataDirectory.appendingPathComponent(fileName)
    var fileContent: String?
    
    do {
        fileContent = try String(contentsOf: fileURL)
    } catch {
        print("Error reading file:  \(error)")
    }
    
    return fileContent!
}

let text = open(fileName: "input2")
let stringValues = text.components(separatedBy: .newlines)

func main() {
    
    for (_, id1) in stringValues.enumerated() {
        let idLength = id1.count
        for (_, id2) in stringValues.enumerated() {
            var letterDif = 0
            var elementCount = 0
            
            while elementCount < idLength {
                if id1[elementCount] != id2[elementCount] {
                    letterDif += 1
                }
                
                if letterDif > 1 {
                    break
                }
                
                elementCount += 1
            }
            
            if letterDif == 1 {
                print("id1: \(id1) and id2 : \(id2)")
            }
        }
    }
}

extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
}

main()
