# square\_filling\_circle
Squares that fill up the area of a circle, inspired by the classic pi paradox (as the total area of the squares approaches the area of the circle, then surely the perimeter does so too, which would lead to pi=4). It uses a real beauty of an equation worked through by hand to find the intersection of a line with gradient 1 and a circle arc - 

    intercept = 0.5 * (sqrt(-a * a + 2 * a * (b + c - d) - b * b - 2 * b * c + 2 * b * d - c * c + 2 * c * d - d * d + 2 * r * r) + a + b + c - d) - c;

Here is a screenshot of it in action:

![screenshot](https://github.com/elterminad0r/square_filling_circle/blob/master/screenshot.png)
