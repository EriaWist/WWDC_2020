//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  A source file which is part of the auxiliary module named "BookCore".
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import PlaygroundSupport

@objc(BookCore_LiveViewController)

public class LiveViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {

    @IBOutlet weak var CollectionView: UICollectionView!
    var colorArrary:[Int:UIColor] = [:] //實際方塊排版
    var colorQA:[Int:UIColor] = [:] //預設方塊排版為
    var colorA:[Int:UIColor] = [:] //答案確認
    var nowQA = 0 //現在是第幾頁
    var vab = 0 //選取第幾個方塊
    var masseg = ""
    var massegArr:[String] = [
        """
    createBlocks(row: 3, col: 5, color: color)\n
    createBlocks(row: 5, col: 4, color: color)\n
    createBlocks(row: 5, col: 5, color: color)\n
    createBlocks(row: 6, col: 5, color: color)\n
    createBlocks(row: 7, col: 5, color: color)\n
    createBlocks(row: 8, col: 5, color: color)\n
    createBlocks(row: 9, col: 4, color: color)\n
    createBlocks(row: 9, col: 5, color: color)\n
    createBlocks(row: 9, col: 6, color: color)\n
""","""
for i in 1 ... 4 {\n
    createBlocks(row: 3, col: 2+i, color: color)\n
}\n
for i in 1 ... 5 {\n
    createBlocks(row: 3+i, col: 2, color: color)\n
    createBlocks(row: 3+i, col: 7, color: color)\n
}\n
for i in 1 ... 4 { //try Change to number 4\n
    createBlocks(row: 9, col: 2+i, color: color)\n
}\n
""","""
for i in 1 ... 4 {\n
    createBlocks(row: 3, col: 2+i, color: color)\n
}\n
for i in 1 ...  2 {\n
    createBlocks(row: 3+i, col: 2, color: color)\n
}\n
for i in 1 ...  3 {//try Change to Other number\n
    createBlocks(row: 6, col: 2+i, color: color)\n
}\n
for i in 1 ...  2 {\n
    createBlocks(row: 6+i, col: 6, color: color)\n
}\n
for i in 1 ...  4 {\n
    createBlocks(row: 9, col: 1+i, color: color)\n
}\n
""","""
for i in 0 ... 9 {\n
    if i>=3 && i<=5{\n
        createBlocks(row: 3, col: i, color: color)\n
    }\n
}\n
for i in 0 ... 9 {\n
    if i==2 || i == 6{\n
        createBlocks(row: 4, col: i, color: color)\n
    }\n
}\n
for i in 0 ... 9 {\n
    if i==2 {\n
        createBlocks(row: 5, col: i, color: color)\n
    }\n
}\n
for i in 0 ... 9 {\n
    if i==2 {\n
        createBlocks(row: 6, col: i, color: color)\n
    }\n
}\n
for i in 0 ... 9 {\n
    if i==2 {\n
        createBlocks(row: 7, col: i, color: color)\n
    }\n
}\n
for i in 0 ... 9 {\n
    if i==2 || i==6 {\n
        createBlocks(row: 8, col: i, color: color)\n
    }\n
}\n
for i in 0 ... 9 {\n
    if i>=3&&i<=5\n
    {\n
        createBlocks(row: 9, col: i, color: color)\n
    }\n
}\n
""","""
for i in 0 ... 9 {\n
    if i>=4 && i<=5{\n
        createBlocks(row: 3, col: i, color: color)\n
    }\n
}\n
for i in 0 ... 9 {\n
    if i == 5{\n
        createBlocks(row: 4, col: i, color: color)\n
        
    }\n
}\n
for i in 0 ... 9 {\n
    if i == 5 { //try Change to Other number\n
        createBlocks(row: 5, col: i, color: color)\n
        
    }\n
}\n
for i in 0 ... 9 {\n
    if i == 5 {\n
        createBlocks(row: 6, col: i, color: color)\n
        
    }\n
}\n
for i in 0 ... 9 {\n
    if i == 5 {\n
        createBlocks(row: 7, col: i, color: color)\n
        
    }\n
}\n
for i in 0 ... 9 {\n
    if i == 5 {\n
        createBlocks(row: 8, col: i, color: color)\n
        
    }\n
}\n
for i in 0 ... 9 {\n
    if i>=4&&i<=6\n
    {\n
        createBlocks(row: 9, col: i, color: color)\n
        
    }\n
}\n
""","""
for i in 0 ... 14 {\n
    for j in 0 ... 9 {\n
        if (i==4||i==5||i==6||i==7)&&(j==7||j==3) {\n
            createBlocks(row: i, col: j, color: color)\n
        } else if i==7&&j==6 {\n
            createBlocks(row: i, col: j, color: color)\n
        } else if i==8&&(j==4||j==5||j==7){\n
            createBlocks(row: i, col: j, color: color)\n
        }\n
    }\n
    
}\n
""","""
for i in 0 ... 14 {\n
    for j in 0 ... 9 {\n
        if\n (i==4||i==5||i==6||i==7||i==8||i==9||i==10)&&(j==3) {\n
            createBlocks(row: i, col: j, color: color)\n
        } else if i==6 && (j==5||j==6) {\n
            createBlocks(row: i, col: j, color: color)\n
        }else if i==7&&(j==7||j==4) {\n
            createBlocks(row: i, col: j, color: color)\n
        } else if i==8&&(j==7){\n
            createBlocks(row: i, col: j, color: color)\n
        } else if i==9&&j==7 {\n
            createBlocks(row: i, col: j, color: color)\n
        } else if i==10&&j<=6&&j>=3 {\n
            createBlocks(row: i, col: j, color: color)\n
        }\n
    }\n
    
}\n
"""]
    public override func viewDidLoad() {
        switch nowQA {
        case 1:
            colorQA=[35:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),54:#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0),55:#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0),65:#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0),75:#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0),85:#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0),95:#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0),94:#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0),96:#colorLiteral(red: 0.803921568627451, green: 0.803921568627451, blue: 0.803921568627451, alpha: 1.0)]
            colorArrary=colorQA
            masseg=massegArr[nowQA-1]
            break
        case 2:
            colorQA = [33:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),34:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),35:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),36:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),42:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),47:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),52:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),57:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),62:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),67:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),72:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),77:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),82:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),87:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),93:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),94:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),95:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),96:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
            colorArrary = colorQA
            masseg=massegArr[nowQA-1]
            break
        case 3:
            colorQA = [33:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),34:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),35:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),36:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),42:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),52:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),63:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),64:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),65:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),76:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),86:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),93:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),94:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),95:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),92:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
            colorArrary = colorQA
            masseg=massegArr[nowQA-1]
            break
        case 4:
            colorQA = [33:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),34:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),35:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),42:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),46:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),52:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),62:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),72:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),82:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),86:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),94:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),95:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),93:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
            colorArrary = colorQA
            masseg=massegArr[nowQA-1]
            break
        case 5:
        colorQA = [34:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),35:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),45:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),55:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),65:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),75:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),85:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),94:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),95:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),96:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
        colorArrary = colorQA
        masseg=massegArr[nowQA-1]
        break
        case 6:
            colorQA = [43:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),47:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),53:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),57:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),63:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),67:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),73:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),76:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),77:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),84:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),85:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),87:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
            colorArrary = colorQA
            masseg=massegArr[nowQA-1]
            break
        case 7:
            colorQA = [43:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),53:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),73:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),63:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),65:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),66:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),74:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),77:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),83:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),93:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),97:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),87:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),103:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),104:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),105:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),106:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
        colorArrary = colorQA
            masseg=massegArr[nowQA-1]
        break
        default:
            break
        }
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 140
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
                cell.backgroundColor = colorArrary[indexPath.row]
            
            // Configure the cell
        
            return cell
    }
    
    /*
    public func liveViewMessageConnectionOpened() {
        // Implement this method to be notified when the live view message connection is opened.
        // The connection will be opened when the process running Contents.swift starts running and listening for messages.
    }
    */

    /*
    public func liveViewMessageConnectionClosed() {
        // Implement this method to be notified when the live view message connection is closed.
        // The connection will be closed when the process running Contents.swift exits and is no longer listening for messages.
        // This happens when the user's code naturally finishes running, if the user presses Stop, or if there is a crash.
    }
    */

    public func receive(_ message: PlaygroundValue) {
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
        switch message {
        case .string(let a):
            let b = a.components(separatedBy: " ")
            colorArrary[vab] = UIColor(red: CGFloat(Float(b[1])!), green: CGFloat(Float(b[2])!), blue: CGFloat(Float(b[3])!), alpha: CGFloat(Float(b[4])!))
            CollectionView.reloadData()
            
            break
        case .integer(let i):
            if i>=0 {
                vab = i
                colorA[i]=#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) //儲存比對答案
            }else if i == -55688
            {
                colorArrary.removeAll()
                colorA.removeAll()
                colorArrary = colorQA
                CollectionView.reloadData()
            }
            else if i == -1
            {
                if colorA.hashValue == colorQA.hashValue
                {
                    PlaygroundPage.current.assessmentStatus = .pass(message: "**Excenllent!** you are great [Next Page](@next)")
                }
                else
                {
                    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Fill all gray Blocks with colors"], solution:
                    masseg)
                }
            }
            
            break

        default:
            break
        }
    }
}
