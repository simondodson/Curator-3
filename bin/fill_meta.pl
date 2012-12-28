
use strict;
use warnings;

use File::Find;
use File::Basename qw( basename );
use File::Spec::Functions qw( catfile );
use YAML qw( LoadFile DumpFile );
use Getopt::Long;

GetOptions(
    'comic!' => \( my $comic ),
);

my ( $source_file, @destinations ) = @ARGV;

my $meta = LoadFile( $source_file );

for my $dest ( @destinations ) {
    my $dest_file = catfile( $dest, 'metadata.yml' );
    if ( -e $dest_file ) {
        warn "File already exists: $dest_file. Skipping...\n";
        next;
    }
    if ( $comic ) {
        # Determine issue number from destination folder
        my $issue;
        my $title = basename( $dest );
        if ( $title =~ /#/ ) {
            ( $issue ) = $title =~ /#(\d+)/;
        }
        else {
            # If no #, the first number we see
            ( $issue ) = $title =~ /(\d+)/;
        }
        $meta->{title} =~ s/#\d+/#$issue/;
    }
    DumpFile( $dest_file, $meta );
}

