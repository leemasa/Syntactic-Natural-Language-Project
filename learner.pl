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
			if ($line =~ m/-->/){
				if ($pos eq ''){
					my @splitup = split(/\(/,$line);
					$pos = $splitup[0];
					$taglist{$pos}[0] = ();		
				}
				my @splitup2 = split(/[\(\)]/,$line);
				my $word = $splitup2[2];
				push (@{ $taglist{$pos}},$word);
			}
			else {
				$pos = '';
			}
		}
		if ($line =~ m/%vocab list/){
			$start = 1;
		}
	}
	return %taglist;
}

sub hl_search{
	my $search = shift @_;
	my %taglist = @_;

	for my $key (keys %taglist){
		my @array = @{$taglist{$key}};
		for my $value (@array){
		 if ($search eq $value){
			return $key;
			}
		} 
	}
	return 'nothing';
}

my $VLIST = "vocab.pro";
my $FILE;

open $FILE, "<", $VLIST or die $!;
my %taglist = getvocab $FILE;
close $FILE;

print hl_search('writes',%taglist);

#my @cl = <STDIN>;
#my $u = join(',',@cl);
