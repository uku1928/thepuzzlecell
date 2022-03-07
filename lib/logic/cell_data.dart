part of logic;

var defaultCellSize = 40;
var cellSize = defaultCellSize.toDouble();
var wantedCellSize = defaultCellSize;

final cells = [
  "empty",
  "place",
  "wall",
  "ghost",
  "mover",
  "puller",
  "grabber",
  "liner",
  "bird",
  "releaser",
  "fan",
  "wormhole",
  "generator",
  "generator_cw",
  "generator_ccw",
  "triplegen",
  "constructorgen",
  "crossgen",
  "physical_gen",
  "replicator",
  "tunnel",
  "stopper",
  "push",
  "slide",
  "rotator_cw",
  "rotator_ccw",
  "opposite_rotator",
  "gear_cw",
  "gear_ccw",
  "karl",
  "darty",
  "mirror",
  "enemy",
  "trash",
  "puzzle",
  "lock",
  "unlock",
  "key",
  "flag",
  "antipuzzle",
  "pmerge",
  "mech_gear",
  "mech_gen",
  "trash_puzzle",
  "mover_puzzle",
  "mech_mover",
  "pixel",
  "displayer",
  "mech_puller",
  "mech_grabber",
  "mech_fan",
  "mech_trash",
  "cross_mech_gear",
  "speed",
  "and_gate",
  "or_gate",
  "xor_gate",
  "not_gate",
  "nand_gate",
  "nor_gate",
  "xnor_gate",
  "onedir",
  "twodir",
  "threedir",
  "rotator_180",
  "redirector",
  "vacuum",
  "ant_cw",
  "ant_ccw",
  "driller",
  "silent_trash",
  "supgen",
  "supgen_cw",
  "supgen_ccw",
  "triple_supgen",
  "cross_supgen",
  "constructor_supgen",
  "super_mirror",
  "tunnel_cw",
  "tunnel_ccw",
  "triple_tunnel",
  "dual_tunnel",
  "warper",
  "warper_cw",
  "warper_ccw",
  "fast",
  "slow",
  "fast_mover",
  "slow_mover",
  "rotatable",
  "blue_place",
  "red_place",
  "yellow_place",
  "mobile_trash",
  "weight",
  "opposite_replicator",
  "cross_replicator",
  "physical_replicator",
  "triple_rep",
  "quad_rep",
  "semi_trash",
  "semi_enemy",
  "transformer",
  "transformer_cw",
  "transformer_ccw",
  "triple_transformer",
  "physical_gen_cw",
  "physical_gen_ccw",
  "axis",
  "bringer",
  "slow_puller",
  "fast_puller",
  "auto_flag",
  "anchor",
  "physical_trash",
  "physical_enemy",
  "hungry_trash",
];

