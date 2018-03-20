#sh_command=  compile-verilog.sh
if (! (pip3 show -q when-changed))
then
  pip3 install https://github.com/joh/when-changed/archive/master.zip
fi
sh compile-verilog.sh
when-changed ./src -v -c sh compile-verilog.sh