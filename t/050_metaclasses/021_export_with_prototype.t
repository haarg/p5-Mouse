use lib "t/lib";
# This is automatically generated by author/import-moose-test.pl.
# DO NOT EDIT THIS FILE. ANY CHANGES WILL BE LOST!!!
use t::lib::MooseCompat;
package MyExporter::User;
use MyExporter;

use Test::More;
use Test::Exception;
{ local $TODO = q{Mouse does not support with_meta option in the exporter};
lives_and {
    with_prototype {
        my $caller = caller(0);
        is($caller, 'MyExporter', "With_caller prototype code gets called from MyMouseX");
    };
} "check function with prototype";
} # end of TODO
lives_and {
    as_is_prototype {
        my $caller = caller(0);
        is($caller, 'MyExporter', "As-is prototype code gets called from MyMouseX");
    };
} "check function with prototype";

done_testing;