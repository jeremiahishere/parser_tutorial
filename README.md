# Quick tutorial about the parser gem.  

## Overview

* It generates parse trees for ruby code.  
* The output from parser is generally easier to read than some of the alternatives.
* It's output is based on the gem ParseTree
* Useful for generating abc metrics: Assignments + Branches + Calls
* I am not sure if the parse trees generated by this gem have any meaning
* Do not use any of these heuristics without rewriting them.  They have many problems.

## Code

The examples folder has code examples to generate how the parser generates trees.

The heuristics folder includes several different methods for analyzing the parse tree

run.rb parses the file in the first argument and runs the heuristics

## How to run

gem install parser

ruby run.rb /path/to/ruby/file.rb
