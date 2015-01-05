!/bin/bash
exec 2>&1

export PATH=/opt/perl-5.14.2/bin:$PATH
export PLACK_ENV=production
export APPROOT=/home2/apache/double-boot-problem
export CPAN_INSTALL_PATH=$APPROOT/local
export PERL5LIB=$CPAN_INSTALL_PATH/lib/perl5

exec perl $CPAN_INSTALL_PATH/bin/start_server --port=5000 --enable-auto-restart=1 --auto-restart-interval=10 -- $APPROOT/script/app.sh
