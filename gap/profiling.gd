#
# profiling: Line by line profiling and code coverage for GAP
#
# Declarations
#

#! @Chapter Functionality provided by the &profiling; package

#! @Section Reading line-by-line profiles

#! @Arguments filename
#! @Description
#!   Read <A>filename</A>, a line by line profile which was previously generated
#!   by GAP, using ProfileLineByLine or CoverageLineByLine functions from core GAP.
#!   A parsed profile can be transformed into a human-readable form using either
#!   <Ref Func="OutputAnnotatedCodeCoverageFiles"/> or
#!   <Ref Func="OutputFlameGraph"/>
DeclareGlobalFunction( "ReadLineByLineProfile" );

#! @Arguments filenames
#! @Description
#!   Read <A>filenames</A>, a list of line by line profiles which were previously
#!   generated by GAP, using ProfileLineByLine or CoverageLineByLine functions
#!   from core GAP. The elements of <A>filenames</A> can be either filenames,
#!   or files previously parsed by <Ref Func="ReadLineByLineProfile"/>.
DeclareGlobalFunction( "MergeLineByLineProfiles" );



#! @Section Generating flame graphs
#!
#! A 'flame graph' is a method of visualising where time is spent by a program.


#! @Arguments codecover [, filename]
#! @Description
#!   Generate an 'svg' file which represents a 'flame graph', a method of visualising
#!   where time is spent by a program.
#!   <P/>
#!   <A>codecover</A> should either be a profile previously read by
#!   <F>ReadLineByLineProfile</F>, or the filename of a profile.
#!   <P/>
#!   The flame graph input will be written to <A>filename</A> (or returned as a
#!   string if <A>filename</A> is not present).
DeclareGlobalFunction("OutputFlameGraph");

#! @Arguments codecover [, filename]
#! @Description
#!   Generate the input required to draw a 'flame graph', a method of visualising
#!   where time is spent by a program. One program for drawing flame graphs using
#!   this output can be found at <URL>https://github.com/brendangregg/FlameGraph</URL>
#!   <P/>
#!   <A>codecover</A> should either be a profile previously read by
#!   <F>ReadLineByLineProfile</F>, or the filename of a profile.
#!   <P/>
#!   The flame graph input will be written to <A>filename</A> (or returned as a
#!   string if <A>filename</A> is not present).
DeclareGlobalFunction("OutputFlameGraphInput");


#! @Section Generating coverage reports

#! @Arguments codecover, [indir,] outdir
#! @Description
#!   Takes a previously generated profile and outputs HTML which shows which lines
#!   of code were executed, and (if this was originally recorded) how long was spent
#!   executing these lines of code.
#!   <P/>
#!   <A>codecover</A> should either be a profile previously read by
#!   <F>ReadLineByLineProfile</F>, or the filename of a profile which will first
#!   be read with <F>ReadLineByLineProfile</F>.
#!   <P/>
#!   Files will be written to the directory <A>outdir</A>.
#!   <P/>
#!   The optional second argument gives a filter, only information about filenames
#!   starting with <A>indir</A> will be outputted.
DeclareGlobalFunction("OutputAnnotatedCodeCoverageFiles");

#! @Arguments cover, outfile
#! @Description
#!   Takes a previously generated profile and outputs a json coverage file which is
#!   amongst other things accepted by codecov.io.
#!   <P/>
#!   <A>codecover</A> should either be a profile previously read by
#!   <F>ReadLineByLineProfile</F>, or the filename of a profile which will first
#!   be read with <F>ReadLineByLineProfile</F>.
#!   <P/>
#!   The output will be written to the file <A>outfile</A>.
#!   <P/>
DeclareGlobalFunction("OutputJsonCoverage");

#! @Arguments cover, outfile, pathtoremove[, opt]
#! @Description
#!   Takes a previously generated profile and outputs a json coverage file which is
#!   accepted by coveralls.io.
#!   <P/>
#!   <A>cover</A> should either be a profile previously read by
#!   <F>ReadLineByLineProfile</F>, or the filename of a profile which will first
#!   be read with <F>ReadLineByLineProfile</F>.
#!   <A>pathtoremove</A> is the path to the tested repository;
#!   this path prefix will be removed from all filenames in <A>cover</A>.
#!   Finally, <A>opt</A> is a record. Its key/value pairs are directly inserted into
#!   the produced JSON, in the form of a JSON dictionary. This can be used to
#!   set the <C>service_name</C>, <C>service_job_id</C>, and more. If this record
#!   is not given, we try to guess the correct values based on the environment
#!   (currently only supported for Travis and AppVeyor).
#!   <P/>
#!   The output will be written to the file <A>outfile</A>.
#!   <P/>
DeclareGlobalFunction("OutputCoverallsJsonCoverage");

#! @Section Miscellaneous

#! @Arguments function, arguments
#! @Description
#!   Calls <A>function</A> with the list of arguments <A>arguments</A>,
#!   and opens a time profile of the resulting call in the default web
#!   browser.
#!   <P/>
DeclareGlobalFunction("LineByLineProfileFunction");
