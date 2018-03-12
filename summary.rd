View Graphic Here:
https://bl.ocks.org/mikectlm/raw/14ae0aed1660086b64582dbc9c5d8ba6/

Summary
The visualization contains data reported by U.S flight carriers on delayed flights for the entire 2016 year (a flight is considered delayed if it arrives 15 minutes or more after it's scheduled time). 
There are five categories or reasons that carriers report that determine the delay: Air Carrier, National Aviation System, Weather and Security.
The visualization highlights the worst operating airline of the highest flight volume airlines, as well as explains each category and how to interpret the data. The data can be explored by month and by one or many categories.

Design
I chose to use a stacked bar chart initially, but found with the number of carriers it may be easier to read the graph if I rotated the chart. 
This allowed me to create a longer graph area where most users can view without too much scrolling. I opted to use vertical grid lines in a faint grey shade. 
With different opacity set on the rectangles and grid lines, they provide a nice guide to the x-axis. Alternatively they provide a visual cue when an animation occurs,
letting them know some change has occurred in the x-axis dimension. The colors selected came from the colorbrewer diverging color themes. These are proven 
themes, and it is easily apparent when the rectangles change category. Lastly I set a tooltip on the rectangles that diplays the type, carrier and exact value.

At one point I animated the y-axis on animation change to sort largest carrier values on top, but found this made it difficult to make comparisions.

After receiving feedback..
I removed the Late Arriving Aircraft category from the grid. It was normally the largest displayed for each carrier and it was likely duplicating results,
in the way if the first plane of the day is late from a different category, it could chain throughout the rest of the day and create late arriving air craft results.

I also removed the lower volume airlines from the dataset based on the average total flights per month.

One user mentioned the scales appearing funny (in lenght) to them. While they were correct I decided to shorten the width of the graph to make the bars easier to perceive.

Also I noticed that some of the data was producing 0 length fields for some months incorrectly (if there were a few NaN in a row, it caused the whole row to NaN)

One user mentioned the most important category should be highlighted first, in a dark color and I agreed with them.

I changed how the tooltip functioned and added additional data points to it.

Feedback 
"Imagine that the reader had one question: which is the WORST airline? In this case, you'd look at preventable delays which were directly attributable to the airline, show those first and darkest in the stacked bar, then order the airlines by these kinds of delays."

"In general: 1) The grid lines are distracting visually 2) The color palette is really shocking on the eyes every time I switch to a new color. A darker but bolder palette might work better. 3) I'd like to see the compare by month feature as a line chart - which categories spike (like weather) at which times? 4) For security how come some are zero? Is there no data or is it really zero? 5) Not all of the scales seem to be the same # flights out of 1000...like late arriving aircraft. Am I interpreting that correctly? 6) Is there possibly another way to show the stacked chart on the final one, because security delay is obscured. I would recommend starting with that one as well, where everything is together and you can see the detail later.
My main takeaway is that for the most part late arriving aircraft cause most delays...but then it makes me wonder wouldn't all of the other factors (security, weather etc) cause the previous aircraft to be late, so of course it's going to make a chain reaction so are you kinda double counting in that regard and that's why it's the largest factor? Anyway what do I know.
Weather: 1) One thing this makes me think about data-wise is all of these airlines fly different routes (i.e. Frontier in west and mid-west, where more storms are likely, or Delta and United flying way more flights total) so it seems unfair to compare them head to head. Is the data at all taking this into consideration? What if you compared all the routes each airline has in common?"


"1 & 3. Bar charts are a good choice to show the delay time of flight. I noticed that weather issue does not contribute to that much of delay compared to other reasons like NAS, air carrier, and late-arriving aircraft by looking at the last bar chart with all categories on.
2.I wonder why you choose to show statistics of mins per 1000 Flights instead of average min per flight. The key story will not change by dividing mins by 1000. And I think it is hard to grasp meaning of thousands of minutes. I can guess security ranged between 10min to 50min is why you have chosen minutes as unit. But I personally think that smaller number can be easier to compare and understand the meaning of it.
4.I was wondering if the categories of y-axis are in a certain ordering. They are not in alphabetical or do not seem to have sub categories. I noticed that they were sorted by descending ordering of delay mins from the last summary chart. Frontier Airlines, JetBlue Airways and Spirit Airlines are the top 3 airlines of the longest delay mins. 
5.I have seen zero mins on some airlines in some months. I wonder if that is even possible to have no delay time at all for a month for 1000 flights. In December, I assume that it is busiest month for flight business but no data point is shown. So, it will be helpful why there is no data points in December.
"

"Nice data viz!
1 & 3. Bar charts are a good choice to show the delay time of flight. I noticed that weather issue does not contribute to that much of delay compared to other reasons like NAS, air carrier, and late-arriving aircraft by looking at the last bar chart with all categories on.
2.I wonder why you choose to show statistics of mins per 1000 Flights instead of average min per flight. The key story will not change by dividing mins by 1000. And I think it is hard to grasp meaning of thousands of minutes. I can guess security ranged between 10min to 50min is why you have chosen minutes as unit. But I personally think that smaller number can be easier to compare and understand the meaning of it.
4.I was wondering if the categories of y-axis are in a certain ordering. They are not in alphabetical or do not seem to have sub categories. I noticed that they were sorted by descending ordering of delay mins from the last summary chart. Frontier Airlines, JetBlue Airways and Spirit Airlines are the top 3 airlines of the longest delay mins. 
5.I have seen zero mins on some airlines in some months. I wonder if that is even possible to have no delay time at all for a month for 1000 flights. In December, I assume that it is busiest month for flight business but no data point is shown. So, it will be helpful why there is no data points in December.
"

Resources 
http://colorbrewer2.org/
https://bl.ocks.org/mbostock/3886208
http://bl.ocks.org/DimsumPanda/2030ad010e69b5b3e3d2e0e1ec90c3af - huge help for the stacked function to makedata()
