
 set ns	[new Simulator]

 set n0	[$ns node]
 set n1	[$ns node]

 $ns at	0.0 "$n0 label	Sender"
 $ns at	0.0 "$n1 label	Receiver"

 set nf	[open sliding.nam w]
 $ns namtrace-all $nf

set f1 [open slide.tr w]
$ns trace-all $f1


$ns duplex-link	$n0 $n1	0.2Mb 200ms DropTail
$ns queue-limit	$n0 $n1	10

set tcp	[new Agent/TCP]
$tcp set windowInit_ 4
$tcp set maxcwnd_ 4
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n1 $sink
$ns connect $tcp $sink

set ftp	[new Application/FTP]
$ftp attach-agent $tcp


$ns at 0.1 "$ftp start"
$ns at 3.0 "$ftp stop"
$ns at 3.5 "finish"

 proc finish {} {
global ns nf f1
$ns flush-trace
close $nf
exec nam sliding.nam	&
exit 0
}

$ns run
