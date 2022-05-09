import Igis
import Scenes

class Player: RenderableEntity {
    var rectangle: Rectangle
    var defaultMove = 200
    var vertical = 7
    var horiztonal = 10
    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)

        // Using a meaningful name can be helpful for debugging
        super.init(name: "Player")
    }

    override func render(canvas:Canvas) {
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width:2)
        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }

    func move(to point:Point) {
        rectangle.rect.topLeft = point
    }

    func startOver(canvasSize:Size) {
        var point = Point(x:50, y:50)
        rectangle.rect.topLeft = point
    }

    func moveForward(playerPosition:Int, canvasSize:Size) {
        //if playerPostition is < vertical moveDown
        if(playerPosition <= vertical ) {
            moveDown(canvasSize:canvasSize)
        //else if playerPosition is < vertical+horizontal move right
        }else if(playerPosition <= vertical + horizontal ) {
            moveRight(canvasSize:canvasSize)
        }else if(playerPosition <= vertical + horizontal + vertical ) {
            moveUp(canvasSize:canvasSize)
        }else{
            moveLeft(canvasSize:canvasSize)
        }
    }
    
    func moveDown(canvasSize:Size) {
        //Save existing points
        defaultMove = canvasSize.height/7
     
        var newY = rectangle.rect.topLeft.y
    
        //If the paddle will not go out of bounds, add defaultmove
        if(newY + defaultMove <= canvasSize.height) {
            newY = rectangle.rect.topLeft.y + defaultMove
        }
        var point = Point(x:rectangle.rect.topLeft.x, y:newY)      
        rectangle.rect.topLeft = point
    }
   

    func moveUp(canvasSize:Size) {
        defaultMove = canvasSize.height/7 
        var newY = rectangle.rect.topLeft.y
        //If the paddle will not go out of bounds, add defaultmove
        if(newY - defaultMove >= 0) {
            newY = rectangle.rect.topLeft.y - defaultMove
        }
        var point = Point(x:rectangle.rect.topLeft.x, y:newY)
        rectangle.rect.topLeft = point  
    }

    func moveRight(canvasSize:Size) {
        defaultMove = canvasSize.width/10
        var newX = rectangle.rect.topLeft.x
        //If the paddle will not go out of bounds, add defaultmove
        if(newX + defaultMove <= canvasSize.width) {
            newX = rectangle.rect.topLeft.x + defaultMove
        }
        var point = Point(x:newX, y:rectangle.rect.topLeft.y)
        rectangle.rect.topLeft = point
    }

    func moveLeft(canvasSize:Size) {
        defaultMove = canvasSize.width/10 
        var newX = rectangle.rect.topLeft.x
        //If the paddle will not go out of bounds, add defaultmove
        if(newX - defaultMove >= 0) {
            newX = rectangle.rect.topLeft.x - defaultMove
        } else {
            newX = 0
        }
        var point = Point(x:newX, y:rectangle.rect.topLeft.y)
        rectangle.rect.topLeft = point
    } 
    
}
