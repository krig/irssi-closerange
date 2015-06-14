use strict;
use vars qw($VERSION %IRSSI);
use Irssi;

$VERSION = '0.0.1';
%IRSSI = (
   authors      =>   "Kristoffer Gronlund (krig)",
   contact      =>   "krig@koru.se",
   name         =>   "Close window range",
   description  =>   "Close all windows from lo to hi",
   license      =>   "GNU General Public License v2",
   url          =>   "http://github.com/krig/irssi-closerange",
   changed      =>   "Sun Jun 14 12:00 CET 2015",
);

# Usage: /WINDOW CLOSERANGE <lo> <hi>
sub cmd_closerange {
   my ($data, $server, $witem) = @_;
   if ($data =~ /(\d+) (\d+)/) {
      my $lo = $1;
      my $hi = $2;
      for (Irssi::windows()) {
         next if $_->{refnum} < $lo;
         next if $_->{refnum} > $hi;
         Irssi::command("window close $_->{refnum}");
      }
   }
}

Irssi::command_bind("window closerange", "cmd_closerange");
