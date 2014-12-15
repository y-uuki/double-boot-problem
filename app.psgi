use Plack::Builder;
use DBI;

my $app = sub {
    my $env = shift;

    my $dbh = DBI->connect('dbi:mysql:dbname=dbp;host=localhost', 'nobody', 'nobody', {
        AutoCommit => 1,
        PrintError => 0,
        RaiseError => 1,
        ShowErrorStatement => 1,
        AutoInactiveDestroy => 1,
    }) or $dbh->errstr;

    my $sth = $dbh->prepare('SELECT SLEEP(?)');
    $sth->execute(10) or die $sth->errstr;
    $sth->finish;

    $dbh->disconnect or die $dbh->errstr;

    return [200,  [ 'Content-Type' => 'text/html' ], \()];
};

builder {
    enable 'AxsLog',
        ltsv => 1,
        response_time => 1,
        logger => sub {
            print($@);
        };
    $app;
};
