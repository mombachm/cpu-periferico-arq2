RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "${YELLOW}Compiling verilog...${NC}"
if(iverilog -o out.vvp src/testbench.v && vvp out.vvp)
then
  echo "\n${GREEN}Verilog compiled with success.${NC}"
else
  echo "${RED}Error when compiling Verilog.${NC}"
fi
if (! (ps aux | grep Scansion | grep -v grep > /dev/null))
then
    open -a Scansion dump.vcd
fi
echo "\nWaiting for files change...\n"
exit 1
