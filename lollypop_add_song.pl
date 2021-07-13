#!/usr/bin/perl -w

my $db = "$ENV{HOME}/.local/share/lollypop/lollypop.db";
my $theme = "$ENV{HOME}/.config/rofi/themes/pastel_lollypop.rasi";
my $query = q{select tracks.id, tracks.name, artists.name from tracks
    join track_artists on track_artists.track_id = tracks.id
    join artists on track_artists.artist_id = artists.id
    order by popularity desc;};

my @all = split "\n", `echo "$query" | sqlite3 $db`;

my %seen = ();
my @songs = grep { ! $seen{substr $_, 0, 3} ++ } @all;

my @names = ("  Play next");
my %ids = ();

# refactoring names
foreach $song (@songs) {
    s/Ft.*\|/|/g, s/\(.*?\)//g, s/\|/+/, s/\|/ -  / for $song;
    my @temp = split('\+', $song);
    $temp[1] = "  " . $temp[1];
    $ids{$temp[1]} = $temp[0];
    push(@names, $temp[1]);
}

# get current playing song
my ($song, $artist) = grep /title|artist/, split "\n", `pactl list`;
s/.*?\"//, s/\(.*?\)|\"//g, s/[fF]t.*//g, s/\s+$//, chomp for $song, $artist;
$artist =~ s/ & /, /;

# add current song info to rofi menu placeholder
open(FH, '<' . $theme) or die "Unable to open\n";
while(<FH>) {
    $_ =~ s/\".*\"/\"\t        $song - $artist\"/ if $_ =~ /place/;
    $file .= $_;
}

open(FH, '>' . $theme) or die "Unable to open\n";
print FH $file;

my $total = scalar %ids;
my $joined_names = join "\n", @names;
my $rofi_command = "-p '   Add song to Queue ($total)' -i -theme $theme";
chomp(my $var = `echo "$joined_names" | rofi -dmenu $rofi_command`);

unless ($var) { exit }
if($var eq "  Play next") {
    system('notify-send "Next"; lollypop -n');
} else {
    system(qq{notify-send "Added: $var"; lollypop -m $ids{$var}});
}

