#!/usr/bin/perl -w
use strict;
use DBI;

my $host="localhost";
my $database="elektro";

my $user="perl";
my $pass="perl";


my $dsn = "DBI:mysql:database=$database;host=$host";

my $filename;

if(!defined $ARGV[0]){
	$filename="dbexport.csv";
}else{
	$filename = $ARGV[0];
}


my $dbh = DBI::->connect($dsn, $user, $pass, {'RaiseError' => 1, 'AutoCommit' => 1}) or die DBI::errstr;

my $sql = qq(show tables);
my $sth = $dbh->prepare($sql);
$sth->execute() or die $sth->errstr();

my @tables;
while(my @row=$sth->fetchrow_array()){
	push(@tables,$row[0]);
}
$sth->finish();

open(CSV,">".$filename);

for(@tables){
   
	print CSV "===TABLE===>".$_."\n";
	
	$sth = $dbh->prepare("SELECT * FROM $_");
	$sth->execute() or die $sth->errstr();
	
	while(my @rows=$sth->fetchrow_array()){
		my $row="";
		for(@rows){
			$row .= $_.",";
		}
		chomp($row);
		$row .= "\n";
		print CSV $row;
	}
}

$dbh->disconnect();
close(CSV);
