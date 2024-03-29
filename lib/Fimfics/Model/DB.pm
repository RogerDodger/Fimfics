package Fimfics::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';
use FindBin '$Bin';

__PACKAGE__->config(
	schema_class => 'Fimfics::Schema',

	connect_info => {
		dsn => "dbi:SQLite:$Bin/../Fimfics.db",
		user => '',
		password => '',
		sqlite_unicode => q{1},
		on_connect_do => q{PRAGMA foreign_keys = ON},
	}
);

=head1 NAME

Fimfics::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<Fimfics>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<Fimfics::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.59

=head1 AUTHOR

Cameron

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
