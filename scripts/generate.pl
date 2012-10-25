#!/usr/bin/perl -w

use warnings;
use strict;

my $argc = @ARGV;

if($argc==0){
	help();
	exit 1;
}else{
	if($ARGV[0] eq "model"){
		genModel(@ARGV[1..$argc]);
	}else{
		help("default");
	}

}






sub genModel{
	print "generate Model...\n";
	print @_;
}

sub genController{
	print "generate controller...\n";
}


sub help{
	if(!defined $_[0]){
		help("default");
	}elsif($_[0] eq "controller"){
	print <<"EOF_CONTROLLER"
Generate a controller with given functions.

Usage:
	$0 controller name [methods]...
	
Example:
	$0 controller blog index show new edit create update destroy

EOF_CONTROLLER

}elsif($_[0] eq "model"){
	print <<"EOF_MODEL";
Generate a DB-Model with given fields.

Usage:
	$0 model [options]...

EOF_MODEL

}else{
	print <<"EOF";
Usage:
	$0 [module] [options]...

	module:
		model
		controller
EOF

}

}
