import Scenes
import Igis
import Foundation
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */

class InteractionLayer : Layer, KeyDownHandler {
 
    let player = Player(rect:Rect(size:Size(width:100, height:100)))
    var defaultCanvasSize = Size()
    var playerPosition = 1
    var answer = "e"
    var winningSpot = 30
    var popupSize = Size(width:10, height:100)
    var answered = Bool(false)
    var response = "f"
    let questionBoard = QuestionBoard()
    var questionNumber = 1
    var correct = Bool(false)
    
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Interaction")
        insert(entity: player, at: .front)
        insert(entity: questionBoard, at: .front)
        //questionBoard.initialize()
        start()
    }
    
    func start() {
        switch (questionNumber) {
        case 1:
            print("Popping up question 1")
            questionBoard.question1()
        case 2:
            print("Popping up question 2")
            questionBoard.question2()
    /*    case 3:

            canvas.render(pattern3)

        case 4:

            canvas.render(pattern4)

        case 5:

            canvas.render(pattern5)

        case 6:

            canvas.render(pattern6)

        case 7:

            canvas.render(pattern7)

        case 8:

            canvas.render(pattern8)

        case 9:

           canvas.render(pattern9)
*/
        default:

            fatalError("Unexpected pattern: \(questionNumber)")

        } 
    
        //set answered flag back to false
        answered = false
        correct = false
      /*  while(!correct) {
        question2(canvas:canvas)
        waitForAnswer()
        correct = checkAnswer(canvas:canvas)
        //set answered flag back to false
        answered = false
        }
       */
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {

        print("key: " + key + " code: " + code)
        if(key == "a" || key == "b" || key == "c" || key == "d") {
   
            response = key
        
            checkAnswer(response:response)
        }
    }

    func checkAnswer(response:String) {
        var correct = questionBoard.checkAnswer(response:response)

        if(correct) {
            //increment question and move player
            print("Question '\(questionNumber)' is correct")
            questionNumber = questionNumber + 1
            playerPosition = playerPosition + 1
            if(playerPosition == winningSpot) {
                questionBoard.popupWin()
            }else{
                player.moveForward(playerPosition:playerPosition, canvasSize:defaultCanvasSize)
                start()
            }
        }else{
            questionBoard.popupWrong()
            sleep(2)
            start()
        }
    }
       
    override func preSetup(canvasSize: Size, canvas: Canvas) {
        player.move(to:Point(x: 50, y: 50))
        dispatcher.registerKeyDownHandler(handler: self)
        defaultCanvasSize = canvasSize
        print("setup canvas")
    }
    
    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }
}


