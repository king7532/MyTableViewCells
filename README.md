# MyTableViewCellsTests

### Title

UITextView display bug inside custom UITableViewCell but not in a custom UIView

rdar://

### Description

I have a custom UITableViewCell with a UITextView and using constraints to pin it to all 4 sides of the cell's contentView with an initial heigh of 21.  I am also key value observing the UITextView's `contentSize`, so when a user creates a new line (i.e. presses enter) or removes a line (i.e. backspacing to the previous line) I change the height of the UITextView to the new intrinsic height in my KVO callback.

However, the *same* UITextView code behaves differently in a custom UITableViewCell compared to a UIView.  In the UITableViewCell the first line of text scrolls out of view for every even line of text added but not every odd line!  This does not happen in the custo UIView.  See the screen shots:

![Odd Line - Good](https://github.com/king7532/MyTableViewCells/blob/master/OddLine-Good.png)
![Even Line - Bad](https://github.com/king7532/MyTableViewCells/blob/master/EvenLine-Bad.png)

### Steps to Reproduce

I have included a sample Xcode project called MyTableViewCells with 2 iOS targets:
* MyTableViewCells -- Contains a custom UITableViewCell called `BasicTextViewCell` that contains a UITextView with yellow background
* NoTable -- Contains a custom UIView called `ContainerView` that contains a UITextView with yellow background

### Expected Results

The UITextView should *not* scroll the first line of text out of view for each even line added.  UITextView should behave the same in a custom UIView or UITableViewCell.

### Actual Results

The first line of text scrolls out of view for every even line of text added but not every odd line.  This does not happen in the custom UIView.

### Version & Build

Deployment target iOS 8.3
* iOS Simulator - iPhone 6 with iOS 8.3 (12F69) - Xcode 6.3.2 (6D2105)
* iOS Device - iPhone 6 with iOS 8.3 (12F70)

Deployment target iOS 9.0 (beta) 
* iOS Simulator - iPhone 6 with iOS 9.0 (13A4254u) - Xcode 7.0 beta (7A120f)
