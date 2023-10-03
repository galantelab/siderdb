requires 'Moose';
requires 'MooseX::Daemonize::Pid::File';
requires 'MooseX::NonMoose' => '0.25';
requires 'namespace::autoclean';
requires 'Config::General';
requires 'Term::Size::Any';

requires 'DBD::Pg';
requires 'App::Sqitch';

requires 'DBIx::Class' => '0.082840';
requires 'DBIx::Class::Schema::Loader';

requires 'Catalyst::Runtime' => '5.90131';
requires 'Catalyst::Helper';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Helper::Model::DBIC::Schema';

on test => sub {
  requires 'Test::More' => '0.88';
};
