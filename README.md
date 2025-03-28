# **3D Cube Rendering in Flutter**  

3D Cube Rendering is the process of drawing a cube on a 2D screen while simulating depth, rotation, and perspective to make it appear three-dimensional.  

## **How Does 3D Cube Rendering Work?**  

Rendering a 3D cube involves several steps:  

1. **Define 3D Vertices and Edges** (Cube Points).  
2. **Detect User Input** (Dragging to Rotate & Slider for Scaling): GestureDetector → onPanUpdate.  
3. **Apply Rotation to Each Point**.  
4. **Project 3D Points onto 2D Screen**.  
5. **Draw the Cube** (Connect the Points with Lines).  
6. **Final Interactive Behavior**.  

## **Notes**  

### **Properties**  
- **angleX**: A double value representing the angle of rotation around the **X-axis**.  
- **angleY**: A double value representing the angle of rotation around the **Y-axis**.  
- **scale**: A double value representing the **scale factor** for the cube.  
- **vertices**: A list of **8 vertices** representing the **8 corners** of the cube.  
- **edges**: A list of **12 edges** representing the **connections between the vertices**.  

### **Methods**  

1. **rotateX(point, angle)** → Rotates a **3D point** around the **X-axis** by a given angle.  
2. **rotateY(point, angle)** → Rotates a **3D point** around the **Y-axis** by a given angle.  
3. **paint(canvas, size)** → Paints the **cube on the canvas**.  
4. **shouldRepaint(oldDelegate)** → Returns true to indicate that the painter should be **repainted** when properties change.  

## **Paint Method Breakdown**  

1. **Creates a Paint object** with a purple color and a stroke width of `2`.  
2. **Calculates the center** of the canvas.  
3. **Maps each vertex** to a 2D point using rotateX() and rotateY(), then scales it.  
4. **Creates a list of `Offset` objects** representing the projected vertices.  
5. **Loops through each edge** and draws a line between the corresponding projected vertices using `drawLine()`.  

The rotateX() and rotateY() methods use **trigonometric functions (`sin`, `cos`)** to rotate the 3D points.  
The paint() method uses the **map()** function to transform **3D vertices to 2D points**, then loops through the edges to **draw the lines**.  
The shouldRepaint() method **returns `true`**, ensuring the painter updates whenever `angleX`, `angleY`, or `scale` changes. 
