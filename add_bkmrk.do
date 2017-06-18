proc add_wave_zoom {stime num} {
 echo "Bookmarking wave $num"
 bookmark add wave "bk$num"	"[expr $stime - 50] [expr $stime + 100]" 0
}

add wave -r /*
when {clk'event and clk='1'} {
  echo "Count is [exa count]"
  if {[examine count]=="00100111"} {
	add_wave_zoom $now 1
   } elseif {[examine count]=="01000111"} {
	add_wave_zoom @now 2
   }
}