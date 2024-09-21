#!/bin/bash

clear
echo "Let's build a mad-lib!"

read -p "1. Name an unusual sport: " NOUN1
read -p "2. Name a place: " NOUN2
read -p "3. Adjective: " ADJ1
read -p "4. Verb (past tense): " VERB1
read -p "5. Adverb: " ADV1
read -p "6. Name a food: " NOUN3
read -p "7. Emotion: " NOUN4
read -p "8. Color: " NOUN5

echo "Once upon a time, in a $ADJ1 land, there was a famous sport called 
$NOUN1. People traveled from far and wide to play $VERB1 in $NOUN2. It was said that if 
you played $VERB1 $ADV1, you would get to eat $NOUN5 $NOUN3 filled with 
$NOUN4."
