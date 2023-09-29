requires 'Moose';
requires 'MooseX::Daemonize::Pid::File';
requires 'namespace::autoclean';
requires 'Config::General';
requires 'Term::Size::Any';

requires 'DBD::Pg';
requires 'App::Sqitch';

requires 'Catalyst::Runtime' => '5.90131';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';

on test => sub {
  requires 'Test::More' => '0.88';
};
