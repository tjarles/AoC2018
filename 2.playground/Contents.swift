import UIKit
import PlaygroundSupport

var totalTwos = 0
var totalThrees = 0

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
    
    for (_, row) in stringValues.enumerated() {
        var twos = 0
        var threes = 0
        
        for letter in row {
            let occurrencies = row.filter { $0 == letter }.count
            
            if occurrencies == 2 {
                twos += 1
            } else if occurrencies == 3 {
                threes += 1
            }
            
        }
        
        if twos > 0 {
            totalTwos += 1
        }
        
        if threes > 0 {
            totalThrees += 1
        }
    }
    
    print("Twos: \(totalTwos) Threes: \(totalThrees)")
    print("Checksum: \(totalTwos * totalThrees)")

}

main()
