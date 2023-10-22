package siderDB::Types;

use Moose::Util::TypeConstraints;

subtype 'My:SearchTable'
    => as 'HashRef'
    => where {
        exists $_->{title}
        && exists $_->{model}
        && exists $_->{find}
        && ref $_->{find} eq 'CODE'
    }
    => message { "'$_' is not a SearchTable object" };

1;
