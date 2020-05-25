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
#Now for you to try and create the l in iOSClub with "for loop"+"if else"
Tips: You can run to see where the rol and col of Blocks are
*/
//#-editable-code
clearBlocks()
var color = #colorLiteral(red: 0.4235294118, green: 0.568627451, blue: 0.7607843137, alpha: 1)
createBlocks(row: 3, col: 4, color: color)
for i in 0 ... 9 {
    if i>=4 && i<=5{
        createBlocks(row: 3, col: i, color: color)
    }
}
for i in 0 ... 9 {
    if i == 5{
        createBlocks(row: 4, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if i == <#condition#> { //try Change to Other number
        createBlocks(row: 5, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if <#condition#> {
        createBlocks(row: 6, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if <#condition#> {
        createBlocks(row: 7, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if <#condition#> {
        createBlocks(row: 8, col: i, color: color)
        
    }
}
for i in 0 ... 9 {
    if i>=<#condition#>&&i<=<#condition#>
    {
        createBlocks(row: 9, col: i, color: color)
        
    }
}

//#-end-editable-code
//#-hidden-code
proxy.send(.integer(-1))

//#-end-hidden-code
