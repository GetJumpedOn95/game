import Scenes
import Igis
import Foundation
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class QuestionBoard : RenderableEntity {
 
    var defaultCanvasSize = Size()
    var popupSize = Size(width:700, height:400)
    var box : Rectangle
    var rect : Rect
    var text : Text
    var textString = ""
    var textStrings = [String]()
    var answer = "z"
    var didDraw = false
    var isQuestionOne = true
    
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
        rect = Rect(topLeft:Point(x:defaultCanvasSize.center.x-350, y:defaultCanvasSize.center.y - 200), size:popupSize)
        box = Rectangle(rect:rect)      
        defaultCanvasSize = canvasSize
        print("in setup, defaultCanvasSize = '\(defaultCanvasSize)'")
    }
    func initialize() {
        print("in initialize defaultCanvasSize is '\(defaultCanvasSize)'")
        rect = Rect(topLeft:Point(x:defaultCanvasSize.center.x, y:defaultCanvasSize.center.y), size:popupSize)
        box = Rectangle(rect:rect)
        text = Text(location:Point(x:defaultCanvasSize.center.x - 300, y:defaultCanvasSize.center.y - 200), text:"")
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
        clearText()   
        textString = "Congratulations! You Win!!"
        textStrings.append(textString);
        didDraw = false
    }

    func popupCorrect() {
        clearText()
        print("in popupCorrect")
        textString = "You move forward 1 space."
        textStrings.append(textString);
        didDraw = false
        sleep(1)
        didDraw = false
    }
    
    func popupWrong() {
        clearText()  
        textString = "Sorry! You lose.  Better luck next time!"
        textStrings.append(textString);
        textString = "Do you want to retry?"
        textStrings.append(textString);
        textString = "Enter a for yes b for no."
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    
    func question1() {
        clearText() 
        print("Displaying question 1")
        textString = "Question 1"
        textStrings.append(textString);
        textString = "Welcome to Oregon Dungeon. "
        textStrings.append(textString);
        textString = "Do you enter the cave?"
        textStrings.append(textString);
        textString = "Enter a for yes b for no."
        textStrings.append(textString);
        //set answer
        answer = "a"
        isQuestionOne = true
        didDraw = false
    }
    func question2() {
        clearText()
        textString = "Question 2"
        textStrings.append(textString); 
        textString = "When you enter the cave, "
        textStrings.append(textString);
        textString = "there is a monster."
        textStrings.append(textString);
        textString = "Do you a) talk to him or b) run past him"
        textStrings.append(textString);
        answer = "b"
        isQuestionOne = false
        didDraw = false
    }
    func question3() {
        clearText()
        textString = "Question 3"
        textStrings.append(textString);
        textString = "After running away from the monster "
        textStrings.append(textString);
        textString = "you come across a suspicious hole."
        textStrings.append(textString);
        textString = "Do you a) jump into the hole "
        textStrings.append(textString);
        textString = "or b) ignore the hole"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    func question4() {
        clearText()
        textString = "Question 4"
        textStrings.append(textString);
        textString = "You go into the hole and find yourself "
        textStrings.append(textString);
        textString = "in a forest with a switch next to you."
        textStrings.append(textString);
        textString = "Do you a) flip the switch or"
        textStrings.append(textString); 
        textString = "b) ignore the switch"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question5() {
        clearText()
        textString = "Question 5"
        textStrings.append(textString); 
        textString = "You keep going and get hungry, "
        textStrings.append(textString);
        textString = "you find a mushroom in the forest."
        textStrings.append(textString);
        textString = "Do you a) eat the mushroom or "
        textStrings.append(textString);
        textString = "b) ignore the mushroom"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question6() {
        clearText()
        textString = "Question 6"
        textStrings.append(textString); 
        textString = "You find a promising looking chest."
        textStrings.append(textString);
        textString = "Do you a) open the chest or"
        textStrings.append(textString);
        textString = "b) leave the chest alone"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    func question7() {
        clearText()
        textString = "Question 7"
        textStrings.append(textString);  
        textString = "You got a compass which pointed"
        textStrings.append(textString);
        textString = "you to a portal."
        textStrings.append(textString);
        textString = "Do you a) go through the portal"
        textStrings.append(textString);
        textString = "or b) ignore it"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
   
    func question8() {
        clearText()
        textString = "Question 8"
        textStrings.append(textString);  
        textString = "You are back in the cave and see "
        textStrings.append(textString);
        textString = "a key protected by a single guard."
        textStrings.append(textString);
        textString = "Do you a) steal the key or "
        textStrings.append(textString);
        textString = "b) sneak past the guard"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    func question9() {
        clearText()
        textString = "Question 9"
        textStrings.append(textString);
        textString = "You took the key and while sprinting"
        textStrings.append(textString);
        textString = "way you see a secret passage."
        textStrings.append(textString);
        textString = "Do you a) take it or b) ignore it"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    func question10() {
        clearText()
        textString = "Question 10"
        textStrings.append(textString); 
        textString = "In the maze you see two paths."
        textStrings.append(textString);
        textString = "Do you a) go left or b) go right"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    func question11() {
        clearText()
        textString = "Question 11"
        textStrings.append(textString);  
        textString = "Out of the maze you are back in "
        textStrings.append(textString);
        textString = "the dungeon behind a skeleton."
        textStrings.append(textString);
        textString = "Do you a) attack the skeleton"
        textStrings.append(textString);
        textString = "or b) leave it"
        textStrings.append(textString);
        answer = "a"
        didDraw = false

    }
    
    func question12() {
        clearText()
        textString = "Question 12"
        textStrings.append(textString);  
        textString = "As you progress you step on "
        textStrings.append(textString);
        textString = "a pressure plate!"
        textStrings.append(textString);
        textString = "Do you a) run away or b) stay put"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question13() {
        clearText()
        textString = "Question 13"
        textStrings.append(textString);    
        textString = "You notice a pleasant looking green"
        textStrings.append(textString);
        textString = "tinted potion on the ground."
        textStrings.append(textString);
        textString = "Do you a) drink it or b) leave it"
        textStrings.append(textString);
        answer = "a"
        didDraw = false

    }
    func question14() {
        clearText()
        textString = "Question 14"
        textStrings.append(textString);  
        textString = "You see a gooey creature on all fours"
        textStrings.append(textString);
        textString = "walking towards you excitedly."
        textStrings.append(textString);
        textString = "Do you a) let it join you b) abandon it"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    func question15() {
        clearText()
        textString = "Question 15"
        textStrings.append(textString);  
        textString = "You have a bad feeling about "
        textStrings.append(textString);
        textString = "the hallway ahead."
        textStrings.append(textString);
        textString = "Do you a) go ahead or "
        textStrings.append(textString);
        textString = "b) make the creature go ahead"
        textStrings.append(textString);
        answer = "b"
        didDraw = false

    }
    func question16() {
        clearText()
        textString = "Question 16"
        textStrings.append(textString); 
        textString = "As you continue you hear a strange "
        textStrings.append(textString);
        textString = "sound approaching, its a boulder!"
        textStrings.append(textString);
        textString = "Do you a) run or b) stay put"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question17(){
        clearText()
        textString = "Question 17"
        textStrings.append(textString);
        textString = "You wake up in a dark room."
        textStrings.append(textString);
        textString = "Do you a) look for a light source or "
        textStrings.append(textString);
        textString = "b) feel around the room"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    
    func question18() {
        clearText()
        textString = "Question 18"
        textStrings.append(textString);         
        textString = "You walk in the cave with your torch"
        textStrings.append(textString);
        textString = "and the gooey creature tugs at you."
        textStrings.append(textString);
        textString = "Do you a) follow it or"
        textStrings.append(textString);
        textString = "b) continue in the same direction"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    func question19() {
        clearText()
        textString = "Question 19"
        textStrings.append(textString); 
        textString = "You end up in a room with 5 figures."
        textStrings.append(textString);
        textString = "Do you a) try to escape or b) wait"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question20() {
        clearText()
        textString = "Question 20"
        textStrings.append(textString); 
        textString = "One steps forward and asks"
        textStrings.append(textString);
        textString = "'Why have you come here?'. "
       textStrings.append(textString);
        textString = "Do you a) reply or b) stay quiet"
        textStrings.append(textString);
        answer = "a"
        didDraw = false

    }
    func question21() {
        clearText()
        textString = "Question 21"
        textStrings.append(textString);   
        textString = "The figure looks at the others and"
        textStrings.append(textString);
        textString = "says 'Then you shall have it',"
        textStrings.append(textString);
        textString = "you are uncuffed and the figure"
        textStrings.append(textString);
        textString = "jumps down to you."
        textStrings.append(textString);
        textString = "Do you a) punch it "
        textStrings.append(textString);
         textString = "or b) do nothing"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    func question22() {
        clearText()
        textString = "Question 22"
        textStrings.append(textString); 
        textString = "The figure pins you to the wall."
        textStrings.append(textString);
        textString = "Do you go a) go for its eyes"
        textStrings.append(textString);
         textString = "or b) give in"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }
    func question23() {
        clearText()
        textString = "Question 23"
        textStrings.append(textString); 
        textString = "The figure is occupied."
        textStrings.append(textString);
        textString = "Do you a) run away or b) fight back"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question24() {
        clearText()
        textString = "Question 24"
        textStrings.append(textString);          
        textString = "The figure is knocked down."
        textStrings.append(textString);
        textString = "Do you a) kick it to keep it down"
        textStrings.append(textString);
        textString = "b) let it get back up"
        textStrings.append(textString);
        answer = "a"
        didDraw = false
    }

    func question25() {
        clearText()
        textString = "Question 25"
        textStrings.append(textString);  
        textString = "The figure is stunned and reeling."
        textStrings.append(textString);
        textString = "Do you a) rush past the other 4 or"
        textStrings.append(textString);
        textString = "b) stay to beat the other figure"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question26(){
        clearText()
        textString = "Question 26"
        textStrings.append(textString);         
        textString = "The figure stands up and "
        textStrings.append(textString);
        textString = "begins rapidly expanding!"
        textStrings.append(textString);
        textString = "Do you a) give up or "
        textStrings.append(textString);
        textString = "b) hold your ground"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question27() {
        clearText()
        textString = "Question 27"
        textStrings.append(textString);  
        textString = "The goo creature expands too,"
        textStrings.append(textString);
        textString = "covering the dark figure."
        textStrings.append(textString);
        textString = "Do you a) stop the creature"
        textStrings.append(textString);
        textString = "from saving you"
        textStrings.append(textString);
        textString = "or b) let it protect you"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question28() {
        clearText()
        textString = "Question 28"
        textStrings.append(textString);  
        textString = "The figure explodes, "
        textStrings.append(textString);
        textString = "killing the goo creature. "
        textStrings.append(textString);
        textString = "Do you a) give up or "
        textStrings.append(textString);
        textString = "b) continue despite the "
        textStrings.append(textString);
        textString = "loss of your companion"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func question29() {
        clearText()
        textString = "Question 29"
        textStrings.append(textString);    
        textString = "The other figures make "
        textStrings.append(textString)
        textString = "a way for you to pass."
        textStrings.append(textString);
        textString = "Do you a) fight them too or"
        textStrings.append(textString);
        textString = "b) spare them and continue on"
        answer = "b"
        didDraw = false
    }
    func question30 () {
        clearText()
        textString = "Question 30"
        textStrings.append(textString);   
        textString = "You finally end up at the treasure."
        textStrings.append(textString);
        textString = "Do you a) open it or "
        textStrings.append(textString);
        textString = "b) think about the goo creature"
        textStrings.append(textString);
        answer = "b"
        didDraw = false
    }
    func clearText() {
        textString = ""
        textStrings.removeAll();
    }
    override func render(canvas:Canvas){
        if let defaultCanvasSize = canvas.canvasSize, !didDraw {
            let fillStyle = FillStyle(color:Color(.tan))
            let strokeStyle = StrokeStyle(color:Color(.black))
            let lineWidth = LineWidth(width:2)
            rect =  Rect(topLeft:Point(x:defaultCanvasSize.center.x - 350, y:defaultCanvasSize.center.y - 200), size:popupSize)
            box = Rectangle(rect:rect, fillMode:.clear)
            canvas.render(strokeStyle,fillStyle, lineWidth, box)          
/*            if(!isQuestionOne) {
                //Pop up correct
                var correctLine = "Correct! You move forward 1 space."
                rect =  Rect(topLeft:Point(x:defaultCanvasSize.center.x - 350, y:defaultCanvasSize.center.y - 200), size:popupSize)
                box = Rectangle(rect:rect)
       
                rect =  Rect(topLeft:Point(x:defaultCanvasSize.center.x - 350, y:defaultCanvasSize.center.y - 200), size:popupSize) 
                box = Rectangle(rect:rect, fillMode:.clear)
            
                canvas.render(strokeStyle,fillStyle, lineWidth, box)
  
                canvas.render(FillStyle(color:Color(.black)))
                text = Text(location:Point(x:defaultCanvasSize.center.x - 345, y:defaultCanvasSize.center.y - 150), text:correctLine)
                text.font = "30pt Arial"
                canvas.render(text)
                sleep(2)

                //clear box
                rect =  Rect(topLeft:Point(x:defaultCanvasSize.center.x - 350, y:defaultCanvasSize.center.y - 200), size:popupSize)
                box = Rectangle(rect:rect, fillMode:.clear)
                canvas.render(strokeStyle,fillStyle, lineWidth, box)  
                }
                */
 
        //canvas.render(strokeStyle, fillStyle, lineWidth, text, rectangle) 
        rect =  Rect(topLeft:Point(x:defaultCanvasSize.center.x - 350, y:defaultCanvasSize.center.y - 200), size:popupSize)
        box = Rectangle(rect:rect)
        print("rendering with canvasSize: '\(canvas.canvasSize)'")
        canvas.render(strokeStyle, fillStyle, lineWidth, box)

        //Write the text 
        var yOffset = 150
        let textLines = textStrings.count
        var counter = 0 
        print("TextLines = '\(textLines)'")
        while counter < textLines {
            var textLine = textStrings[counter]
            canvas.render(FillStyle(color:Color(.black)))
            print("Displaying text '\(textLine)'")    
            text = Text(location:Point(x:defaultCanvasSize.center.x - 345, y:defaultCanvasSize.center.y - yOffset), text:textLine)    
            text.font = "30pt Arial" 
            canvas.render(text)
            yOffset = yOffset - 50
            counter = counter + 1
        }
        didDraw = true
        }
    }
}


