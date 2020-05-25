//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
import PlaygroundSupport
import UIKit
let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

func createBlocks (row:Int,col:Int,color:UIColor)
{
//  usleep(350000)
  proxy.send(.integer((row*10+(col%10))%140))
  proxy.send(.string(color.description))
}
func clearBlocks ()
{
    proxy.send(.integer(-55688))
}
proxy.send(.integer(-55688))
//#-end-hidden-code
/*:
#Free painting
*/
//#-editable-code
clearBlocks()
var color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
for i in 0 ... 14 {
    for j in 0 ... 10 {
        createBlocks(row: i, col: j, color: color)
    }
}


//#-end-editable-code

