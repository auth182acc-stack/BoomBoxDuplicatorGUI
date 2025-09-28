# BoomBoxDuplicatorGUI

Roblox BoomBox Duplicator with a minimal GUI for developers.

## Features

*   **Minimalist GUI**: Clean and developer-friendly interface.
*   **Customizable Duplication Count**: Set the number of BoomBoxes to duplicate.
*   **Toggle `getfenv`**: Option to enable/disable the duplication environment (use with caution).
*   **Real-time Console Output**: View script progress and messages directly in the GUI.
*   **Dark Theme**: Optimized color scheme for comfortable viewing.

## How to Use

1.  **Copy the Script**: Copy the entire content of `BoomBoxDuplicator_with_GUI.lua`.
2.  **Execute in Roblox**: Paste and execute the script in your Roblox exploit/executor.
3.  **Interact with GUI**: A GUI window will appear on your screen.
    *   Enter the desired number of duplications in the "จำนวนครั้งที่ต้องการทำซ้ำ" field.
    *   Toggle "เปิดใช้งานสภาพแวดล้อมการทำซ้ำ" if needed (default is enabled).
    *   Click the "เริ่มการทำซ้ำ" button to start the process.
4.  **Monitor Progress**: The console output area in the GUI will show the status and logs of the duplication process.

## Configuration

You can modify the `GUI_SETTINGS` table at the beginning of the script to customize colors and fonts if desired.

```lua
local GUI_SETTINGS = {
    BackgroundColor = Color3.fromRGB(40, 44, 52), -- Dark grey
    TextColor = Color3.fromRGB(171, 178, 191),    -- Light grey
    AccentColor = Color3.fromRGB(152, 195, 121),  -- Green
    BorderColor = Color3.fromRGB(62, 68, 82),    -- Slightly lighter dark grey
    Font = Enum.Font.SourceSans,
    FontSize = Enum.FontSize.Size18,
}
```

## Disclaimer

This script is provided for educational and experimental purposes only. Use at your own risk. The developer is not responsible for any consequences arising from its use.

---

Made by Cyro (original script) and Manus (GUI adaptation).
