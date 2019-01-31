# yt-subscribers

**Get the number of Youtube subscribers for a specific channel, with a (very) simple shell (bash) script.**

Example:

```
./yt-subscribers https://www.youtube.com/channel/UCxDZs_ltFFvn0FDHT6kmoXA
```

results in a JSON object like this:

```
{"time":"1548875491","subscribers":"232160","channel":"bald and bankrupt"}
```

Some funny results:

```
2046 niels@pvofflapnko:~/src/mrbald$ ./mrbald
{"time":"1548877591","subscribers":"232250","channel":"bald and bankrupt"}
{"time":"1548877593","subscribers":"293710","channel":"Karl Rock"}
{"time":"1548877594","subscribers":"899262","channel":"Георгий Кавказ"}
{"time":"1548877596","subscribers":"3682196","channel":"Mark Wiens"}
2046 niels@pvofflapnko:~/src/mrbald$ ./mrbald
{"time":"1548877771","subscribers":"232259","channel":"bald and bankrupt"}
{"time":"1548877773","subscribers":"293710","channel":"Karl Rock"}
{"time":"1548877775","subscribers":"899275","channel":"Георгий Кавказ"}
{"time":"1548877777","subscribers":"3682218","channel":"Mark Wiens"}
2049 niels@pvofflapnko:~/src/mrbald$ ./mrbald
{"time":"1548878190","subscribers":"232274","channel":"bald and bankrupt"}
{"time":"1548878192","subscribers":"293712","channel":"Karl Rock"}
{"time":"1548878193","subscribers":"899296","channel":"Георгий Кавказ"}
{"time":"1548878196","subscribers":"3682264","channel":"Mark Wiens"}
2056 niels@pvofflapnko:~/src/mrbald$
```

A graph, generated with rrdtool, extracted from a 24 hour / 5 minute sample set, collected with a cron job:
![Mr Bald ad Karl Rock](https://raw.githubusercontent.com/nkoster/yt-subscribers/master/mrbald.png "Mr Bald and Karl Rock")

**Warning**

Because of the simplicity of the way I parse the result from wget, and/or, not using any API, this thing is suppose to break easily.

Any layout change that Youtube will push to their web site, can stop the script from working correctly.
