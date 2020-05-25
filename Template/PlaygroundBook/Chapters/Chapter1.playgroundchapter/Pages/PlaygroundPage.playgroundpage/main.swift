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
 ## CreateBlocks
 * Callout(Explanation):
 You can use Create Blocks to add blocks to understand if else, loops, and arrays

 ## What do I do?
 This page shows you how to use Create Blocks. You can try to change the row, col and color in it.
 * row：Change the row to decide the height of the Blocks (y-axis) from top to bottom.
 * col：Change the col to decide the left and right of the Blocks (x-axis) from left to right.
 * color : You can use UIColor to change the color, or you can click on the color square
 
 **Target：** Use `CreateBlocks` to fill the gray squares of iOSClub on the screen with colors.
 
- Example:
createBlocks(row: 3, col: 5, color: color)
Create a colored square in rol = 3 col = 5


- Note:
You can execute it a few times to see where the block is created
 
*/
//#-editable-code
clearBlocks()
var color = #colorLiteral(red: 0.4235294118, green: 0.568627451, blue: 0.7607843137, alpha: 1)
createBlocks(row: 3, col: 5, color: color)
createBlocks(row: 5, col: 4, color: color)
createBlocks(row: 5, col: 5, color: color)

createBlocks(row: 9, col: 4, color: color)

//#-end-editable-code
//#-hidden-code
proxy.send(.integer(-1))

//#-end-hidden-code
