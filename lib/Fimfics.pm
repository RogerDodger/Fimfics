package Fimfics;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
    ConfigLoader
    Static::Simple
/;

extends 'Catalyst';

our $VERSION = 'v0.1.0';

__PACKAGE__->config(
    name => 'Fimfics',

    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1,
);

# Start the application
__PACKAGE__->setup();


=head1 NAME

Fimfics - Catalyst based application

=head1 SYNOPSIS

    script/fimfics_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Fimfics::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Cameron Thornton E<lt>cthor@cpan.orgE<gt>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
