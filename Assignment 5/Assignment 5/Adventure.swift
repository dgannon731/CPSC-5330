import Foundation

enum AdventureOutcome {
    case ongoing
    case success
    case failure
}

struct AdventureChoice {
    let title: String
    let nextNodeID: String
}

struct AdventureNode {
    let id: String
    let text: String
    let choices: [AdventureChoice]
    let outcome: AdventureOutcome
}

class AdventureGame {
    private(set) var currentNode: AdventureNode
    private let nodes: [String: AdventureNode]
    
    init() {
        let start = AdventureNode(
            id: "start",
            text: "You wake up in a dusty, dimly lit library. The main doors are locked. You see a glowing staircase going up and a dark hallway leading down.",
            choices: [
                AdventureChoice(title: "Go up the glowing staircase", nextNodeID: "upstairs"),
                AdventureChoice(title: "Walk down the dark hallway", nextNodeID: "downstairs")
            ],
            outcome: .ongoing
        )
        
        let upstairs = AdventureNode(
            id: "upstairs",
            text: "Upstairs, you find an old reading room with a large window and a strange, whispering bookshelf.",
            choices: [
                AdventureChoice(title: "Open the window", nextNodeID: "openWindow"),
                AdventureChoice(title: "Inspect the whispering bookshelf", nextNodeID: "whisperShelf")
            ],
            outcome: .ongoing
        )
        
        let downstairs = AdventureNode(
            id: "downstairs",
            text: "The hallway leads to the basement. You see a flickering lantern and a door marked 'Archives'.",
            choices: [
                AdventureChoice(title: "Take the lantern", nextNodeID: "lantern"),
                AdventureChoice(title: "Enter the Archives door", nextNodeID: "archives")
            ],
            outcome: .ongoing
        )
        
        let openWindow = AdventureNode(
            id: "openWindow",
            text: "You manage to force the window open and climb out. You escape into the night. You’re free!",
            choices: [],
            outcome: .success
        )
        
        let whisperShelf = AdventureNode(
            id: "whisperShelf",
            text: "The bookshelf comes alive and traps you between the pages. You’re stuck in a never-ending story.",
            choices: [],
            outcome: .failure
        )
        
        let lantern = AdventureNode(
            id: "lantern",
            text: "The lantern reveals a hidden passage with stairs leading up to the exit. You escape with a great story to tell.",
            choices: [],
            outcome: .success
        )
        
        let archives = AdventureNode(
            id: "archives",
            text: "The Archives lock behind you. The ghosts of librarians surround you, forcing you to re-shelve books forever.",
            choices: [],
            outcome: .failure
        )
        
        let allNodes: [String: AdventureNode] = [
            start.id: start,
            upstairs.id: upstairs,
            downstairs.id: downstairs,
            openWindow.id: openWindow,
            whisperShelf.id: whisperShelf,
            lantern.id: lantern,
            archives.id: archives
        ]
        
        self.nodes = allNodes
        self.currentNode = start
    }
    
    func chooseOption(at index: Int) {
        guard currentNode.outcome == .ongoing else { return }
        guard index >= 0 && index < currentNode.choices.count else { return }
        
        let nextID = currentNode.choices[index].nextNodeID
        if let nextNode = nodes[nextID] {
            currentNode = nextNode
        }
    }
    
    func reset() {
        if let startNode = nodes["start"] {
            currentNode = startNode
        }
    }
}
