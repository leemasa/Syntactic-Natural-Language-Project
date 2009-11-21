use strict;

sub getvocab{
	my ($F) = @_;

	my $pos = ''; #Part of Speech
	my %taglist = ();
	my $start = 0;
	
	while (my $line = <$F>)
	{	
		#print;
		if ($start == 1){
			if ($line ne ''){
				if ($pos == ''){
					my @splitup = split(/\(/,$line);
					
					$pos = $splitup[0];
					$taglist{$pos}[0] = ();		
				}
				my $word = @{split(/[\(\)]/,$line)}[2];
				push (@{ $taglist{$pos}},$word);
			}
			else {
				$pos == '';
			}
		}
		if (index ($line,'%vocab list') == 0){
			$start = 1;
		}
	}
	return %taglist;
}


my $VLIST = "vocab.pro";

my $FILE;

open $FILE, "<", $VLIST or die $!;
my %taglist = getvocab $FILE;
close $FILE;

my @cl = <STDIN>;

for (my $i = 0; $i < scalar(@cl); $i++){
		
}

my $u = join(',',@cl);


