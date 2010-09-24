use strict;
use warnings;

use Test::More;
use Test::Exception;

use Mouse ();
use Mouse::Meta::Class;
use Mouse::Util::MetaRole;

{
    package Foo;
    use Mouse;
}

{
    package Role::Bar;
    use Mouse::Role;
}

my $anon_name;

{
    my $anon_class = Mouse::Meta::Class->create_anon_class(
        superclasses => ['Foo'],
        cache        => 1,
    );

    $anon_name = $anon_class->name;

    ok( $anon_name->meta, 'anon class has a metaclass' );
}

ok(
    $anon_name->meta,
    'cached anon class still has a metaclass after \$anon_class goes out of scope'
);

Mouse::Util::MetaRole::apply_metaroles(
    for             => $anon_name,
    class_metaroles => {
        class => ['Role::Bar'],
    },
);

BAIL_OUT('Cannot continue if the anon class does not have a metaclass')
    unless $anon_name->can('meta');

my $meta = $anon_name->meta;
ok( $meta, 'cached anon class still has a metaclass applying a metarole' );

done_testing;
