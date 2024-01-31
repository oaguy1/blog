---
title: Build a Stupid Game
author: Lily Hughes-Robinson
date: 2024-01-30
template: post
type: article
twitter: @oaguy1
description: Learn more and have fun doing it
---

I do not make games for a living. I spend my time at work constructing data pipelines and building web APIs. One could reasonably ask why I would bother making a simple game that, most likely, only I will ever play. The answer is that building games is hard, even a simple game like Pong or Breakout. There is quite a bit to manage and it makes for a fun distraction for an afternoon while the toddler sleeps.

How does this translate beyond me? I honestly think there is something to the idea that games are a pinnacle of software design and implementation. They require graphics, sound, math, and user input at the very least. Many simple games include basic AI and other more advanced computer science topics one may never touch on in their day job. It provides a proven way to step outside your comfort zone and challenge yourself.

So, what did I build and how did I build it? I built Pong. I honestly didn't intend to, at first. I was following an excellent tutorial on LÖVE and placed a white rectangle on a black screen. Once I made it move, I turned to myself and thought, I bet I can make Pong with what I know. Sure enough, I abandoned the tutorial and an hour later had a working pong game with a dumb AI that was too good to be reasonably beaten.

This is where I started experimenting with physics, trying and eventually failing to have the ball match the player paddle's acceleration. Still, despite being unable to make the more advanced game work without weird ball-paddle interactions, I feel like I found sparks of fun in trying to spike the ball such that AI paddle couldn't keep up.

As previously hinted, I built my pong using the LÖVE engine in fennel, a Lisp that compiles down to LÖVE's scripting language of choice, Lua. I am currently on a Lisp kick, so fennel was the perfect way to get some more face time with a different dialect of Lisp than I used for my previous project, Common Lisp. I have long admired LÖVE for its simplicity as well as its easy to use nature, so it make for a natural choice for a game engine to start with. I could have chosen an engine in a language I was more familiar with, but where is the fun in that? 

