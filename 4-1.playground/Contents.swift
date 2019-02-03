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

let text = open(fileName: "input4")
let stringValues = text.components(separatedBy: .newlines)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

func main() {
    for (_, row) in stringValues.enumerated() {
        let dateString = row.components(separatedBy: "]")[0].replacingOccurrences(of: "[", with: "")
        
        let date = dateFormatter.date(from: dateString)!
        print(date)
        
        
    }
}

main()



