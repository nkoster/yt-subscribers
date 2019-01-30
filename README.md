# yt-subscribers

**Get the number of subscribers for a specific channel, with a (very) simple shell (bash) script.**

Example:

```
./yt-subscribers https://www.youtube.com/channel/UCxDZs_ltFFvn0FDHT6kmoXA
```

results in a JSON object like this:

```
{"time":"1548875491","subscribers":"232160","channel":"bald and bankrupt"}
```

Warning...

Because of the simplicity of the way I parse the result from wget, and/or, not using any API, this thing is supposed to break easily.

Any layout change that Youtube pushes to their web site, can stop the script from working correctly.
