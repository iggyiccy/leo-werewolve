// TODO how to randomly assign roles to addresses?
circuit AssignRoles(player: [address]) -> Self{
    werewolve: address, 
    villager: address, 
    healer: address, 

    function assign(werewolve: address, villager: address, healer: address) ->  Self {
        return Self {werewolve, villager, healer};
    }
}

// TODO do we have events? 
circuit Game(player: [address], started: bool) -> bool {
    players: AssignRoles(player), // TODO can it be a list of player addresses? 
    started: bool, 
    healed: bool,
    killed: bool,
    dead: bool, 
    winner: bool,

    function play_game() {
        if role == werewolve { 
            killing();
        } else if role == healer {
            healing();           
        } 
    }

    function healing() { 
        for i in 0..player { 
            if healed == true {
                is_healed = is_healed + 1; 
            }         
        }
    }

    function killing() { 
        for i in 0..player {
            if killed == true && healed == false {
                dead = true; 
            } else if killed == true && headled == true {
                dead = false; 
            } else {
                dead = false; 
            }
        }           
    }

    function count_vote() { 
        for i in 0..player {
            if voted == true {
                player_voted = player_voted + 1; 
            }
        }       
    }

    function vote() {
        for i in 0..player { 
            count_vote();
        }
    }

    // TODO How to set requirements? If?
    function start_game() {
        if started == false {
            // TODO Is there a shortcut to count number of players in an array? I am not sure what I am doing here.
            for i in 0..player { 
                play_game();
                vote();
            } return next_round; // TODO first make sense of the other functions... 
        }
    }
}

function main(something: bool) ->  bool {
    return something;
}

// Output values from the main function are fed to a file_name.out file. Note that the registers
// to be written to need to be prepared at the bottom of the .in file however.
// We also create a few other files, such as the proving/verifying key, and the proof itse

//! Why not see if you can alter the input and outputs to this programme? Make it take in 3 inputs
//! and have 2 outputs.