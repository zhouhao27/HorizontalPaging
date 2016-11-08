## Method 1

Create a overlayer UIView which cover the draggable area and implment the hitTest with a return of UIScrollView

## Method 2

Implement UIScrollViewDelegate to set the contentOffset based on the current position