Map<String, String> textureMap = {
  'mover.png': 'movers/movers/mover.png',
  'puller.png': 'movers/pullers/puller.png',
  'speed.png': 'movers/movers/speed.png',
  'grabber.png': 'movers/grabber.png',
  'bird.png': 'movers/movers/bird.png',
  'liner.png': 'movers/combos/liner.png',
  'gear_cw.png': 'movers/gear_cw.png',
  'gear_ccw.png': 'movers/gear_ccw.png',
  'push.png': 'push/push.png',
  'slide.png': 'push/slide.png',
  'rotator_cw.png': 'rotators/rotator_cw.png',
  'rotator_ccw.png': 'rotators/rotator_ccw.png',
  'opposite_rotator.png': 'rotators/opposite_rotator.png',
  'onedir.png': 'push/onedir.png',
  'twodir.png': 'push/twodir.png',
  'threedir.png': 'push/threedir.png',
  'rotator_180.png': 'rotators/rotator_180.png',
  'redirector.png': 'rotators/redirector.png',
  'vacuum.png': 'movers/pullers/vacuum.png',
  'ant_cw.png': 'movers/ant_cw.png',
  'ant_ccw.png': 'movers/ant_ccw.png',
  'driller.png': 'movers/driller.png',
  'silent_trash.png': 'destroyers/silent_trash.png',
  'supgen.png': 'recreators/supgens/supgen.png',
  'supgen_cw.png': 'recreators/supgens/supgen_cw.png',
  'supgen_ccw.png': 'recreators/supgens/supgen_ccw.png',
  'triple_supgen.png': 'recreators/supgens/triple_supgen.png',
  'cross_supgen.png': 'recreators/supgens/cross_supgen.png',
  'constructor_supgen.png': 'recreators/supgens/constructor_supgen.png',
  'generator.png': 'recreators/generators/generator.png',
  'generator_cw.png': 'recreators/generators/generator_cw.png',
  'generator_ccw.png': 'recreators/generators/generator_ccw.png',
  'trash.png': 'destroyers/trash.png',
  'replicator.png': 'recreators/replicators/replicator.png',
  'constructorgen.png': 'recreators/generators/constructorgen.png',
  'triplegen.png': 'recreators/generators/triplegen.png',
  'crossgen.png': 'recreators/generators/crossgen.png',
  'physical_gen.png': 'recreators/generators/physical_gen.png',
  'puzzle.png': 'puzzle/puzzle.png',
  'antipuzzle.png': 'puzzle/antipuzzle.png',
  'lock.png': 'puzzle/lock.png',
  'unlock.png': 'puzzle/unlock.png',
  'trash_puzzle.png': 'puzzle/trash_puzzle.png',
  'mover_puzzle.png': 'puzzle/mover_puzzle.png',
  'key.png': 'puzzle/key.png',
  'flag.png': 'puzzle/flag.png',
  'pmerge.png': 'puzzle/pmerge.png',
  'mirror.png': 'movers/mirrors/mirror.png',
  'super_mirror.png': 'movers/mirrors/super_mirror.png',
  'tunnel.png': 'recreators/tunnels/tunnel.png',
  'tunnel_cw.png': 'recreators/tunnels/tunnel_cw.png',
  'tunnel_ccw.png': 'recreators/tunnels/tunnel_ccw.png',
  'dual_tunnel.png': 'recreators/tunnels/dual_tunnel.png',
  'triple_tunnel.png': 'recreators/tunnels/triple_tunnel.png',
  'warper.png': 'recreators/tunnels/warpers/warper.png',
  'warper_cw.png': 'recreators/tunnels/warpers/warper_cw.png',
  'warper_ccw.png': 'recreators/tunnels/warpers/warper_ccw.png',
  'curve.png': 'curves/curve.png',
  'curve_straight.png': 'curves/curve_straight.png',
  'cross_straight_curve.png': 'curves/cross_straight_curve.png',
  'cross_curve.png': 'curves/cross_curve.png',
  'slow.png': 'movers/movers/slow.png',
  'fast.png': 'movers/movers/fast.png',
  'slow_mover.png': 'movers/movers/slow_mover.png',
  'fast_mover.png': 'movers/movers/fast_mover.png',
  'fan.png': 'movers/movers/fan.png',
  'releaser.png': 'movers/movers/releaser.png',
  'place.png': 'backgrounds/place.png',
  'red_place.png': 'backgrounds/red_place.png',
  'blue_place.png': 'backgrounds/blue_place.png',
  'yellow_place.png': 'backgrounds/yellow_place.png',
  'rotatable.png': 'backgrounds/rotatable.png',
  'mobile_trash.png': 'destroyers/mobile_trash.png',
  'weight.png': 'push/weight.png',
  'opposite_replicator.png': 'recreators/replicators/opposite_replicator.png',
  'cross_replicator.png': 'recreators/replicators/cross_rep.png',
  'physical_replicator.png': 'recreators/replicators/physical_rep.png',
  'triple_rep.png': 'recreators/replicators/triple_rep.png',
  'quad_rep.png': 'recreators/replicators/quad_rep.png',
  'semi_trash.png': 'destroyers/semi_trash.png',
  'semi_enemy.png': 'destroyers/semi_enemy.png',
  'transformer.png': 'recreators/transformers/transformer.png',
  'transformer_cw.png': 'recreators/transformers/transformer_cw.png',
  'transformer_ccw.png': 'recreators/transformers/transformer_ccw.png',
  'triple_transformer.png': 'recreators/transformers/triple_transformer.png',
  'physical_gen_cw.png': 'recreators/generators/physical_gen_cw.png',
  'physical_gen_ccw.png': 'recreators/generators/physical_gen_ccw.png',
  'axis.png': 'movers/combos/axis.png',
  'bringer.png': 'movers/combos/bringer.png',
  'fast_puller.png': 'movers/pullers/fast_puller.png',
  'slow_puller.png': 'movers/pullers/slow_puller.png',
  'auto_flag.png': 'puzzle/auto_flag.png',
  'anchor.png': 'unique/anchor.png',
  'physical_trash.png': 'destroyers/physical_trash.png',
  'physical_enemy.png': 'destroyers/physical_enemy.png',
  'hungry_trash.png': 'destroyers/hungry_trash.png',
};

