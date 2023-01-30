part of scripts;

class ModInfo {
  String title;
  String desc;
  String author;
  String icon;
  Directory dir;
  Set<String> cells;
  String? readme;

  ModInfo(this.title, this.desc, this.author, this.icon, this.dir, this.cells, this.readme);
}

class ScriptingManager {
  final directory = Directory(path.join(assetsPath, 'mods'));

  List<LuaScript> luaScripts = [];

  Map<String, List<void Function(String)>> channels = {};

  void createChannel(String id) {
    channels[id] ??= [];
  }

  void sendToChannel(String id, String data) {
    channels[id]?.forEach((fn) => fn(data));
  }

  bool hasChannel(String id) => channels.containsKey(id);

  void listenToChannel(String id, void Function(String) callback) {
    if (!hasChannel(id)) createChannel(id);

    channels[id]!.add(callback);
  }

  void loadScripts([List<String> blocked = const []]) {
    if (!Directory('dlls').existsSync()) return;
    final subitems = directory.listSync();
    final subdirs = subitems.where((e) => e is Directory).cast<Directory>();

    for (var subdir in subdirs) {
      final id = path.split(subdir.path).last;

      if (!blocked.contains(id)) {
        final luaFile = File(path.join(subdir.path, 'main.lua'));

        if (luaFile.existsSync()) {
          luaScripts.add(LuaScript(subdir));
        }
      }
    }
  }

  Set<String> getScripts() {
    final luas = luaScripts.map((e) => e.id);
    final arrows = [];

    return {...luas, ...arrows};
  }

  final loaded = <String>{};

  List<void Function()> postInit = [];

  Future<void> initScripts() async {
    if (!Directory('dlls').existsSync()) return;

    LuaState.loadLibLua(
      windows: 'dlls/lua54.dll',
      linux: 'dlls/liblua54.so',
      macos: 'dlls/liblua52.dylib',
    );
    for (var script in luaScripts) {
      loaded.add(script.id);
      await script.init();
    }

    while (postInit.isNotEmpty) {
      postInit.removeAt(0)();
    }

    return;
  }

  void OnMsg(String id, String msg) {
    for (var script in luaScripts) {
      if (script.id == id) {
        script.OnMsg(msg);
      }
    }
  }

  int addedForce(Cell cell, int dir, int force, MoveType moveType) {
    final id = cell.id;
    final side = toSide(dir, cell.rot);
    for (var lua in luaScripts) {
      if (lua.definedCells.contains(id)) {
        return lua.addedForceModded(cell, dir, force, side, moveType.name) ?? 0;
      }
    }

    return 0;
  }

  bool moveInsideOf(Cell into, int x, int y, int dir, int force, MoveType mt) {
    for (var lua in luaScripts) {
      if (lua.definedCells.contains(into.id)) {
        return lua.moveInsideOfModded(into, x, y, dir, force, mt.name) ?? false;
      }
    }

    return false;
  }

  void handleInside(int x, int y, int dir, int force, Cell moving, MoveType mt) {
    final destroyer = grid.at(x, y);
    for (var lua in luaScripts) {
      if (lua.definedCells.contains(destroyer.id)) {
        return lua.handleInsideModded(x, y, dir, force, moving, mt.name);
      }
    }
  }

  bool acidic(Cell cell, int dir, int force, MoveType mt, Cell melting, int mx, int my) {
    for (var lua in luaScripts) {
      if (lua.definedCells.contains(cell.id)) {
        return lua.isAcidicModded(cell, dir, force, mt.name, melting, mx, my) ?? false;
      }
    }

    return false;
  }

  void handleAcid(Cell cell, int dir, int force, MoveType mt, Cell melting, int mx, int my) {
    for (var lua in luaScripts) {
      if (lua.definedCells.contains(cell.id)) {
        return lua.handleAcidModded(cell, dir, force, mt.name, melting, mx, my);
      }
    }
  }

