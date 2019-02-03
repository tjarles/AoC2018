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

let text = open(fileName: "input3")
let stringValues = text.components(separatedBy: .newlines)

func main() {
    var fabric = [[Int]](repeating: [Int](repeating: Int(), count: 1300), count: 1300)
    var takenInch = 0
    
    for (_, claim) in stringValues.enumerated() {
        let claimArray = claim.components(separatedBy: " ")
        let claimID = Int(claimArray[0].components(separatedBy: ",")[0].replacingOccurrences(of: "#", with: ""))!
        let claimStartX = Int(claimArray[2].components(separatedBy: ",")[0])!
        let claimStartY = Int(claimArray[2].components(separatedBy: ",")[1].replacingOccurrences(of: ":", with: ""))!
        let claimWidth = Int(claimArray[3].components(separatedBy: "x")[0])!
        let claimHeight = Int(claimArray[3].components(separatedBy: "x")[1])!
        
        for spanWidth in 1...claimWidth {
            for spanHeight in 1...claimHeight {
                let fabricPosX = spanWidth + claimStartX
                let fabricPosY = spanHeight + claimStartY
                
                if fabric[fabricPosX][fabricPosY] != 0 {
                    if fabric[fabricPosX][fabricPosY] != 2000 {
                        takenInch += 1
                    }
                    fabric[fabricPosX][fabricPosY] = 2000
                } else {
                    fabric[fabricPosX][fabricPosY] = claimID
                }
            }
        }
    }
    print(takenInch)
}

main()



