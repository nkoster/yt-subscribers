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

Another example:

```
./yt-subscribers https://www.youtube.com/user/hickok45
```

The script "[mrbald](https://raw.githubusercontent.com/nkoster/yt-subscribers/master/mrbald)" is filled with more examples, my favorite Youtube channels:

```
./mrbald
{"time":"1549136476","subscribers":"240865","channel":"bald and bankrupt"}
{"time":"1549136478","subscribers":"295342","channel":"Karl Rock"}
{"time":"1549136479","subscribers":"910281","channel":"Георгий Кавказ"}
{"time":"1549136481","subscribers":"3701030","channel":"Mark Wiens"}
{"time":"1549136483","subscribers":"3881219","channel":"hickok45"}
```

I'm collecting this data for fun.

A graph generated with rrdtool. From Wed Jan 30 21:14:00 CET 2019 (1548879240) till Thu Feb 7 23:40:08 CET 2019 (1549579208), 5 minute samples, data collected with a cron job:

![Mr Bald and Karl Rock](https://raw.githubusercontent.com/nkoster/yt-subscribers/master/mrbald.png "Mr Bald and Karl Rock")

The script "[bald-karl](https://raw.githubusercontent.com/nkoster/yt-subscribers/master/bald-karl)" contains the rrdtool stuff to create above graph.

In the script "[mark-hick](https://raw.githubusercontent.com/nkoster/yt-subscribers/master/mark-hick)", I'm comparing food against weapons... 😱

Graph from Sat Feb 2 20:10:02 CET 2019 till Mon Wed Feb 6 23:55:02 CET 2019:

![Mark Wiens and Hickok45](https://raw.githubusercontent.com/nkoster/yt-subscribers/master/mark-hick.png "Mark Wiens and Hickok45")

**Warning**

Because of not using any API, this thing is suppose to break easily. Any layout change that Youtube will bring to their web site can stop the script from working correctly.
