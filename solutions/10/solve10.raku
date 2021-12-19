my $FILE_NAME = "test.txt";

my $fh = open $FILE_NAME, :r;
my @contents = $fh.slurp.chomp.split("\n");
$fh.close;

grammar Balanced {
    rule TOP {
        <expression>+
    }
    rule expression {
        | '{' '}'
        | '[' ']'
        | '(' ')'
        | '<' '>'
        | '{' <expression>* '}'
        | '(' <expression>* ')'
        | '[' <expression>* ']'
        | '<' <expression>* '>'
    }
}

for @contents -> $line {
    my $result = Balanced.parse($line);
	say $line;
	say $result ?? "balanced" !! "not balanced";
}

