# Javelo Frontend challenge

### Intro

We provide an `index.html` file. When opened in a browser, this one displays a simple message using React.

You have to use it in order to complete all of this test's levels.

## Level 1 : React

On top of the page, display a message `XX objectives have their current value over their target` by replacing XX with the correct number.

Under that message, display the objectives in a list. For each one you will display the title, and a curve created from the three points : start point (with `start_date` and `start` value), end point (with `end_date` and `target` value) and current point (with `today`'s date and `current` value).

For the data, you can use the `OBJECTIVES` and `TODAY` constants that are already defined in the file.
You are free to load and use any libraries you may find useful.

## Level 2 : Tree structure

Let's consider our objectives are arranged in a tree structure : each one of them may have an attribute `parent_id` that would represent the parent of that objective in a tree structure.

Using that attribute, display the same objectives organised in a tree structure with an UI of your choice (instead of a list).

## Level 3 : Dynamic objectives

Add a button for each objective. When clicking that button, the current value of the corresponding objective should be incremented by 1.

Display also a counter next to each button displaying the number of incrementations it triggered.

## Level 4 : Redux

Let's install Redux with `redux` and `react-redux` libraries (already loaded).

Put the objectives in the store.

Create a top level button incrementing randomly one of the objectives' current value.
