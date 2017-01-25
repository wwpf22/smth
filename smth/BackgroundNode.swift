import SpriteKit

//container for the background
public class BackgroundNode : SKNode {
    
    public func setup(size : CGSize) {
        
        let yPos : CGFloat = size.height * 0.10
        let startPoint = CGPoint(x: 0, y: yPos)
        let endPoint = CGPoint(x: size.width, y: yPos)
        
        physicsBody = SKPhysicsBody(edgeFrom: startPoint, to: endPoint)
        physicsBody?.restitution = 0.3 //  bouncy the floor
        
        physicsBody?.categoryBitMask = FloorCategory
        physicsBody?.contactTestBitMask = RainDropCategory

        
        // Create two SKSnapeNode that are rectangles
        let skyNode = SKShapeNode(rect: CGRect(origin: CGPoint(), size: size))
        skyNode.fillColor = SKColor(red:0.38, green:0.60, blue:0.65, alpha:1.0)
        skyNode.strokeColor = SKColor.clear
        skyNode.zPosition = 0
        
        let groundSize = CGSize(width: size.width, height: size.height * 0.5)
        let groundNode = SKShapeNode(rect: CGRect(origin: CGPoint(), size: groundSize))
        groundNode.fillColor = SKColor(red:0.99, green:0.5, blue:0.2, alpha:0.5)
        groundNode.strokeColor = SKColor.clear
        groundNode.zPosition = 1 // draw in front of the sky
        
        addChild(skyNode)
        addChild(groundNode)
        
        
    }
}
