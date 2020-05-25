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
 ## for loop
 * Callout(Explanation):
 You can use for loop to repeatedly execute code including CreateBlocks.

 ## How to use?
 for i in 1 ... number {
     code
 }
 * i：i represents the current number of runs and will refer to the following numbers to determine the start and end numbers.
 * in："in" the back represents the beginning and ending numbers
 * code：Code that will be executed every time
 * number：From 1 to number
 
  
 **Target：** Use `for`+`CreateBlocks` to fill the gray squares of iOSClub on the screen with colors.
 
- Example:
for i in 1 ... 10
 {
    createBlocks(row: 3, col: i, color: color)
 }
Create a colored square in rol = 3 and col = Every 1,2,3,4,5,6,7,8,9,10


- Note:
You can change the for number to see where the block is created
 
*/

//#-editable-code
clearBlocks()
var color = #colorLiteral(red: 0.4235294118, green: 0.568627451, blue: 0.7607843137, alpha: 1)
for i in 1 ... 4 {
    createBlocks(row: 3, col: 2+i, color: color)
}
for i in 1 ... 5 {
    createBlocks(row: 3+i, col: 2, color: color)
    
    createBlocks(row: 3+i, col: 7, color: color)
}
for i in 1 ... <#condition#> { //try Change to number 4
    createBlocks(row: 9, col: 2+i, color: color)
}

//#-end-editable-code
//#-hidden-code
proxy.send(.integer(-1))

//#-end-hidden-code
