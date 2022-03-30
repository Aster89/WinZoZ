```
                              _______    _______
            ___     _____    //     /   //     /
            \  | __ \  _/_ __\\_   / ___\\_   /
            |  |/  |/ (_) '_ \ // / / _ \ // /
            |    |    / | | | // /_\ (_) // /_
            |___/|___/|_|_| |//    \\___//    \
                            //_____/   //_____/
```

The plugin for easy window navigation.

Demo
----

![WinZoZ demo][1]

([This is the lovely animal in the background.][2])

Usage
-----

Upon installing the plugin,

  - <kbd>\<leader\></kbd><kbd>w</kbd> will turn on the WinZoZ mode (a colored status bar will make it apparent):
    - every key pressed when this mode is active will be interpreted as if you pressed it after hitting <kbd>Ctrl-W</kbd>;
  - by hitting <kbd>Escape</kbd> you'll go back to normal mode.

Customization points
--------------------

  - If you're not happy with <kbd>\<leader\></kbd><kbd>w</kbd>, you can define `g:winzoz_trigger` in your `vimrc`.
  - When the WinZoZ mode is active, the status bar is colored with the `Search` highlight group. You can change this by defining `g:winzoz_style` as you prefer.
  - There's an option to disable the plugin, but why doing it?

Installation
------------

However you like. I use [vim-plug](https://github.com/junegunn/vim-plug).


Motivation
----------

Long story short, resizing windows has always been a pain for me and, with a large screen and many open windows, even pressing <kbd>Ctrl-W</kbd> several times has become a pain.

Since [I did not find an existing plugin addressing this need][3], I started reading [Learn Vimscript the Hard Way][4], which made me thing I could write a plugin myself, so I did it and had it [reviewed on CodeReview][5], and here it is.

Why WinZoZ? [Oh, well…][6]

[1]:https://user-images.githubusercontent.com/20521900/97799961-55007280-1c31-11eb-9821-8b604345ac1b.gif
[2]:https://en.wikipedia.org/wiki/Chlamydosaurus
[3]:https://vi.stackexchange.com/questions/27704/does-a-plugin-exist-which-allows-moving-across-the-windows-and-split-them-with
[4]:https://learnvimscriptthehardway.stevelosh.com/
[5]:https://codereview.stackexchange.com/questions/251269/vim-plugin-for-easy-window-navigation
[6]:https://nonciclopedia.org/wiki/Windows
