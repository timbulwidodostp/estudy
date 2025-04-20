{smcl}
{* *! version 1.0.0  08jan2018}{...}
{cmd:help estudy}{right: ({browse "https://doi.org/10.1177/1536867X211063150":SJ21-4: st0532_3})}
{hline}

{title:Title}

{p2colset 5 15 17 2}{...}
{p2col :{cmd:estudy} {hline 2}}Event study{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 14 2}
{cmd:estudy} {it:{help varlist:varlist1}}
[{cmd:(}{it:varlist2}{cmd:)} ... {cmd:(}{it:varlistN}{cmd:)}]{cmd:,}
{opth dat:evar(varname)} 
{opt evd:ate(string|namelist datelist)}
{opth datef:ormat(strings:string)}
{opt lb1(#)} {opt ub1(#)} [{it:options}]

{phang}
{it:varlist1} [{cmd:(}{it:varlist2}{cmd:)} ... {cmd:(}{it:varlistN}{cmd:)}]
specifies the securities' returns (or prices when {opt price} option has been
set) necessary to perform the event study.  {cmd:estudy} treats each
{it:varlist} as independent, computing portfolios or average cumulative
abnormal returns (ARs), or both, for each one of them.{p_end}

{synoptset 35 tabbed}{...}
{synopthdr}
{synoptline}
{p2coldent:* {opth dat:evar(varname)}}specify the date variable in the dataset; {it:varname} must be sorted in chronological order{p_end}
{p2coldent:* {opt evd:ate(string|namelist datelist)}}specify {opt evdate(string)} for common event or event-date clustering or {opt evdate(namelist datelist)} for multiple events (that is, when each security has its own event date){p_end}
{p2coldent:* {opth datef:ormat(strings:string)}}indicate the format of the event date ({opt evdate(string)} option) for event-date clustering; {it:string} may be {cmd:MDY}, {cmd:DMY}, or {cmd:YMD}{p_end}
{p2coldent:✝ {opt lb1(#)} {opt ub1(#)} [... {opt lb6(#)} {opt ub6(#)}]}specify lower and upper bounds of event windows{p_end}
{synopt :{opt eswlb:ound(#)}}specify the lower bound of the estimation window; default is the first trading day available{p_end}
{synopt :{opt eswub:ound(#)}}specify the upper bound of the estimation window; default is {cmd:eswubound(-30)}{p_end}
{synopt :{opt modt:ype(string)}}specify the model to compute ARs; {it:string} may be {opt SIM}, {opt MAM}, {opt MFM}, or {opt HMM}; default is {cmd:modtype(SIM)}{p_end}
{p2coldent:+ {opth ind:exlist(varlist)}}specify the {it:varlist} used to compute normal or abnormal returns{p_end}
{synopt :{opt diagn:osticsstat(string)}}specify the diagnostic test; {it:string} may be {opt Norm}, {opt Patell}, {opt ADJPatell}, {opt BMP}, {opt KP}, {opt Wilcoxon}, or {opt GRANK}; default is {cmd:diagnosticsstat(Norm)}{p_end}
{synopt :{opt supp:ress(string)}}suppress part of the output; {it:string} may be {opt ind} or {opt group}{p_end}
{synopt :{opt dec:imal(#)}}set the number of decimals for the output table; default is {cmd:decimal(2)}, maximum is {cmd:decimal(7)}{p_end}
{synopt :{opt showp:values}}add a row below ARs, reporting p-values{p_end}
{synopt :{opt nos:tar}}hide significance stars (and the associated legend) from the output table{p_end}
{synopt :{opt outp:utfile(filename)}}store results in an {cmd:.xlsx} file{p_end}
{synopt :{opt myd:ataset(datasetname)}}store results in a {cmd:.dta} file{p_end}
{synopt :{opt pri:ce}}specify that prices, instead of returns, be provided in {it:varlist1} ... {it:varlistN} as well as in {opt indexlist()}{p_end}
{synopt :{opt tex}}report the output table in TeX format{p_end}
{synopt :{cmd:graph(}{it:# #} [{cmd:, save}]{cmd:)}}graph the cumulative ARs over the customized window as specified by means of the lower and upper bounds; suboption {opt save} stores figure in the directory in use{p_end}
{synopt :{opt d:etails}}show a detailed output, including warning messages, if any{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}* {cmd:datevar()}, {cmd:evdate()}, and {cmd:dateformat()} are
required.{p_end}
{p 4 6 2}✝ Only the first upper ({cmd:ub1()}) and lower ({cmd:lb1()}) bounds are required; the other ones are optional.{p_end}
{p 4 6 2}+ The {cmd:indexlist()} option is contingent on {cmd:modtype()}; see {cmd:modtype()} and {cmd:indexlist()} descriptions below.{p_end}


{marker description}{...}
{title:Description}

{pstd}
{cmd:estudy} performs an event study with and without event-date clustering on
several groups of variables by permitting users to specify multiple
{it:varlist}s over different event windows (up to six).  Both parametric and
nonparametric diagnostic tests are allowed, while the analytical setup as well
as the output's contents and layout can be customized by means of several
options.  Prices can be used as inputs because the command will compute
returns.{p_end}


{marker options}{...}
{title:Options}

{phang}
{opth datevar(varname)} specifies the date variable in the dataset.
{it:varname} must be sorted in chronological order.  The command cannot
perform an event study if the time series of securities' return is not linked
to a date variable.  If the variable reported in {cmd:datevar()} is not
formatted as a date, the command returns an error message.  {cmd:datevar()} is
required.

{phang}
{opt evdate(string)} or {opt evdate(namelist datelist)}, respectively,
specifies the event date (for event-date clustering) or the securities and the
corresponding event dates for multiple events.  {cmd:evdate()} is
required.  Specifically,{p_end}

{pmore}
- with common event date: {opt evdate(string)} specifies the common
  event date.  It must be {it:mmddyyyy}, {it:ddmmyyyy}, or {it:yyyymmdd} when
  {opt dateformat()} is, respectively, {cmd:MDY}, {cmd:DMY}, or {cmd:YMD}.
  {p_end}

{pmore}
- with multiple event dates: {opt evdate(namelist datelist)}, where
  {it:namelist} is a string variable and {it:datelist} is a date variable,
  specifies the multiple event dates.{p_end}

{pmore}
The string variable ({it:namelist}) must include the name of all the variables
specified in {it:varlist1}, ..., {it:varlistN}.{p_end}

{pmore}
The date variable ({it:datelist}) must include the event dates corresponding
to the variables specified in {it:namelist}.{p_end}

{phang}
{opt dateformat(string)} specifies the format of the event date for event-date
clustering.  {cmd:MDY}, {cmd:DMY}, or {cmd:YMD} indicates that the event date
{cmd:evdate()} has been specified, respectively, as {it:mmddyyyy},
{it:ddmmyyyy}, or {it:yyyymmdd}.  For multiple event dates, {cmd:estudy}
ignores the {opt dateformat()} option and returns a warning message.
{cmd:dateformat()} is required.

{phang}
{opt lb1(#)}, {opt ub1(#)}, {opt lb2(#)}, {opt ub2(#)}, ..., {opt lb6(#)}, and
{opt ub6(#)} specify up to six event windows ({cmd:lb1()} and {cmd:ub1()} are
required), the event date being the day 0.  For each event window, both lower
and upper bounds must be specified.  They must be indicated as integer
values.{p_end}

{phang}
{opt eswlbound(#)} and {opt eswubound(#)} specify lower and upper bounds of
the estimation window.  By default, the lower bound is the 1st trading day
available, and the upper bound is the 30th trading day before the
event.{p_end}

{phang}
{opt modtype(string)} specifies the model to compute ARs; {it:string} may be
the following:{p_end}

{phang2}
{cmd:SIM} (single index model), the default, requires to specify only one
variable (factor) in {cmd:indexlist()}.

{phang2}
{cmd:MAM} (market-adjusted model) requires to specify only one variable
(factor) in {cmd:indexlist()}.

{phang2}
{cmd:MFM} (multifactor model) requires to specify more than one variable
(factors) in {cmd:indexlist()}.

{phang2}
{cmd:HMM} (historical mean model) ignores {cmd:indexlist()}.

{phang}
{opt indexlist(varlist)} specifies the variable or variables useful to compute
normal and abnormal components of securities return specified in
{it:varlist1}, ..., {it:varlistN}.  Prices are allowed only if the option
{cmd:price} has been specified.  It is contingent on {cmd:modtype()}:{p_end}

{pmore}
{cmd:modtype(SIM)} and {cmd:modtype(MAM)} require only one variable,
whereas {cmd:modtype(MFM)} requires more than one variable.
{cmd:modtype(HMM)} ignores the command.{p_end}

{phang}
{opt diagnosticsstat(string)} allows to select the statistical test for
the ARs significance (parametric and nonparametric tests are
available).{p_end}

{pmore}
{it:string} for parametric tests may be one of the following:

{phang3} 
{cmd:Norm}, the default, is based on the normal distribution.

{phang3}
{cmd:Patell} performs the test proposed by Patell (1976).

{phang3}
{cmd:ADJPatell} performs the test proposed by Patell (1976) with the Kolari
and Pynn{c o:}nen (2010) adjustment for cross-correlation of ARs.

{phang3}
{cmd:BMP} performs the test proposed by Boehmer, Musumeci, and Poulsen (1991).

{phang3}
{cmd:KP} performs the Boehmer, Musumeci, and Poulsen (1991) test with the
Kolari and Pynn{c o:}nen (2010) adjustment for cross-correlation of ARs.

{pmore}
{it:string} for nonparametric tests may be one of the following:{p_end}

{phang3}
{cmd:Wilcoxon} performs the signed-rank test proposed by Wilcoxon (1945).

{phang3}
{cmd:GRANK} performs the generalized rank test proposed by Kolari and
Pynn{c o:}nen (2011).

{phang}
{opt suppress(string)} sets the format of the output table.  {cmd:ind} hides
single securities from the output table, while {cmd:group} keeps them only; by
default, single securities and average and portfolio ARs are shown.
{cmd:suppress()} cannot be used with only one variable.
Option {cmd:suppress()} is valid for tables exported with
{cmd:outputfile()}, {cmd:mydataset()} options, results stored in the return
list, and graphs generated through the {cmd:graph()} option.

{phang}
{opt decimal(#)} specifies the number of decimals that must be used in the
output table.  The maximum value is {cmd:decimal(7)}.  By default, the number
of decimals is set equal to two.

{phang}
{cmd:showpvalues} specifies that the output table show the p-value of each AR.
When this option is specified, p-values are shown in parentheses below the
corresponding AR.

{phang}
{cmd:nostar} specifies that the output file must not contain the stars
indicating the significance level.  By default, {cmd:***}, {cmd:**}, and
{cmd:*} denote that ARs are statistically significant at the 1%, 5%, and 10%
levels, respectively.

{phang}
{opt outputfile(filename)} specifies the name of the {cmd:.xlsx} file in which
both the ARs (always without significance stars) and the p-values are stored
in two separate sheets.  The format imposed with {cmd:suppress()} is
maintained.  The command automatically replaces the file if it already exists.

{phang}
{opt mydataset(datasetname)} specifies the name of the {cmd:.dta} file in
which ARs (always without significance stars) are stored.  The format imposed
with {cmd:suppress()} is maintained.  The command automatically replaces the
file if it already exists.  The work file, stored in the directory in use,
contains a first variable with the securities' labels and the ARs on each
event window in just as many variables.

{phang}
{cmd:price} must be specified when the input data are securities' and
indices' prices instead of returns.  The command then computes the returns and
runs the event study as specified.  When prices are used, the indices data
({cmd:modtype(SIM)}, {cmd:modtype(MFM)}, and {cmd:modtype(MAM)}) must be
inputed as prices.

{phang}
{cmd:tex} shows the output table in TeX format.

{phang}
{cmd:graph(}{it:# #} [{cmd:, save}]{cmd:)} plots the graph ranging from the
lower bound (that is, the first integer specified) to the upper bound (that
is, the second integer specified) selected.  When the option {cmd:save} is
specified, the graphs will not be shown but will be saved in the working
directory.  Otherwise, the graphs will be shown but not saved.  This option is
contingent on the {cmd:suppress()} option (when specified); if the individual
ARs are suppressed, only group graphs will be created.  Contrarily, if the
portfolio ARs are suppressed, only individual graphs will be created.

{phang}
{cmd:detail} shows the details of the estimation window length and the other
features of the fitted model along with possible warnings that the
community-contributed command issued.


{marker Remarks}{...}
{title:Remarks}

{pstd}
If an event window does not contain any value, the output will show ARs
(p-values) equal to 0 (".").{p_end}

{pstd}
{cmd:estudy} shows messages and warnings (for example, number of observations
in the estimation windows) only if the option {opt details} has been
specified.

{pstd}
If the event date occurs on Saturday or Sunday, {cmd:estudy} substitutes it
with the first following Monday and considers it as (+1) day (the Friday is
considered as -1, accordingly).  If such a date is still not available, the
command terminates showing an error message.

{pstd}
Labels cannot contain the "." character.  Their length is automatically cut to
45 characters (if in excess) or to 32 characters if {cmd:outputfile()},
{cmd:mydataset()}, or both options have been specified.{p_end}

{pstd}
{cmd:estudy} shows in the output tables (and in the {cmd:.xlsx} and {cmd:.dta}
files and return list) the label of each variable indicated in the
{it:varlist1}, ..., {it:varlistN}.  If labels are missing, variable names are
used.{p_end}


{marker examples}{...}
{title:Examples}

{pstd}Setup{p_end}
{phang2}
{cmd:. use examples_estudy}{p_end}

{pstd}
Perform an event study on two {it:varlist}s using returns, specifying three
event windows on a common event date (December 4, 2016), using the Bohemer,
Musumeci, and Paulsen test{p_end}
{phang2}{bf:. estudy ret_ibm ret_cocacola ret_boa ret_ford ret_boeing (ret_apple ret_netflix ret_google ret_facebook),}
{bf:datevar(date) evdate(12042016)}
{bf:dateformat(MDY) modtype(MFM) indexlist(ret_mkt ret_smb ret_hml)}
{bf:diagnosticsstat(BMP) lb1(-3) ub1(0) lb2(0) ub2(5) lb3(-3) ub3(3) decimal(4)}{p_end}

{pstd}
Perform an event study on two {it:varlist}s using returns, specifying two
event windows and multiple event dates, using the adjusted Patell test{p_end}
{phang2}{cmd:. estudy ret_ibm-ret_boeing (ret_apple ret_netflix ret_google}
{bf:ret_facebook), datevar(date) evdate(security_names event_dates) modtype(SIM)}
{bf:indexlist(ret_sp500) diagnosticsstat(ADJPatell) lb1(-3) ub1(3) lb2(-5) ub2(5) decimal(4) showpvalues}{p_end}

{pstd}
Perform an event study on two {it:varlist}s using prices, specifying two event
windows and multiple event dates, using the adjusted Patell test{p_end}
{phang2}{cmd:. estudy pr_ibm-pr_boeing (pr_apple pr_netflix pr_google}
{bf:pr_facebook), datevar(date) evdate(security_names event_dates) modtype(SIM)}
{bf:indexlist(pr_sp500) price diagnosticsstat(ADJPatell) lb1(-3) ub1(3) lb2(-5) ub2(5) decimal(4) showpvalues}{p_end}

{pstd}
Perform an event study on two {it:varlist}s using prices, specifying two event
windows and multiple event dates, using the Bohemer, Musumeci, and Paulsen test
with the Kolari and Pynn{c o:}nen adjustment, printing a LaTeX-formatted
table{p_end}
{phang2}{bf:. estudy pr_ibm-pr_boeing (pr_apple pr_netflix pr_google}
{bf:pr_facebook), datevar(date) evdate(security_names event_dates) modtype(HMM)}
{bf:indexlist(pr_sp500) price diagnosticsstat(KP) lb1(-3) ub1(0) lb2(0) ub2(5) decimal(4) tex}{p_end}

{pstd}
Perform an event study on {it:varlist} using returns, specifying
two event windows on multiple event dates, using the Bohemer, Musumeci, and
Paulsen test with the Kolari and Pynn{c o:}nen adjustment, showing the group
CAAR only and printing it over the [-20 +20] window around the event
dates{p_end}
{phang2}{cmd:. estudy ret_ibm-ret_amazon, datevar(date)}
{bf:evdate(security_names event_dates) modtype(HMM) indexlist(ret_mkt ret_smb}
{bf:ret_hml) diagnosticsstat(KP) suppress(ind) lb1(-3) ub1(0) lb2(-20) ub2(20) decimal(4) graph(-20 20)}{p_end}


{marker storedres}{...}
{title:Stored results}

{phang}
{cmd:estudy} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:r(car)}}estimated CARs{p_end}
{synopt:{cmd:r(pv)}}p-values of estimated CARs{p_end}
{synopt:{cmd:r(sd)}}standard deviation of the test{p_end}
{synopt:{cmd:r(stats)}}values of the statistical tests adopted{p_end}
{synopt:{cmd:r(ars)}}time series of estimated ARs{p_end}


{marker references}{...}
{title:References}

{* Journal misspelled Jim Musumeci's name using a -a- instead of a -u-; see https://www.linkedin.com/in/jim-musumeci-01442636}{...}
{marker BMP1991}{...}
{phang}
Boehmer, E., J. Musumeci, and A. B. Poulsen. 1991. Event-study methodology
under conditions of event-induced variance.
{it:Journal of Financial Economics} 30: 253-272.
{browse "https://doi.org/10.1016/0304-405X(91)90032-F"}.

{marker KP2010}{...}
{phang}
Kolari, J. W., and S. Pynn{c o:}nen. 2010. Event study testing with
cross-sectional correlation of abnormal returns.
{it:Review of Financial Studies} 23: 3996-4025.
{browse "https://doi.org/10.1093/rfs/hhq072"}.

{marker KP2011}{...}
{phang}
------. 2011. Nonparametric rank tests for event studies.
{it:Journal of Empirical Finance} 18: 953-971.
{browse "https://doi.org/10.1016/j.jempfin.2011.08.003"}.

{marker PAT1976}{...}
{phang}
Patell, J. M. 1976. Corporate forecasts of earnings per share and stock price
behavior: Empirical test.  {it:Journal of Accounting Research} 14: 246-276.
{browse "https://doi.org/10.2307/2490543"}.

{marker WX1945}{...}
{phang}
Wilcoxon, F. 1945. Individual comparisons by ranking methods.
{it:Biometrics Bulletin} 1: 80-83.
{browse "https://doi.org/10.2307/3001968"}.


{marker authors}{...}
{title:Authors}

{pstd}
Fausto Pacicco{break}
LIUC -- Universit{c a'} Carlo Cattaneo{break}
Castellanza, Italy{break}
fpacicco@liuc.it

{pstd}
Luigi Vena{break}
LIUC -- Universit{c a'} Carlo Cattaneo{break}
Castellanza, Italy{break}
lvena@liuc.it

{pstd}
Andrea Venegoni{break}
LIUC -- Universit{c a'} Carlo Cattaneo{break}
Castellanza, Italy{break}
avenegoni@liuc.it


{marker alsosee}{...}
{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 21, number 4: {browse "https://doi.org/10.1177/1536867X211063150":st0532_3}{p_end}
