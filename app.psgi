use Plack::Builder;

my $app = sub {
    my $env = shift;


    local $SIG{TERM} = sub {
        warn "TERM called but captured!!!!";
    } unless $$ % 10;

    sleep(10);

    return [200,  [ 'Content-Type' => 'text/html' ], ["$$"]];
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
