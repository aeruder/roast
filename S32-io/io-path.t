use v6;
use Test;

plan 12;

my $path = '/foo/bar.txt'.path;
isa_ok $path, IO::Path, "Str.path returns an IO::Path";
#?rakudo 1 try '.volume NYI'
is $path.volume,    '',        'volume';
is $path.directory, '/foo',    'directory';
is $path.basename,  'bar.txt', 'basename';
#?rakudo 2 try '.parent NYI'
is $path.parent,    '/foo',    'parent';
is $path.parent.parent, '/',   'parent of parent';
#?rakudo 2 try '.is-absolute, .is-relative NYI'
is $path.is-absolute, True,    'is-absolute';
is $path.is-relative, False,   'is-relative';

isa_ok $path.path, IO::Path, 'IO::Path.path returns IO::Path';
is '/'.path.Str,        '/',       '.path.Str roundtrips';
is '///.'.path.Str,     '///.',    '... even for weird cases';
is 'foo/bar'.path.Str,  'foo/bar', 'roundtrips entire path';
