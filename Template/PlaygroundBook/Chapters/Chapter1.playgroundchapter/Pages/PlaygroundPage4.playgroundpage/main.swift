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
 ## if else
 * Callout(Explanation):
 Will only be executed if the if is true
 Others execute “else” or not

 ## How to use?
 if condition {
     code
 }
 * condition：Here is true will be executed
 * If you want to compare is it the same, please use ==
 * code：Execute when true
  
 **Target：** Use `for`+`if`+`CreateBlocks` to fill the gray squares of iOSClub on the screen with colors.
 

- Note:
You can change the if to see where the block is created
 
*/

//#-editable-code
clearBlocks()
var color = #colorLiteral(red: 0.4235294118, green: 0.568627451, blue: 0.7607843137, alpha: 1)
for i in 0 ... 9 {
    if i>=3 && i<=5{
        createBlocks(row: 3, col: i, color: color)
    }
}
for i in 0 ... 9 {
    if i==2 || i == 6{
        createBlocks(row: 4, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if i==2 {
        createBlocks(row: 5, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if i==2 {
        createBlocks(row: 6, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if i==2 {
        createBlocks(row: 7, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if i==2 || i==6 {
        createBlocks(row: 8, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if i>=3&&i<=5
    {
        createBlocks(row: 9, col: i, color: color)
        
    }
}


//#-end-editable-code
//#-hidden-code
proxy.send(.integer(-1))

//#-end-hidden-code