class CellProfile {
  String title;
  String description;

  CellProfile(this.title, this.description);
}

class CellCategory {
  String title;
  String description;
  String look;
  List items;
  bool opened = false;
  int max;

  CellCategory(this.title, this.description, this.items, this.look,
      {this.max = 3});
}

final categories = [
  CellCategory(
    "Base",
    "Base cells",
    [
      "empty",
      CellCategory(
        "Push Cells",
        "Cells that are only special in how they get pushed",
        [
          "push",
          "slide",
          "onedir",
          "twodir",
          "threedir",
          "mobile_trash",
          "weight",
        ],
        "push",
        max: 3,
      ),
      "wall",
      "ghost",
      CellCategory(
        "Placeables",
        "Also called backgrounds, they are behind cells and determine the behavior when in puzzle mode",
        ["place", "yellow_place", "blue_place", "red_place", "rotatable"],
        "place",
        max: 3,
      ),
    ],
    "ghost",
  ),
  CellCategory(
    "Movers",
    "Cells that move themselves or other cells",
    [
      CellCategory(
        "Movers",
        "They move forwards, pushing what is in front",
        [
          "mover",
          "slow_mover",
          "fast_mover",
          "speed",
          "slow",
          "fast",
          "bird",
          "releaser",
          "fan",
        ],
        "mover",
        max: 3,
      ),
      CellCategory(
        "Pullers",
        "Variants of the puller",
        ["puller", "slow_puller", "fast_puller", "vacuum"],
        "puller",
      ),
      "grabber",
      "driller",
      CellCategory(
        "Combinations",
        "Combinations of the base movers",
        ["liner", "axis", "bringer"],
        "liner",
      ),
      CellCategory(
        "Mirrors",
        "Swaps cells around",
        ["mirror", "super_mirror"],
        "mirror",
      ),
      "gear_cw",
      "gear_ccw",
      "ant_cw",
      "ant_ccw",
      "anchor",
    ],
    "mover",
  ),
  CellCategory(
    "Recreators",
    "Cells that copy other cells",
    [
      CellCategory(
        "Generators",
        "They copy whats behind towards where the arrow is facing",
        [
          "generator",
          "generator_cw",
          "generator_ccw",
          "triplegen",
          "constructorgen",
          "crossgen",
          "physical_gen",
          "physical_gen_cw",
          "physical_gen_ccw",
        ],
        "generator",
        max: 6,
      ),
      CellCategory(
        "Super Generators",
        "Generators taken to the next level",
        [
          "supgen",
          "supgen_cw",
          "supgen_ccw",
          "triple_supgen",
          "cross_supgen",
          "constructor_supgen",
        ],
        "supgen",
      ),
      CellCategory(
        "Replicators",
        "They recreate the cell in front of them, in front of them",
        [
          "replicator",
          "cross_replicator",
          "opposite_replicator",
          "triple_rep",
          "quad_rep",
          "physical_replicator",
        ],
        "replicator",
      ),
      CellCategory(
        "Tunnels",
        "Move cells from the back to the front",
        [
          "tunnel",
          "tunnel_cw",
          "tunnel_ccw",
          "dual_tunnel",
          "triple_tunnel",
          "warper",
          "warper_cw",
          "warper_ccw",
        ],
        "tunnel",
        max: 5,
      ),
      CellCategory(
        "Transformers",
        "They transform the cell in front of them into a copy of the cell behind them",
        [
          "transformer",
          "transformer_cw",
          "transformer_ccw",
          "triple_transformer",
        ],
        "transformer",
      )
    ],
    "generator",
  ),
  CellCategory(
    "Rotators",
    "Cells that rotate other cells",
    [
      "rotator_cw",
      "rotator_ccw",
      "rotator_180",
      "redirector",
      "opposite_rotator",
    ],
    "rotator_cw",
  ),
  CellCategory(
    "Unique Cells",
    "Special cells",
    [
      "stopper",
      CellCategory(
        "Destroyers",
        "They destroy other cells",
        [
          "enemy",
          "semi_enemy",
          "trash",
          "silent_trash",
          "semi_trash",
          "mobile_trash",
          "hungry_trash",
          "physical_trash",
          "physical_enemy",
        ],
        "trash",
      ),
      "wormhole",
      "karl",
      "darty",
      "anchor",
    ],
    "trash",
  ),
  CellCategory(
    "Mechanical Cells",
    "Cells that use mechanical gears and interactions to process data",
    [
      "mech_gear",
      "cross_mech_gear",
      "mech_gen",
      "mech_mover",
      "mech_puller",
      "mech_grabber",
      "mech_fan",
      "pixel",
      "displayer",
      "mech_trash",
      CellCategory(
        "Logic Gates",
        "They take inputs and throw an output based off of a logical operation",
        [
          "and_gate",
          "or_gate",
          "xor_gate",
          "not_gate",
          "nand_gate",
          "nor_gate",
          "xnor_gate",
        ],
        "and_gate",
        max: 3,
      ),
    ],
    "mech_gear",
  ),
  CellCategory(
    "Puzzle Cells",
    "Cells made to be used when making puzzles",
    [
      "puzzle",
      "antipuzzle",
      "pmerge",
      "lock",
      "key",
      "flag",
      "auto_flag",
    ],
    "puzzle",
  ),
];

