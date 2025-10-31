There's so much good stuff out there but it feels to me like we've reached a stage where 'just shared' isn't enough, and we need to level up.

There is too much work

And I'm not really saying anything new here.

https://nhsdigital.github.io/rap-community-of-practice/introduction_to_RAP/levels_of_RAP/

We're really just looking at the silver and gold levels of RAP.

Buts some of these can be done from the start.

I saw an interesting discussion about people who had a really positive experience of reviewing someone else's code. All these recommendations also support this. You know what people will review? Code that's easy to review.


My reflections come from
- working on a complex, cross-organisation project that we were progressing work on as we had time
- seeing the results of all of HSMA projects
- I'm still working this out/getting better at it myself!

(note: I do not always do all of these. You're not doing badly if you don't do them - you're doing realistically. But equally, these will make your lives easier and I generally end up kicking myself if I don't do them.)


My key steps for taking things from 'shared' to 'solution someone else can use'.
1. Readme. Is it worth my time to poke around in your code? What is it even trying to do? Give me at least basic idea of what I need to do to run it. "coming soon" isn't good enough. Write a couple of sentences as part of your initial upload.
    - as a side note, your org and you can have a personal readme by creating a special repo. This is the most powerful way for me to understand if you've got a tool I might care about and if you're someone I should be following. Use it. As someone recruiting coders, this is your chance to shine.
    - heck, even make a personal or org site with quarto (shout out personal site stuff). Host it for free on github pages. Get a custom URL for super cheap.
2. Licence. If you haven't put a licence on it, I'm not even allowed to use it.
3. Docstrings. If you're allowed to use any LLM tools like copilot, I highly recommend feeding it your code and asking it to generate a docstring in numpydoc format or your format of choice (check if SW is happy for me to shout out on this). numpydoc da best though. Your code becomes easier to use because you start getting lovely hints, and this leads nicely onto...
4. Documentation. Quartodoc + github pages = free documentation in a format you already know and love. Host it on quartopub or github pages. pdoc is also an easy alternative to consider.
5. Automatic linting. Makes your code more readable, saves time faffing with line breaks and layout. I'm really kicking myself that I didn't start this sooner.
6. Folder structure. Some structures will make it a lot easier to turn this into a package down the line. It will also make some of your documentation structures work better. Consider using one of the great repo templates out there. Read about it here.
7. requirements.txt
8. Write some basic tests. Future you will thank you.
9. Use GitHub issues + GitHub projects. It's a free, in-place tracker. It's useful for you to track what you want to do, how important it is. It's got milestones, kanban boards, labels - it's unbelievably handy. Gives people a live understanding
10. Turn it into a package. Shout out Tom's package stuff here.

I think turning things into packages - or pbix files, or quarto templates, or reusable paramterised tools - are the single most impactful thing we can start to do

And it's a mindset shift - from 'how can I use this once' to 'how can I use this again'.

It takes a bit of time - but it takes a hell of a lot less time if we are thinking about this from the beginning.

And sometimes things become packages after starting out not that way - vidigi began as baked in code for one specific demonstration.

stlitepack started as an annoying thing I had done for several of my apps, then had to explain to people, and then just decided to fix once and for all.




## Part 2 of the talk

To anyone just joining the NHS, building up an understanding of all the useful tools that exist is a mega job.

And that varies too much from organisation to organisation. In some organisations you'd join and there are people you can speak to who've been there a long time, who have that knowledge of solutions and techniques etc. - but that's not everywhere.


And never mind the other issues with this approach. The fear of 'should I know this? I better not ask in case I look stupid.'
Or 'who should I even ask'?

And with the switch to a 90 day limit for NHS-R and pycom, we are going to turn into goldfish. "You had to be there, man".

And I *love* a webinar and I *love* a conference. But the less said about my conference notes, the better.


The magic book I wish I had is twofold:
- it's a book about the techniques that exist to answer your questions - almost a cookbook of case studies and
- and it's also a way of reviewing the work done in the space that might be worth my time
