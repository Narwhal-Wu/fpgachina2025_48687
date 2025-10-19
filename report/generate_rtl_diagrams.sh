#!/bin/bash
# RTL Diagram Generation Script
# This script generates RTL diagrams for the five-stage pipeline processor and SoC

set -e

# Define paths
RTL_DIR="/home/runner/work/LibreCore/LibreCore/librecore/tests/rtl"
REPORT_DIR="/home/runner/work/LibreCore/LibreCore/report"
DIAGRAM_DIR="${REPORT_DIR}/rtl_diagrams"

# Create output directory
mkdir -p "${DIAGRAM_DIR}"

echo "=== RTL Diagram Generation ==="
echo "RTL Source: ${RTL_DIR}"
echo "Output Directory: ${DIAGRAM_DIR}"
echo ""

# Function to generate diagram for a module
generate_diagram() {
    local module_name=$1
    local verilog_files=$2
    local top_module=$3
    
    echo "Generating diagram for ${module_name}..."
    
    # Create Yosys script
    cat > /tmp/yosys_${module_name}.ys <<EOF
# Read Verilog files
${verilog_files}

# Elaborate design
hierarchy -check -top ${top_module}

# Generate processes
proc

# Optimize
opt

# Show design structure
show -prefix ${DIAGRAM_DIR}/${module_name} -format dot -colors 1 -width ${top_module}
EOF

    # Run Yosys
    yosys -s /tmp/yosys_${module_name}.ys > /tmp/yosys_${module_name}.log 2>&1
    
    # Convert DOT to SVG and PNG
    if [ -f "${DIAGRAM_DIR}/${module_name}.dot" ]; then
        dot -Tsvg "${DIAGRAM_DIR}/${module_name}.dot" -o "${DIAGRAM_DIR}/${module_name}.svg"
        dot -Tpng "${DIAGRAM_DIR}/${module_name}.dot" -o "${DIAGRAM_DIR}/${module_name}.png"
        echo "  ✓ Generated ${module_name}.svg and ${module_name}.png"
    fi
}

# 1. Generate diagram for Fetch stage
generate_diagram "1_fetch" \
    "read_verilog ${RTL_DIR}/fetch.v" \
    "fetch"

# 2. Generate diagram for Decode stage
generate_diagram "2_decode" \
    "read_verilog ${RTL_DIR}/decode.v" \
    "decode"

# 3. Generate diagram for Execute stage
generate_diagram "3_execute" \
    "read_verilog ${RTL_DIR}/execute.v" \
    "execute"

# 4. Generate diagram for Memory stage
generate_diagram "4_memory" \
    "read_verilog ${RTL_DIR}/memory.v" \
    "memory"

# 5. Generate diagram for Writeback stage
generate_diagram "5_writeback" \
    "read_verilog ${RTL_DIR}/writeback.v" \
    "writeback"

# 6. Generate diagram for complete CPU (myCPU)
generate_diagram "6_myCPU" \
    "read_verilog -sv ${RTL_DIR}/myCPU.sv
read_verilog ${RTL_DIR}/fetch.v
read_verilog ${RTL_DIR}/decode.v
read_verilog ${RTL_DIR}/execute.v
read_verilog ${RTL_DIR}/memory.v
read_verilog ${RTL_DIR}/writeback.v" \
    "myCPU"

# 7. Generate diagram for AHB interconnect
generate_diagram "7_ahb_interconnect" \
    "read_verilog ${RTL_DIR}/AHB_interconnect.v
read_verilog ${RTL_DIR}/AHB_decoder.v
read_verilog ${RTL_DIR}/AHB_multiplexor.v" \
    "AHB_interconnect"

# 8. Generate diagram for AHB BRAM controller
generate_diagram "8_ahb_bram_controller" \
    "read_verilog ${RTL_DIR}/AHB_bram_controller_simple.v" \
    "AHB_bram_controller"

# 9. Generate diagram for AHB IROM controller
generate_diagram "9_ahb_irom_controller" \
    "read_verilog ${RTL_DIR}/AHB_irom_controller_simple.v" \
    "AHB_irom_controller"

echo ""
echo "=== Diagram Generation Complete ==="
echo "Diagrams saved to: ${DIAGRAM_DIR}"
echo ""
echo "Generated files:"
ls -lh "${DIAGRAM_DIR}" | grep -E '\.(svg|png|dot)$' || echo "No diagram files found"
