# 🧹 Dvall Command 

A simple, effective admin command for FiveM that clears unused vehicles and non-player characters (NPCs) from the game world. Perfect for server cleanup and reducing unnecessary load during gameplay.

## ⚙️ What It Does

The `/dvall` command:
- 🚗 Deletes all unoccupied and unused vehicles
- 👤 Deletes all non-player, non-mission critical peds (NPCs)
- 🧠 Leaves players, player vehicles, and essential mission entities untouched

Useful for:
- 🔧 Lag reduction
- 🧼 Cleanup after events
- 🚓 Police scenes or RP resets
- 🌍 Clearing a cluttered world state

## 🕹️ Command Usage

| Command     | Description                      |
|-------------|----------------------------------|
| `/dvall`    | Deletes non-used vehicles & peds |

> Requires proper permissions depending on your framework (e.g., admin role in vMenu, ace permissions, etc.).

## 🛠️ Installation

1. Add the script to your `resources/` folder, e.g., `resources/d3-dvall/`

2. Ensure it in your `server.cfg`:
   ensure `d3-dvall`
