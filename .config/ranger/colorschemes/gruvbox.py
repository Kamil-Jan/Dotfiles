from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    black, blue, cyan, green, magenta, red, white, yellow, default,
    normal, bold, reverse,
    default_colors,
)

# Black
bg_color = 235      #282828
bg1_color = 237     #3c3836

# Gray
light_gray = 248    #bdae93
dark_gray = 245     #928374

# Red
light_red = 167     #fb4934
dark_red = 88       #9d0006

# Orange
light_orange = 208  #fe8019
dark_orange = 130   #af3a03

# Green
light_green = 142   #b8bb26
dark_green = 100    #79740e

# Yellow
light_yellow = 214  #fabd2f
dark_yellow = 136   #b57614

# Blue
light_blue = 109    #83a598
dark_blue = 24      #076678

# Magenta
light_magenta = 175 #d3859b
dark_magenta = 96   #8f3f71

# Cyan
light_cyan = 108    #8ec07c
dark_cyan = 66      #427b58

# White
fg_color = 223      #ebdbb2


class Default(ColorScheme):
    progress_bar_color = blue

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                bg = light_red
            if context.border:
                fg = dark_gray
            if context.media:
                if context.image:
                    fg = light_yellow
                else:
                    fg = light_magenta
            if context.container:
                fg = light_red
            if context.directory:
                attr |= bold
                fg = light_orange
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                attr |= bold
                fg = light_green
            if context.socket:
                fg = light_magenta
                attr |= bold
            if context.fifo or context.device:
                fg = light_yellow
                if context.device:
                    attr |= bold
            if context.link:
                fg = light_cyan if context.good else light_magenta
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (red, magenta):
                    fg = fg_color
                else:
                    fg = light_red
            if not context.selected and (context.cut or context.copied):
                fg = black
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = light_yellow
            if context.badinfo:
                if attr & reverse:
                    bg = light_magenta
                else:
                    fg = light_magenta

            if context.inactive_pane:
                fg = light_cyan

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = light_red if context.bad else light_yellow
            elif context.directory:
                fg = light_orange
            elif context.tab:
                if context.good:
                    bg = light_green
            elif context.link:
                fg = light_cyan

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = light_cyan
                elif context.bad:
                    fg = light_magenta
            if context.marked:
                attr |= bold | reverse
                fg = light_yellow
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = light_red
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = light_blue
                attr &= ~bold
            if context.vcscommit:
                fg = light_yellow
                attr &= ~bold
            if context.vcsdate:
                fg = light_cyan
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = light_blue

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = light_magenta
            elif context.vcschanged:
                fg = light_red
            elif context.vcsunknown:
                fg = light_red
            elif context.vcsstaged:
                fg = light_green
            elif context.vcssync:
                fg = light_green
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = light_green
            elif context.vcsbehind:
                fg = light_red
            elif context.vcsahead:
                fg = light_blue
            elif context.vcsdiverged:
                fg = light_magenta
            elif context.vcsunknown:
                fg = light_red

        return fg, bg, attr
