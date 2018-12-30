import UIKit
import PlaygroundSupport

var freq = 0
var freqSet = Set<Int>()
var duplicate: Int?

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

let text = open(fileName: "input1-1")
let stringValues = text.components(separatedBy: .newlines)
func main() {
    
    for (_, value) in stringValues.enumerated() {
        if freqSet.contains(freq) {
            duplicate = freq
            print("Duplicate: \(freq)")
            break
        }
        
        freqSet.insert(freq)
        freq += Int(value)!
    }
    
    if duplicate == nil {
        main()
    }
}

main()
