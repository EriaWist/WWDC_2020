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
 ## Nested loop and && ||
 * Callout(Explanation):
 For more advanced usage, you can try to observe
 The inner for loop will be executed first and then run to the outer loop

 ## How to use?
 and &&
 or  ||
  
 **Target：** Use `for`+`if`+`CreateBlocks` to fill the gray squares of iOSClub on the screen with colors.
 

- Note:
You can change the if to see where the block is created
 
*/
//#-editable-code
clearBlocks()
var color = #colorLiteral(red: 0.4235294118, green: 0.568627451, blue: 0.7607843137, alpha: 1)
for i in 0 ... 14 {
    for j in 0 ... 9 {
        if (i==4||i==5||i==6||i==7)&&(j==7||j==3) {
            createBlocks(row: i, col: j, color: color)
        } else if i==7&&j==6 {
            createBlocks(row: i, col: j, color: color)
        } else if i==8&&(j==4||j==5||j==7){
            createBlocks(row: i, col: j, color: color)
        }
    }
    
}
//#-end-editable-code
//#-hidden-code
proxy.send(.integer(-1))

//#-end-hidden-code
