#! /usr/bin/perl
# Marti Cuquet 2009
#
# latex2html has a bug for paths with spaces.
# This script tries to circumvent it by creating a link in a temporal
# directory an running latex2html on it.

# Command line name for latex2html:
$c = "latex2html";
# Temporal directory:
$t = "$ENV{HOME}/tmp/$c";


$f = @ARGV[$#ARGV];
if ($f =~ /^-/) {
    system ("$c", "@ARGV");
    exit;
}
$d = `pwd`; chop $d;
unless ($d =~ / +/) {
    system ("$c", "@ARGV");
    exit;
}
push @args, @ARGV[0..$#ARGV-1];

print "---> path name has spaces, circumventing bug\n";

print "---> preparing tmp dir\n";

mkdir "$ENV{HOME}/tmp" unless (-d "$ENV{HOME}/tmp");
mkdir $t;
chdir $t;
system ("rm", "$f") if (-f $f);
system ("ln", "$d/$f", "$f");

print "---> starting real $c\n";

system ("$c", "@args", "$f");

$f =~ s/\.tex//;

print "---> moving results to $d/$f (overwriting)\n";

system ("rm", "-r", "$d/$f") if (-d "$d/$f");
system ("mv", "$f", "$d");
chdir $d;
system ("rm", "-r", "$t");

print "---> done\n";
