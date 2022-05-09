import Scenes
import Igis
import Foundation
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */

class InteractionLayer : Layer, KeyDownHandler {
 
    let player = Player(rect:Rect(size:Size(width:50, height:50)))
    var defaultCanvasSize = Size()
    var playerPosition = 1
    var answer = "e"
    var winningSpot = 30
//    var popupSize = Size(width:10, height:100)
    var startOver = Bool(false)
    var response = "f"
    let questionBoard = QuestionBoard()
    var questionNumber = 1
    var correct = Bool(false)
    var startingX = 0
    var startingY = 0
    
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
            if(startOver) {
                questionBoard.popupWrong()
               // startOver = false
            }else {
            print("Popping up question 1")
            questionBoard.question1()
            }
        case 2:
            print("Popping up question 2")
            questionBoard.popupCorrect()
            sleep(2)     
            questionBoard.question2()
        case 3:
            print("Popping up question 3")
            questionBoard.question3()
        case 4:
            print("Popping up question 4")
            questionBoard.question4()
        case 5:
            print("Popping up question 5")
            questionBoard.question5()
        case 6:
            print("Popping up question 6")
            questionBoard.question6()
        case 7:
            print("Popping up question 7")
            questionBoard.question7()
        case 8:
            print("Popping up question 8")
            questionBoard.question8()
        case 9:
            print("Popping up question 9")
            questionBoard.question9()
        case 10:
            print("Popping up question 10")
            questionBoard.question10()
        case 11:
            print("Popping up question 11")
            questionBoard.question11()
        case 12:
            print("Popping up question 12")
            questionBoard.question12()
        case 13:
            print("Popping up question 13")
            questionBoard.question13()
        case 14:
            print("Popping up question 14")
            questionBoard.question14()
        case 15:
            print("Popping up question 15")
            questionBoard.question15()
        case 16:
            print("Popping up question 16")
            questionBoard.question16()
        case 17:
            print("Popping up question 17")
            questionBoard.question17()
        case 18:
            print("Popping up question 18")
            questionBoard.question18()
        case 19:
            print("Popping up question 19")
            questionBoard.question19()
        case 20:
            print("Popping up question 20")
            questionBoard.question20()
        case 21:
            print("Popping up question 21")
            questionBoard.question21()
        case 22:
            print("Popping up question 22")
            questionBoard.question22()
        case 23:
            print("Popping up question 23")
            questionBoard.question23()
        case 24:
            print("Popping up question 24")
            questionBoard.question24()
        case 25:
            print("Popping up question 25")
            questionBoard.question25()
        case 26:
            print("Popping up question 26")
            questionBoard.question26()
        case 27:
            print("Popping up question 27")
            questionBoard.question27()
        case 28:
            print("Popping up question 28")
            questionBoard.question28()
        case 29:
            print("Popping up question 29")
            questionBoard.question29()
        case 30:
            print("Popping up question 30")
            questionBoard.question30()
        case 31:
            questionBoard.popupWin()
        default:

            fatalError("Unexpected pattern: \(questionNumber)")

        } 
    
        //set answered flag back to false
      
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
        if(key == "a" || key == "b") {
   
            response = key
        
            checkAnswer(response:response)
        }
    }

    func checkAnswer(response:String) {
        var correct = questionBoard.checkAnswer(response:response)

        if(correct) {
            if(startOver) {
                startOver = false
                player.move(to:Point(x: startingX, y: startingY))
                start()
            }else {  
            //increment question and move player
            print("Question '\(questionNumber)' is correct")
            questionNumber = questionNumber + 1
            playerPosition = playerPosition + 1
     
            if(playerPosition == winningSpot) {
          
                start()
            }else{
                player.moveForward(playerPosition:playerPosition, canvasSize:defaultCanvasSize)
                start()
            }
            }
        }else{
            questionNumber = 1
            playerPosition = 1
            player.moveForward(playerPosition:playerPosition, canvasSize:defaultCanvasSize)
            startOver = true
            start()
            }
        
    }
       
    override func preSetup(canvasSize: Size, canvas: Canvas) {
        startingX = canvasSize.width/horizontal/2 - 50
        startingY = canvasSize.height/vertical/2 - 50
        player.move(to:Point(x: startingX, y: startingY))
        dispatcher.registerKeyDownHandler(handler: self)
        defaultCanvasSize = canvasSize
        print("setup canvas")
    }
    
    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }
}


