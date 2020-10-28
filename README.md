# WinZoZ

The plugin for easy window navigation.

Demo
----

![WinZoZ demo](https://user-images.githubusercontent.com/20521900/97799961-55007280-1c31-11eb-9821-8b604345ac1b.gif)

([This is the lovely beast in the background.](https://en.wikipedia.org/wiki/Chlamydosaurus))

Usage
-----

Upon installing the plugin,

  - <kbd>\<leader\></kbd><kbd>w</kbd> will turn on the WinZoZ mode (a colored status bar will make it apparent):
    - every key pressed in this mode will be interpreted as if you pressed it after hitting <kbd>Ctrl-W</kbd>;
  - by hitting <kbd>Escape</kbd> you'll go back to normal mode.

Customization points
--------------------

  - If you're not happy with <kbd>\<leader\></kbd><kbd>w</kbd>, you can define `g:winzoz_no_mappings` in your `vimrc` and write a mapping yourself, such as `nmap <silent> <leader>x <Plug>(go-zoz-navigation)`.
  - When the WinZoZ mode is active, the status bar is colored with the `Search` highlight group. You can change this by defining `g:winzoz_statusline_hl_group` as you prefer.

Installation
------------

However you like. I use [vim-plug](https://github.com/junegunn/vim-plug).


Motivation
----------

Long story short, resizing windows has always been a pain for me and, with a large screen and many open windows, even pressing <kbd>Ctrl-W</kbd> several times has become a pain.

Since [I did not find an existing plugin addressing this need](https://vi.stackexchange.com/questions/27704/does-a-plugin-exist-which-allows-moving-across-the-windows-and-split-them-with), I started reading [Learn Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/), which made me thing I could write a plugin myself, so I did it and had it [reviewed on CodeReview](https://codereview.stackexchange.com/questions/251269/vim-plugin-for-easy-window-navigation), and here it is.

Why WinZoZ? [Oh, well...](https://nonciclopedia.org/wiki/Windows)