final defaultProfile = CellProfile("Unnamed", "No description available");

String profileToMessage(CellProfile profile) {
  return "${profile.title} - ${profile.description}";
}

final cellInfo = <String, CellProfile>{
  "empty": CellProfile(
    "Empty",
    "Placing it will erase what was before it. You can also right click to achieve the same effect",
  ),
  "wall": CellProfile("Wall", "Can't be moved"),
  "ghost": CellProfile("Ghost Wall", "Can't be moved or generated"),
  "place": CellProfile(
    "Placeable",
    "Allows the player to pick up the cell on top of this and place it on other placeable tiles",
  ),
  "mover": CellProfile("Mover", "Moves forward, and it can also push forward"),
  "puller": CellProfile(
    "Puller",
    "Moves forward, unable to push, but instead pulls all cells behind it",
  ),
  "grabber": CellProfile(
    "Grabber",
    "Moves forward, unable to push, grabs everything on its sides",
  ),
  "liner": CellProfile(
    "Liner",
    "It pushes the front and pulls the back, basically puller + pusher",
  ),
  "bird": CellProfile(
    "Bird",
    "It flies around and does its thing, its a bird after all",
  ),
  "releaser": CellProfile(
    "Releaser",
    "A mover, except if a cell is in front of it, it stops it from updating. If it is stopped from moving ,it will allow the catched cell to update again",
  ),
  "fan": CellProfile(
    "Fan",
    "It pushes away everything in front of it",
  ),
  "wormhole": CellProfile(
    "Wormhole",
    "When wrap around is enabled, any cell that falls in will be spawned on the opposite side of the map. Can be buggy. It destroys the incoming cell if wrap mode is disabled",
  ),
  "generator": CellProfile(
    "Generator",
    "Generates the cell behind it in front of it",
  ),
  "generator_cw": CellProfile(
    "Generator CW",
    "Generates the cell behind it in the right of it, applying rotation based on that",
  ),
  "generator_ccw": CellProfile(
    "Generator CCW",
    "Generates the cell behind it in the left of it, appyling rotation based on that",
  ),
  "triplegen": CellProfile(
    "Triple Generator",
    "Basically Generator, Generator CW and Generator CCW combined as one",
  ),
  "constructorgen": CellProfile(
    "Constructor",
    "Triple generator except also generates the cell behind it front-left and front-right to it with no applied rotation",
  ),
  "crossgen": CellProfile(
    "Cross Generator",
    "Two generators perpendicular to eachother stacked as one",
  ),
  "replicator": CellProfile(
    "Replicator",
    "Generates the cell in front of it... in front of it.",
  ),
  "karl": CellProfile(
    "Karl",
    "It will try to avoid any cells it sees unless if it is a wall, as it is chemosynthetic and thus eats rocks. It can also self-replicate",
  ),
  "darty": CellProfile(
    "Darty",
    "Moves forward, if it can push the cell in front it eats it and replicates, if it cant push it, it turns goes in another direction",
  ),
  "floppy": defaultProfile,
  "push": CellProfile(
    "Push",
    "Can be pushed from any sides",
  ),
  "slide": CellProfile(
    "Slide",
    "Can only be pushed from the sides parallel to the 2 white lines",
  ),
  "rotator_cw": CellProfile(
    "Rotator CW",
    "Rotates all the cells touching it clockwise",
  ),
  "rotator_ccw": CellProfile(
    "Rotator CCW",
    "Rotates all the cells touching it counter-clockwise",
  ),
  "gear_cw": CellProfile(
    "Gear CW",
    "Spins the cells touching it around itself clockwise",
  ),
  "gear_ccw": CellProfile(
    "Gear CCW",
    "Spins the cells touching it around itself counter-clockwise",
  ),
  "mirror": CellProfile(
    "Mirror",
    "Swaps the cells the arrows are pointing to, if movable",
  ),
  "enemy": CellProfile(
    "Enemy",
    "When something moves into it, it dies and so does the thing going into it",
  ),
  "trash": CellProfile(
    "Trash",
    "When something moves into it, the thing moving into it dies, but the trash cell remains",
  ),
  "puzzle": CellProfile(
    "Puzzle",
    "It's you! Can be moved with the arrow keys when the game is running, when it moves a cell it is touching it \"interacts\" with it",
  ),
  "key": CellProfile(
    "Key",
    "Can be picked up by player using interaction",
  ),
  "lock": CellProfile(
    "Lock",
    "Cant be moved, except if the player has a key when interacting with it, in which case it unlocks itself and becomes pushable",
  ),
  "flag": CellProfile(
    "Flag",
    "When a puzzle cell interacts with it, if there are no enemy cells on the grid, triggers a win",
  ),
  "antipuzzle": CellProfile(
    "Anti-Puzzle",
    "Can be pushed by any cell except the puzzle cell",
  ),
  "tunnel": CellProfile(
    "Tunnel",
    "Moves the cell from the back to the front instantly",
  ),
  "physical_gen": CellProfile(
    "Physical Generator",
    "Like a generator except, if it cant move whats in front of it, it tries to move backwards to generate the cell",
  ),
  "pmerge": CellProfile(
    "PuzzleMerge™",
    "Using the latest quantum Sci-Fi stuff, we can combine specific cells with your puzzle cell to give it special stuff",
  ),
  "sync": CellProfile(
    "Sync Cell",
    "If you move or rotate it, it also moves or rotates all the other sync cells",
  ),
  "opposite_rotator": CellProfile(
    "Opposite Rotator",
    "On one side we have a Rotator CW, on the opposite side a Rotator CCW, and inbetween, nothing",
  ),
  "stopper": CellProfile(
    "Stopper",
    "Stops the cell in front of it from updating",
  ),
  "mech_mover": CellProfile(
    "Mechanically Powered Mover",
    "Only moves if it has been powered mechanically",
  ),
  "mech_gear": CellProfile(
    "Mechanical Gear",
    "Can carry mechanical energy via it's spin",
  ),
  "mech_gen": CellProfile(
    "Constant Mechanical Generator",
    "This cell breaks the laws of physics and generates a constant stream of mechanical energy",
  ),
  "pixel": CellProfile(
    "WiFi Pixel",
    "Turns on if powered using WiFi Displayer",
  ),
  "displayer": CellProfile(
    "WiFi Displayer",
    "When powered sends WiFi signal to the WiFi Pixel in front of it from any distance",
  ),
  "mech_puller": CellProfile(
    "Mechanically Powered Puller",
    "Only pulls if it has been powered mechanically",
  ),
  "mech_grabber": CellProfile(
    "Mechanically Powered Grabber",
    "Only grabs if it has been powered mechanically",
  ),
  "mech_fan": CellProfile(
    "Mechanically Powered Fan",
    "Only pushes if it has been powered mechanically",
  ),
  "mech_trash": CellProfile(
    "Trash-Based Mechanical Generator",
    "Generates mechanical signals around it whenever it eats a cell",
  ),
  "cross_mech_gear": CellProfile(
    "Cross Mechanical Gear",
    "It's like two gears stacked on top of eachother",
  ),
  "and_gate": CellProfile(
    "AND Gate",
    "Takes 2 inputs and outputs the result of their AND operation",
  ),
  "or_gate": CellProfile(
    "OR Gate",
    "Takes 2 inputs and outputs the result of their OR operation",
  ),
  "xor_gate": CellProfile(
    "XOR Gate",
    "Takes 2 inputs and outputs the result of their XOR operation",
  ),
  "not_gate": CellProfile(
    "NOT Gate",
    "Takes 1 input and outputs the opposite of that input",
  ),
  "nand_gate": CellProfile(
    "NAND Gate",
    "Takes 2 inputs and outputs the opposite result of their AND operation",
  ),
  "nor_gate": CellProfile(
    "NOR Gate",
    "Takes 2 inputs and outputs the opposite result of their OR operation",
  ),
  "xnor_gate": CellProfile(
    "XNOR Gate",
    "Takes 2 inputs and outputs the opposite result of their XOR operation",
  ),
  "rotator_180": CellProfile(
    "180 Degree Rotator",
    "Rotates the cells around it 180 degrees",
  ),
  "redirector": CellProfile(
    "Redirector",
    "Makes the cell in front of it have the same rotation as the redirector",
  ),
  "vacuum": CellProfile(
    "Vacuum",
    "Pulls the cell 2 tiles in front of it forwards",
  ),
  "onedir": CellProfile(
    "One Directional",
    "Half of a slide cell",
  ),
  "twodir": CellProfile(
    "Two Directional",
    "Can only be pushed backwards and downwards",
  ),
  "threedir": CellProfile(
    "Three Directional",
    "You likely get the point by now",
  ),
  "ant_cw": CellProfile(
    "Wheel CW",
    "It spins, and that moves it",
  ),
  "ant_ccw": CellProfile(
    "Wheel CCW",
    "It spins, and that moves it",
  ),
  "driller": CellProfile(
    "Driller",
    "It moves forward, and if a cell is in front of it, it will swap that cell with itself",
  ),
  "speed": CellProfile(
    "Speed",
    "Moves forward but can't push",
  ),
  "silent_trash": CellProfile(
    "Silent Trash Cell",
    "Trash Cell except does not make an noise",
  ),
  "supgen": CellProfile(
    "Super Generator",
    "Generates the entire row behind it in front of it",
  ),
  "supgen_cw": CellProfile(
    "Super Generator CW",
    "Generates the entire row behind it on its right",
  ),
  "supgen_ccw": CellProfile(
    "Super Generator CCW",
    "Generates the entire row behind it on its left",
  ),
  "cross_supgen": CellProfile(
    "Cross Super Generator",
    "2 Super Generators orthogonal to eachother stacked on top of one another",
  ),
  "triple_supgen": CellProfile(
    "Triple Super Generator",
    "Generates the entire row behind it on its left, right and front",
  ),
  "constructor_supgen": CellProfile(
    "Super Constructor",
    "Superior version of the constructor",
  ),
  "super_mirror": CellProfile(
    "Super Mirror",
    "Like a mirror, but swaps rows instead of just cells",
  ),
  "tunnel_cw": CellProfile(
    "Tunnel CW",
    "A tunnel curved clockwise",
  ),
  "tunnel_ccw": CellProfile(
    "Tunnel CCW",
    "A tunnel curved counter-clockwise",
  ),
  "dual_tunnel": CellProfile(
    "Dual Tunnel",
    "Tunnels the cell behind it into 2 positions by breaking physics",
  ),
  "triple_tunnel": CellProfile(
    "Triple Tunnel",
    "Dual Tunnel + Tunnel. Breaks physics even more",
  ),
  "warper": CellProfile(
    "Warper",
    "A stackable tunnel. It behaves like a tunnel, but if more warpers are but in front of it, it will tunnel it in their front",
  ),
  "warper_cw": CellProfile(
    "Warper CW",
    "A warper bent clockwise",
  ),
  "warper_ccw": CellProfile(
    "Warper CCW",
    "A warper bent counter-clockwise",
  ),
  "fast": CellProfile(
    "Fast",
    "Speed but moves 2x as fast",
  ),
  "slow": CellProfile(
    "Slow",
    "Speed but moves once every 2 ticks",
  ),
  "blue_place": CellProfile(
    "Blue Placeable",
    "Allows the player to pick up the cell on top of this and place it on other blue placeable tiles",
  ),
  "red_place": CellProfile(
    "Red Placeable",
    "Allows the player to pick up the cell on top of this and place it on other red placeable tiles",
  ),
  "yellow_place": CellProfile(
    "Yellow Placeable",
    "Allows the player to pick up the cell on top of this and place it on other yellow placeable tiles",
  ),
  "rotatable": CellProfile(
    "Rotatable",
    "When a player clicks on a rotatable tile, it rotates the cell",
  ),
  "slow_mover": CellProfile(
    "Slow Mover",
    "Mover that moves every 2 ticks",
  ),
  "fast_mover": CellProfile(
    "Fast Mover",
    "Mover that moves twice every tick",
  ),
  "mobile_trash": CellProfile(
    "Mobile Trash",
    "It can be moved, but when moved, the cell in front of it will die",
  ),
  "weight": CellProfile(
    "Weight",
    "A push cell but with a mass of 1. This means it can stop 1 mover, but 2 would still push it",
  ),
  "cross_replicator": CellProfile(
    "Cross Replicator",
    "Like the cross generator but replicators",
  ),
  "opposite_replicator": CellProfile(
    "Opposite Replicator",
    "2 replicators opposite of eachother stacked as one",
  ),
  "triple_rep": CellProfile(
    "Triple Replicator",
    "3 replicators for the price of one",
  ),
  "quad_rep": CellProfile(
    "Quad Replicator",
    "4-way Replicator",
  ),
  "physical_replicator": CellProfile(
    "Physical Replicator",
    "Like the physical generator, but caused way more bugs",
  ),
  "transformer": CellProfile(
    "Transformer",
    "This cell is quite over-powered. It will turn the cell in front of it into the cell behind it.",
  ),
  "transformer_cw": CellProfile(
    "Transformer CW",
    "Transformer bent clockwise",
  ),
  "transformer_ccw": CellProfile(
    "Transformer CCW",
    "Transformer bent counter-clockwise",
  ),
  "triple_transformer": CellProfile(
    "Triple Transformer",
    "Transformer + Transformer CW + Transformer CCW",
  ),
  "semi_enemy": CellProfile(
    "Semi Enemy",
    "Half Enemy, Half Push",
  ),
  "semi_trash": CellProfile(
    "Semi Trash",
    "Half Trash, Half Push",
  ),
  "auto_flag": CellProfile(
    "AutoFlag",
    "Automatically triggers a win if there are no enemies, no locks and no keys left",
  ),
  "axis": CellProfile(
    "Axis",
    "Grabber + Puller + Mover",
  ),
  "bringer": CellProfile(
    "Bringer",
    "Grabber + Driller",
  ),
  "physical_gen_cw": CellProfile(
    "Physical Generator CW",
    "Physical Generator bent clockwise",
  ),
  "physical_gen_ccw": CellProfile(
    "Physical GeneratorC CW",
    "Physical Generator bent counter-clockwise",
  ),
  "fast_puller": CellProfile(
    "Fast Puller",
    "Puller but moves 2x as fast",
  ),
  "slow_puller": CellProfile(
    "Slow Puller",
    "Puller but moves once every 2 ticks",
  ),
  "anchor": CellProfile(
    "Anchor",
    "When rotated, will rotate the structure touching it. Anchored rotators also stop rotating mid-execution to avoid bugs",
  ),
  "hungry_trash": CellProfile(
    "Hungry Trash",
    "Will go for cells around it to eat. Can eat anything. It splits for each axis it has to move. If there is food on opposite sides it cancels itself out",
  ),
  "physical_trash": CellProfile(
    "Physical Trash",
    "If something moves into it by pushing, it will push on the opposite side.",
  ),
  "physical_enemy": CellProfile(
    "Physical Enemy",
    "Enemy variant of physical trash",
  ),
};
