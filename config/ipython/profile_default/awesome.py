# -*- coding: utf-8 -*-
"""
    Awesome Theme v0.1

    https://github.com/zenorocha/dracula-theme
"""

from pygments.style import Style
from pygments.token import Token, Keyword, Name, Comment, String, Error, \
    Literal, Number, Operator, Other, Punctuation, Text, Generic, \
    Whitespace

PINK = "#ff79c6"
COMMENT = "#6272a4"
WHITE = "#ffffff"
WHITE_BOLD = "#ffffff bold"
NUMBER = "#8be9fd"
STRING = "#f1fa8c"
GREEN = "#50fa7b"
BLUE = "#8be9fd"
RED = "#ff6b64"

#  # Default colors
#  primary:
#    background: '0x263238'
#    foreground: '0xeceff1'
#
#  # Normal colors
#  normal:
#    black:   '0x313131'
#    red:     '0xff6b64'
#    green:   '0xb6e097'
#    yellow:  '0xffdd50'
#    blue:    '0x4bcfff'
#    magenta: '0xff5c93'
#    cyan:    '0x00fdff'
#    white:   '0xf7f7f7'
#
#  # Bright colors
#  bright:
#    black:   '0x708284'
#    red:     '0xff5d4e'
#    green:   '0xb6e064'
#    yellow:  '0xffcb43'
#    blue:    '0x4fb6f7'
#    magenta: '0xe23673'
#    cyan:    '0x00b9cc'
#    white:   '0xf7f7f7'

class AwesomeStyle(Style):

    background_color = "#282a36"
    default_style = ""

    styles = {
        Comment: COMMENT,
        Comment.Hashbang: COMMENT,
        Comment.Multiline: COMMENT,
        Comment.Preproc: PINK,
        Comment.Single: COMMENT,
        Comment.Special: COMMENT,

        Generic: WHITE,
        Generic.Deleted: RED,
        Generic.Emph: "#ffffff underline",
        Generic.Error: WHITE,
        Generic.Heading: WHITE_BOLD,
        Generic.Inserted: WHITE_BOLD,
        Generic.Output: "#44475a",
        Generic.Prompt: WHITE,
        Generic.Strong: WHITE,
        Generic.Subheading: WHITE_BOLD,
        Generic.Traceback: WHITE,

        Error: WHITE,

        Keyword: PINK,
        Keyword.Constant: PINK,
        Keyword.Declaration: BLUE,
        Keyword.Namespace: PINK,
        Keyword.Pseudo: PINK,
        Keyword.Reserved: PINK,
        Keyword.Type: "#8be9fd",

        Literal: WHITE,
        Literal.Date: WHITE,

        Name: WHITE,
        Name.Attribute: GREEN,
        Name.Builtin: BLUE,
        Name.Builtin.Pseudo: WHITE,
        Name.Class: GREEN,
        Name.Constant: WHITE,
        Name.Decorator: WHITE,
        Name.Entity: WHITE,
        Name.Exception: WHITE,
        Name.Function: GREEN,
        Name.Label: BLUE,
        Name.Namespace: WHITE,
        Name.Other: WHITE,
        Name.Tag: PINK,
        Name.Variable: BLUE,
        Name.Variable.Class: BLUE,
        Name.Variable.Global: BLUE,
        Name.Variable.Instance: BLUE,

        Number: NUMBER,
        Number.Bin: NUMBER,
        Number.Float: NUMBER,
        Number.Hex: NUMBER,
        Number.Integer: NUMBER,
        Number.Integer.Long: NUMBER,
        Number.Oct: NUMBER,

        Operator: PINK,
        Operator.Word: PINK,

        Other: WHITE,

        Punctuation: WHITE,

        String: STRING,
        String.Backtick: STRING,
        String.Char: STRING,
        String.Doc: STRING,
        String.Double: STRING,
        String.Escape: STRING,
        String.Heredoc: STRING,
        String.Interpol: STRING,
        String.Other: STRING,
        String.Regex: STRING,
        String.Single: STRING,
        String.Symbol: STRING,

        Text: WHITE,

        Whitespace: WHITE
    }
