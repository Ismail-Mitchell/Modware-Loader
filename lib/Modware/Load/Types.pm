package Modware::Load::Types;

use MooseX::Types -declare => [qw/DataDir DataFile FileObject Dsn/];
use MooseX::Types::Moose qw/Str Int/;
use Path::Class::File;

subtype DataDir,  as Str, where { -d $_ };
subtype DataFile, as Str, where { -f $_ };
subtype FileObject, as class_type('Path::Class::File');
subtype Dsn, as Str, where {/^dbi:(\w+).+$/};

coerce FileObject, from Str, via { Path::Class::File->new($_) };

1;

