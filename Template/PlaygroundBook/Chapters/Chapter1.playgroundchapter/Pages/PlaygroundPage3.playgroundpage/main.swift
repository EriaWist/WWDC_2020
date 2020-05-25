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
  usleep(350000)
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
 #Now for you to try and create the S in iOSClub with "for loop"
 Tips: You can run to see where the rol and col of Blocks are
 */
//#-editable-code
clearBlocks()
var color = #colorLiteral(red: 0.4235294118, green: 0.568627451, blue: 0.7607843137, alpha: 1)
for i in 1 ... 4 {
    createBlocks(row: 3, col: 2+i, color: color)
}
for i in 1 ...  2 {
    createBlocks(row: 3+i, col: 2, color: color)
}
for i in 1 ...  <#condition#> {//try Change to Other number
    createBlocks(row: 6, col: 2+i, color: color)
}
for i in 1 ...  <#condition#> {
    createBlocks(row: 6+i, col: 6, color: color)
}
for i in 1 ...  <#condition#> {
    createBlocks(row: 9, col: 1+i, color: color)
}


//#-end-editable-code
//#-hidden-code
proxy.send(.integer(-1))

//#-end-hidden-code
