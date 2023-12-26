ICM Shortcuts for AutoHotkey
============================

Productivity shortcuts for Windows using
[Autohotkey](https://www.autohotkey.com/).

Run the [script](ICM-shortcuts.ahk) to get the shortcuts, or install as
described below.

By default, they all use the Tab key to activate them.
Very occasionally this can trigger unexpected (and confusing) behaviour with
tab-completion, but it happens surprisingly rarely.


Examples
--------

Most used:

- Abbreviations:

  - `btw`+Tab -> "by the way "
  - `eg`+Tab -> "e.g. "
  - `ie`+Tab -> "i.e. "

  (although,
  [consider not using eg and ie at all](https://insidegovuk.blog.gov.uk/2016/07/20/changes-to-the-style-guide-no-more-eg-and-ie-etc/)).

- `TODO`+Tab: inserts an initialled and dated TODO like this, where you can
  then start typing:

```console
TODO: ICM 2022-12-24: <type here>
```

- Similarly `HACK` and `REV`:

```console
HACK: ICM 2022-12-24: <type here>
(REVIEW: ICM 2022-12-24: <type here>)
```

- `rule`+Tab: inserts a set of rulers
  ([rules](https://en.wikipedia.org/wiki/Ruler)) useful for judging line length
  where you don't have visible rulers, columns, right-hand margins, or column
  markers. Starts with a default selection of these:

  - Numbers
  - Git short message
  - Git message/plain text email wrap point
  - 80 character line length

  that looks something like this:

```console
12345678901234567890123456789012345678901234567890123456789012345678901234567890
50------------------------------------------------
72----------------------------------------------------------------------
80------------------------------------------------------------------------------
```

There are examples for coding:

- `by`+Tab currently gives [Doxygen](https://www.doxygen.nl/)-style comments
using the Windows username:

```C++
//! @author <Username>
//! @date   2022-12-24
```

Examples for HTML/XHTM:

- `body`+Tab, `h1`+Tab give:

```HTML
<body>(cursor here)</body>
<h1>(cursor here)</h1>
```

(Some of the shorter ones require the leading `<` to avoid mis-triggers, like
`<a`, `<b`, and `<p`.)

- `hre`+Tab inserts an `<a>` anchor, using the URL in the clipboard for the
`href` attribute, like this:

```HTML
<a href="https://example.com/">(cursor here)</a>
```

Examples for [Textile](https://textile-lang.com/)
(and old-style Confluence wiki):

- `{code`+Tab and `{panel`+Tab

```console
{code:none}<type here>{code}
{panel}<type here>{panel}
```


Installation
------------

Edit the `UserInitials` at the top of the file: this is used to customize
some of the shortcuts, such as `todo` and `hack`.

To run automatically at startup in Windows 10, see
[Add an app to run automatically at startup in Windows 10](https://support.microsoft.com/en-us/windows/add-an-app-to-run-automatically-at-startup-in-windows-10-150da165-dcd9-7230-517b-cf3c295d89dd).
This can be summarized as:

- Windows logo key + R to open Run dialog.
- `shell:startup` to open the (your?) `Start-up` folder.
- Copy the script file and Paste shortcut into the `Start-up` folder.
