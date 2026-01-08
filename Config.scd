// SPDX-License-Identifier: GPL-3.0-or-later
// © 2025 Angelos Thomas Karelias
(
// SColor configuration

// Function to calculate grid dimensions
~sc[\calculateGrid] = {
    var cols = ~sc[\cols];
    var rows = (~sc[\numPerformers] / cols).ceil;
    var boxSize = ~sc[\gridSize] / cols;

    ~sc[\boxSize] = boxSize; // Store box size in the dictionary
    ~sc[\rows] = rows;       // Store rows in the dictionary
};

// Function to draw the grid
~sc[\drawGrid] = { arg uv;
    var fontSize, textX, textY, col, row, rect;

    Pen.use {
        ~sc[\numPerformers].do { |i|
            col = i % ~sc[\cols]; // Column index
            row = (i / ~sc[\cols]).floor; // Row index
            rect = Rect(col * ~sc[\boxSize], row * ~sc[\boxSize], ~sc[\boxSize], ~sc[\boxSize]);

            // Draw the box
            Pen.fillColor = ~sc[\boxStates][i];
            Pen.fillRect(rect);

            // Draw the border
            Pen.strokeColor = ~sc[\borderColor];
            Pen.strokeRect(rect, ~sc[\borderWidth]);

            // Add the number inside the box
            fontSize = (~sc[\boxSize] / 3).min(20);
            textX = rect.left + (~sc[\boxSize] / 2);
            textY = rect.top + (~sc[\boxSize] / 2) + (fontSize / 4);

            Pen.font = Font("Helvetica-Bold", fontSize);
            Pen.fillColor = ~sc[\textColor];
            Pen.stringAtPoint((i + 1).asString, Point(textX, textY));
        }
    }
};

// Function to create buttons
~sc[\createButtons] = { arg win;
    var buttonWidth = 80;
    var buttonHeight = 30;
    var buttonSpacing = 10;
    var gridSize = ~sc[\gridSize];

    // Button positions
    var tuttiButtonY = gridSize - 50;
    var silenceButtonY = tuttiButtonY - buttonHeight - buttonSpacing;
    var randomButtonY = silenceButtonY - buttonHeight - buttonSpacing;
    var reverseButtonY = randomButtonY - buttonHeight - buttonSpacing;
    var skipButtonY = reverseButtonY - buttonHeight - buttonSpacing;

    // Tutti Button
    Button(win, Rect(gridSize + 20, tuttiButtonY, buttonWidth, buttonHeight))
        .states_([["Tutti", Color.white, Color.black]])
        .action_({
            var choices, available;
		choices = [Color.red, Color.cyan, Color.white];
	available = choices.reject { |x| x == ~lastChoice };
	~lastChoice = available.choose;
            ~sc[\boxStates] = List.fill(~sc[\numPerformers], { ~lastChoice });
            ~sc[\uv].refresh;
        });

    // Silence Button
    Button(win, Rect(gridSize + 20, silenceButtonY, buttonWidth, buttonHeight))
        .states_([["Silence", Color.white, Color.black]])
        .action_({
            ~sc[\boxStates] = List.fill(~sc[\numPerformers], { Color.clear });
            ~sc[\uv].refresh;
        });

    // Random Button
    Button(win, Rect(gridSize + 20, randomButtonY, buttonWidth, buttonHeight))
        .states_([["Random", Color.white, Color.black]])
        .action_({
            ~sc[\boxStates] = List.fill(~sc[\numPerformers], {
                [Color.red, Color.cyan, Color.white, Color.clear].choose;
            });
            ~sc[\uv].refresh;
        });

    // Reverse Button
    Button(win, Rect(gridSize + 20, reverseButtonY, buttonWidth, buttonHeight))
        .states_([["Reverse", Color.white, Color.black]])
        .action_({
            ~sc[\boxStates] = ~sc[\boxStates].collect { |currentColor|
                if (currentColor == Color.clear) {
                    [Color.cyan, Color.red, Color.white].choose;
                } {
                    Color.clear;
                }
            };
            ~sc[\uv].refresh;
        });

    // Skip Button
    Button(win, Rect(gridSize + 20, skipButtonY, buttonWidth, buttonHeight))
        .states_([["Skip", Color.white, Color.black]])
        .action_({
            ~sc[\boxStates] = ~sc[\boxStates].collect { |currentColor|
                 if (currentColor == Color.red) {
                [Color.cyan, Color.white, Color.clear].choose;
            } {
                if (currentColor == Color.cyan) {
                    [Color.red, Color.white, Color.clear].choose;
                } {
                    if (currentColor == Color.white) {
                        [Color.cyan, Color.red, Color.clear].choose;
                    } {
                        if (currentColor == Color.clear) {
                            [Color.cyan, Color.white, Color.red].choose;
                        } {
                            currentColor; // Default case: keep the current color if no match
                        }
                    }
                }
            }
            };
            ~sc[\uv].refresh;
        });
};

// Main function to initialize the window and UserView
~sc[\initializeWindow] = {
    var win = Window.new("SColor", Rect(100, 100, ~sc[\gridSize] + 150, ~sc[\gridSize]), true).front;

    ~sc[\boxStates] = List.fill(~sc[\numPerformers], { Color.clear });
    ~sc[\uv] = UserView(win, Rect(0, 0, ~sc[\gridSize], ~sc[\gridSize]));
    ~sc[\uv].background_(Color.grey);

    ~sc[\uv].drawFunc = { arg uview;
        ~sc[\drawGrid].value(~sc[\uv]);
    };

    ~sc[\createButtons].value(win);


    ~sc[\uv].refresh;

    win.onClose = {
        ~sc[\uv].free;
    };
};
)