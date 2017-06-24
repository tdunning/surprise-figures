# Recreate figures from Surprise and Coincidence paper

The scripts here recreate, exactly in most cases, the figures from my 1993 paper[1] that described how to use a generalized log-likelihood ratio test for testing for interesting coincidence.

One particular note is that apparently the axes were swapped in Figure 2. Moreover, various small changes in conditions could make the relationship between the LLR test and Pearson's chi-squared test look noticeably different. The script reproduces the original figure as well as several variants (with the right axis labels!).

## Running the scripts

To run the scripts on a reasonably Linux-like machine, install R[2] and use the following commands:

```bash
$ for x in fig*.r
> do
> Rscript $x
> done
$
```
This should result in several PDF files that contain the figures of interest. On OSX, you can view this recreated figures using this command:

```bash
$ open *.pdf
```

On Linux, I think that the following will work:
```bash
$ xdg-open *.pdf
```

[1] http://tdunning.blogspot.com/2008/03/surprise-and-coincidence.html
[2] https://www.r-project.org/
