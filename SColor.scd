// SColor
// Starting here by evaluating the entire code.

(
Window.closeAll;
~sc = Dictionary.new;
"Config.scd".loadRelative;

~sc[\numPerformers] = 5; // Total number of performers
~sc[\gridSize] = 600;    // Size of the grid (width and height in pixels)
~sc[\cols] = 3;          // Number of columns

~sc[\calculateGrid].value;
~sc[\initializeWindow].value;
)

//*******************************************************************************************

/*
Tutti: All the boxes are filled with the same randomly chosen color
Silence: All the boxes are set to empty
Random: Each box is either filled with a randomly chosen color or left empty
Reverse: The filled boxes turns empty and the empty one filled with color
Skip: Each color changes randomly to a different one.
*/


// SPDX-License-Identifier: GPL-3.0-or-later
// © 2025 Angelos Thomas Karelias
