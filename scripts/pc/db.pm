
#require pcenvs;

use constant DOCROOT => "../../";

use DBI;
use YAML::XS;


sub connect{
	print "Connecting to Database......";
}

sub sqlQuery{
	
	#([%rows])
	my $query=$_[0];
	print $query;

}

sub export{

	my $filename = $_[0];
	if(!defined($filename)){
		$filename=DOCROOT."db/".time.".export";
	}
	print $filename;
}

1;
