# SColor | A Real-Time Game Notation System

## Equipment

* 1 × laptop running the **SuperCollider** programming language
* 1 × projector or monitor connected to the laptop

## Description

**SColor** is an interactive, real-time game notation system designed to organise music ensembles with any number of participants and any kind of instruments. The system is controlled by a conductor through **five buttons**, each assigned to a specific action. The **Graphical User Interface (GUI)** is visible to both performers and the audience.

At the beginning of the performance, the conductor assigns each performer (or group of performers) to a specific **box** and number. When a box is filled with colour, the performer(s) assigned to that box play according to the specific instruction text tied to that colour; when the box is empty (grey), they stop. Performers must listen to one another—whether playing or not—striving for musical cohesion.

The conductor directs the ensemble by selecting actions through the five buttons. Each of the five actions (**Tutti, Silence, Random, Reverse, Skip**) is also linked to a predefined **hand gesture**, as shown in the accompanying images.

If a performer wishes to alter the course of the performance, they must raise their hand. If the conductor acknowledges them, they perform the corresponding gesture to request an action.

To conclude the performance, the conductor raises their hand. Performers then guide their music to a close, raising their hands once they finish. The performance officially ends when **all performers have raised their hands**.

### Colour Instructions

* **Red — PASSION**
  Play with passion—the passion you feel when you dive deep into a fresh excitement. Let your sound be full of energy, emotion, and thrill.

* **White — FREELY**
  Play as if you have wings on your feet—light and free. Like a child stepping into a new adventure, embrace the endless possibilities of sound.

* **Cyan — FLOATING**
  Play with the calm of floating on your back in the sea, where your thoughts fade into peaceful stillness.

### Actions

* **Tutti**: All boxes are filled with colours.
* **Silence**: All boxes are empty.
* **Random**: Boxes are randomly filled with random colours or become empty.
* **Reverse**: Filled boxes turn empty, and empty boxes are filled with colour.
* **Skip**: Each colour changes randomly to a different one.

## Example

In this simple example, there are five performers (or, alternatively, five sets of performers). The conductor assigns each performer to a specific box:

* **Performer 1** plays according to the instructions associated with the colour **white**, keeping in mind the word *FREELY*.
* **Performer 2** plays according to the instructions associated with the colour **red**, keeping in mind the word *PASSION*.
* **Performers 3 and 5** play according to the instructions associated with the colour **cyan**, keeping in mind the word *FLOATING*.
* **Performer 4** remains silent for the moment.

![]("resources/SColor example.png")

If a performer wishes to change the score before the conductor does, they can call one of the five actions (i.e., buttons) by performing the corresponding gesture.

The performers and the conductor may pre-arrange whether one specific colour acts as a **leader** during the performance, with the others accompanying it, always based on the original instructions.

## Conductor

The conductor has control over the following parameters:

* Number of boxes
* Window size
* Number of columns

The conductor leads the performance by clicking the **five buttons** on the right side of the interactive GUI. They must pay attention to the performers not only musically, but also visually, watching for gestures requesting a specific action.

## File Structure

* Open the file **`SColor.scd`** and run it in its entirety.
* Adjustments to the number of boxes, number of columns, or window size can be made **in real time** by changing the values of the respective parameters within the same document.

## Note

You do **not** need an audio interface to run this program. The system is adaptable to any number of performers and to any type of sound source. It makes no distinction between acoustic instruments and electronics.

The program is designed to be easily configured for any type of ensemble, while leaving ample artistic space for performers to explore their musicality during performance.

## Licence

© 2025 **Angelos Thomas Karelias**

This program is free software: you may redistribute it and/or modify it under the terms of the **GNU General Public License** as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

See the **LICENSE** file for the full text of the GNU General Public License.
