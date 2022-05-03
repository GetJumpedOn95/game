import Scenes
import Igis
import Foundation
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */

class QuestionBoard : RenderableEntity {
 
    var defaultCanvasSize = Size()
    var popupSize = Size(width:1000, height:600)
    var box : Rectangle
    var rect : Rect
    var text : Text
    var textString = ""
    var answer = "z"
    var didDraw = false

    init() {
       text = Text(location:Point(x:0, y:0), text:"")
        rect = Rect(topLeft:Point(x:0, y:0), size:Size(width:0, height:0))
        box = Rectangle(rect:rect)
       // Using a meaningful name can be helpful for debugging
        super.init(name: "QuestionBoard")
    }
    
    override func setup(canvasSize:Size, canvas:Canvas) {
        print("Setting canvasSize '\(canvasSize)'")
        //text = Text(location:Point(x:0, y:0), text:"")
        rect = Rect(topLeft:Point(x:defaultCanvasSize.center.x-500, y:defaultCanvasSize.center.y - 300), size:popupSize)
        box = Rectangle(rect:rect)      
        defaultCanvasSize = canvasSize
        print("in setup, defaultCanvasSize = '\(defaultCanvasSize)'")
    }

    func checkAnswer(response : String) -> Bool {
        if(response != answer) {
            popupWrong()
            sleep(2)
            return false
        }else{
            popupCorrect()
            sleep(2)
            return true
        }
    }

    func popupWin() {
        textString = "Congratulations! You Win!!"
        didDraw = false
    }

    func popupCorrect() {
        textString = "You move forward 1 space."
        didDraw = false
    }
    func popupWrong() {
        textString = "Sorry! You do not get to move forward"
        didDraw = false
    }
    func initialize() {
        print("in initialize defaultCanvasSize is '\(defaultCanvasSize)'")
        rect = Rect(topLeft:Point(x:defaultCanvasSize.center.x, y:defaultCanvasSize.center.y), size:popupSize)
        box = Rectangle(rect:rect)
        text = Text(location:Point(x:defaultCanvasSize.center.x - 300, y:defaultCanvasSize.center.y - 200), text:"")    
    }
    
    func question1() {
        print("Displaying question 1")
        textString = "Welcome to Oregon Dungeon. Do you enter the cave? Enter a for yes b for no."  
       
        //set answer
        answer = "a"
        didDraw = false
    }
    func question2() {
        textString = "When you enter the cave, there is a monster.  Do you a) talk to him b) run away c) sneak past d) laugh"
        answer = "c"
        didDraw = false
    }

    override func render(canvas:Canvas){
        if let defaultCanvasSize = canvas.canvasSize, !didDraw {
            // clearBox(canvas:canvas)
            //clear box
            let fillStyle = FillStyle(color:Color(.tan))
            let strokeStyle = StrokeStyle(color:Color(.black))
            let lineWidth = LineWidth(width:2) 
            rect =  Rect(topLeft:Point(x:defaultCanvasSize.center.x - 500, y:defaultCanvasSize.center.y - 300), size:popupSize) 
            box = Rectangle(rect:rect, fillMode:.clear)
            print("Displaying text '\(textString)'")
            canvas.render(strokeStyle,fillStyle, lineWidth, box)
       
        //canvas.render(strokeStyle, fillStyle, lineWidth, text, rectangle) 
        rect =  Rect(topLeft:Point(x:defaultCanvasSize.center.x - 500, y:defaultCanvasSize.center.y - 300), size:popupSize)
        box = Rectangle(rect:rect)
        print("rendering with canvasSize: '\(canvas.canvasSize)'")
        canvas.render(strokeStyle, fillStyle, lineWidth, box)
        text = Text(location:Point(x:defaultCanvasSize.center.x - 495, y:defaultCanvasSize.center.y - 250), text:textString)

        canvas.render(FillStyle(color:Color(.black)))
        text.font = "24pt Arial"
        canvas.render(text)
        didDraw = true
        }
    }
}