  void addToCat(String cat, String cell) {
    final parts = cat.split('/');

    CellCategory? current;

    while (parts.isNotEmpty) {
      if (current == null) {
        final found = categories.where((cat) => cat.title == parts.first);
        if (found.isEmpty) {
          return;
        }
        current = found.first;
      } else {
        final found = current.items.where((cat) => cat is CellCategory && cat.title == parts.first);
        if (found.isEmpty) {
          return;
        }
        current = found.first;
      }
      parts.removeAt(0);
    }

    current?.items.add(cell);
  }

  CellCategory? catByName(String cat) {
    final parts = cat.split('/');

    CellCategory? current;

    while (parts.isNotEmpty) {
      if (current == null) {
        final found = categories.where((cat) => cat.title == parts.first);
        if (found.isEmpty) {
          return null;
        }
        current = found.first;
      } else {
        final found = current.items.where((cat) => cat is CellCategory && cat.title == parts.first);
        if (found.isEmpty) {
          return null;
        }
        current = found.first;
      }
      parts.removeAt(0);
    }

    return current;
  }

  void addToCats(List<String> cats, String cell) {
    cats.forEach((cat) => addToCat(cat, cell));
  }

  bool canMove(Cell cell, int x, int y, int dir, int side, int force, MoveType mt) {
    for (var lua in luaScripts) {
      return lua.canMoveModded(cell, x, y, dir, side, force, mt.name) ?? true;
    }

    return true;
  }

  String modOrigin(String id) {
    for (var lua in luaScripts) {
      if (lua.definedCells.contains(id)) return lua.id;
    }

    return "";
  }

  String modName(String id) {
    for (var lua in luaScripts) {
      if (lua.id == id) {
        return lua.info['name'] ?? "Unnamed";
      }
    }

    return "Unnamed";
  }

  String modDesc(String id) {
    for (var lua in luaScripts) {
      if (lua.id == id) {
        return lua.info['desc'] ?? "No Description available";
      }
    }

    return "No Description available";
  }

  String modAuthor(String id) {
    for (var lua in luaScripts) {
      if (lua.id == id) {
        return lua.info['author'] ?? "Unknown Author";
      }
    }

    return "Unknown Author";
  }

  String modIcon(String id) {
    for (var lua in luaScripts) {
      if (lua.id == id) {
        final p = path.join(lua.dir.path, 'icon.png');
        return File(p).existsSync() ? "mods/${id}/icon.png" : 'assets/images/modDefaultIcon.png';
      }
    }

    return "assets/images/modDefaultIcon.png";
  }

  Directory modDir(String id) {
    for (var lua in luaScripts) {
      if (lua.id == id) {
        return lua.dir;
      }
    }

    return Directory.current;
  }

  Set<String> modCells(String id) {
    final l = <String>{};

    for (var lua in luaScripts) {
      if (lua.id == id) {
        l.addAll(lua.definedCells);
      }
    }

    return l;
  }

  String? modReadme(String id) {
    for (var lua in luaScripts) {
      if (lua.id == id) {
        final f = File(path.join(lua.dir.path, 'README.md'));
        return f.existsSync() ? f.readAsStringSync() : null;
      }
    }

    return null;
  }

  bool isSticky(Cell cell, int x, int y, int dir, bool base, bool checkedAsBack, int originX, int originY) {
    for (var lua in luaScripts) {
      if (lua.hasDefinedCell(cell.id)) {
        return lua.isSticky(cell, x, y, dir, base, checkedAsBack, originX, originY) ?? false;
      }
    }

    return false;
  }

  bool sticksTo(Cell cell, Cell to, int dir, bool base, bool checkedAsBack, int originX, int originY) {
    for (var lua in luaScripts) {
      if (lua.hasDefinedCell(cell.id)) {
        return lua.sticksTo(cell, to, dir, base, checkedAsBack, originX, originY) ?? false;
      }
    }

    return false;
  }

  bool blocksUnstable(Cell cell, int x, int y, int dir, Cell moving) {
    for (var lua in luaScripts) {
      if (lua.hasDefinedCell(cell.id)) {
        return lua.blocksUnstable(cell, x, y, dir, moving);
      }
    }

    return false;
  }
}

final scriptingManager = ScriptingManager();
