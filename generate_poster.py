#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Competition Poster Generator for OpenRV Project
Generates a PDF poster for the National College Student Embedded Chip and System Design Competition
"""

from reportlab.lib.pagesizes import A1, landscape
from reportlab.lib.units import mm, cm
from reportlab.pdfgen import canvas
from reportlab.lib.colors import HexColor, white, black
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.utils import ImageReader
import os

# Color scheme - Modern tech colors
COLOR_PRIMARY = HexColor('#1E3A8A')      # Deep blue
COLOR_SECONDARY = HexColor('#3B82F6')    # Bright blue
COLOR_ACCENT = HexColor('#10B981')       # Green
COLOR_DARK = HexColor('#1F2937')         # Dark gray
COLOR_LIGHT = HexColor('#F3F4F6')        # Light gray
COLOR_HIGHLIGHT = HexColor('#F59E0B')    # Orange

def register_fonts():
    """Register system fonts for Chinese support"""
    try:
        # Try to find Chinese fonts on the system
        font_paths = [
            '/usr/share/fonts/truetype/wqy/wqy-microhei.ttc',
            '/usr/share/fonts/truetype/droid/DroidSansFallbackFull.ttf',
            '/usr/share/fonts/truetype/noto/NotoSansCJK-Regular.ttc',
            '/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc',
        ]
        
        for font_path in font_paths:
            if os.path.exists(font_path):
                pdfmetrics.registerFont(TTFont('ChineseFont', font_path))
                print(f"Registered font: {font_path}")
                return 'ChineseFont'
    except Exception as e:
        print(f"Warning: Could not register custom font: {e}")
    
    return 'Helvetica'

def draw_header(c, width, height, font_name):
    """Draw the header section with competition title"""
    # Background bar for header
    c.setFillColor(COLOR_PRIMARY)
    c.rect(0, height - 120*mm, width, 120*mm, fill=1, stroke=0)
    
    # Competition title
    c.setFillColor(white)
    c.setFont(font_name, 28)
    c.drawCentredString(width/2, height - 35*mm, 
                        "2025年全国大学生嵌入式芯片与系统设计竞赛")
    
    c.setFont(font_name, 24)
    c.drawCentredString(width/2, height - 55*mm,
                        "FPGA创新设计大赛 · AMD赛道")
    
    c.setFont(font_name, 20)
    c.drawCentredString(width/2, height - 75*mm,
                        "自主选题 · 初级赛道")
    
    # Decorative line
    c.setStrokeColor(COLOR_ACCENT)
    c.setLineWidth(3)
    c.line(width/2 - 150*mm, height - 85*mm, width/2 + 150*mm, height - 85*mm)
    
    # Project name banner
    c.setFillColor(COLOR_ACCENT)
    c.rect(width/2 - 200*mm, height - 110*mm, 400*mm, 20*mm, fill=1, stroke=0)
    
    c.setFillColor(white)
    c.setFont('Helvetica-Bold', 36)
    c.drawCentredString(width/2, height - 105*mm, "OpenRV")
    
    c.setFont(font_name, 18)
    c.drawCentredString(width/2, height - 122*mm, 
                        "基于RISC-V的五级流水线处理器及SoC系统")

def draw_team_info(c, x, y, font_name):
    """Draw team information box"""
    box_width = 200*mm
    box_height = 50*mm
    
    # Box background
    c.setFillColor(COLOR_LIGHT)
    c.roundRect(x, y, box_width, box_height, 10*mm, fill=1, stroke=0)
    
    # Border
    c.setStrokeColor(COLOR_SECONDARY)
    c.setLineWidth(2)
    c.roundRect(x, y, box_width, box_height, 10*mm, fill=0, stroke=1)
    
    # Team info
    c.setFillColor(COLOR_DARK)
    c.setFont(font_name, 16)
    c.drawString(x + 15*mm, y + box_height - 15*mm, "团队名称：自由内核 (LibreCore)")
    c.drawString(x + 15*mm, y + box_height - 30*mm, "作品名称：OpenRV")
    c.drawString(x + 15*mm, y + box_height - 45*mm, "目标器件：Xilinx Artix-7 (NEXYS A7)")

def draw_abstract_section(c, x, y, width, font_name):
    """Draw project abstract"""
    section_height = 85*mm
    
    # Section title
    c.setFillColor(COLOR_PRIMARY)
    c.setFont(font_name, 20)
    c.drawString(x, y + section_height - 15*mm, "项目摘要")
    
    # Underline
    c.setStrokeColor(COLOR_ACCENT)
    c.setLineWidth(2)
    c.line(x, y + section_height - 17*mm, x + 80*mm, y + section_height - 17*mm)
    
    # Abstract text
    c.setFillColor(COLOR_DARK)
    c.setFont(font_name, 12)
    
    abstract_lines = [
        "本项目实现了一颗轻量的RISC-V RV32I五级流水线软核及最小SoC系统。",
        "软核承担\"软件+CPU\"的控制面角色，通过软件灵活编排时序与协议，统一",
        "控制片上外设与ASIC设计模块。",
        "",
        "系统参照AMBA标准AHB-Lite作为片上互连端口协议，提供指令/数据双端口",
        "与统一的从设备接口，支持IROM/BRAM存储，并能够以一致的AHB外设接口",
        "实现外设\"即插即用\"式挂载，便于课程实验、快速验证与工程落地。"
    ]
    
    text_y = y + section_height - 30*mm
    for line in abstract_lines:
        c.drawString(x + 5*mm, text_y, line)
        text_y -= 10*mm

def draw_features_section(c, x, y, font_name):
    """Draw key features in a grid"""
    # Section title
    c.setFillColor(COLOR_PRIMARY)
    c.setFont(font_name, 20)
    c.drawString(x, y + 140*mm, "核心特性")
    
    # Underline
    c.setStrokeColor(COLOR_ACCENT)
    c.setLineWidth(2)
    c.line(x, y + 138*mm, x + 80*mm, y + 138*mm)
    
    features = [
        ("RV32I指令集", "完整支持RISC-V基础\n整数指令集"),
        ("五级流水线", "IF-ID-EX-MEM-WB\n高效执行架构"),
        ("数据前递", "减少流水线停顿\n提升性能"),
        ("AHB总线", "标准AMBA协议\n易于扩展"),
        ("BRAM存储", "支持字节/半字/字\n访问模式"),
        ("外设丰富", "LED/按键/数码管\nUART通信"),
    ]
    
    # Draw feature boxes in 2x3 grid
    box_width = 85*mm
    box_height = 35*mm
    gap = 8*mm
    
    for i, (title, desc) in enumerate(features):
        row = i // 2
        col = i % 2
        box_x = x + col * (box_width + gap)
        box_y = y + 95*mm - row * (box_height + gap)
        
        # Box background with gradient effect
        c.setFillColor(COLOR_SECONDARY)
        c.roundRect(box_x, box_y, box_width, box_height, 5*mm, fill=1, stroke=0)
        
        # Title
        c.setFillColor(white)
        c.setFont(font_name, 14)
        c.drawString(box_x + 8*mm, box_y + box_height - 12*mm, title)
        
        # Description
        c.setFont(font_name, 10)
        desc_lines = desc.split('\n')
        desc_y = box_y + box_height - 25*mm
        for line in desc_lines:
            c.drawString(box_x + 8*mm, desc_y, line)
            desc_y -= 8*mm

def draw_architecture_section(c, x, y, width, font_name):
    """Draw system architecture description"""
    # Section title
    c.setFillColor(COLOR_PRIMARY)
    c.setFont(font_name, 20)
    c.drawString(x, y + 140*mm, "系统架构")
    
    # Underline
    c.setStrokeColor(COLOR_ACCENT)
    c.setLineWidth(2)
    c.line(x, y + 138*mm, x + 80*mm, y + 138*mm)
    
    # Architecture boxes
    c.setFillColor(COLOR_LIGHT)
    
    # CPU Core box
    c.roundRect(x + 10*mm, y + 90*mm, 150*mm, 35*mm, 5*mm, fill=1, stroke=0)
    c.setStrokeColor(COLOR_PRIMARY)
    c.setLineWidth(2)
    c.roundRect(x + 10*mm, y + 90*mm, 150*mm, 35*mm, 5*mm, fill=0, stroke=1)
    
    c.setFillColor(COLOR_DARK)
    c.setFont(font_name, 14)
    c.drawCentredString(x + 85*mm, y + 115*mm, "五级流水线CPU核心")
    c.setFont(font_name, 11)
    c.drawCentredString(x + 85*mm, y + 102*mm, "取指 → 译码 → 执行 → 访存 → 写回")
    c.drawCentredString(x + 85*mm, y + 92*mm, "支持数据前递、冒险检测")
    
    # AHB Bus
    c.setFillColor(COLOR_ACCENT)
    c.rect(x + 10*mm, y + 70*mm, 150*mm, 15*mm, fill=1, stroke=0)
    c.setFillColor(white)
    c.setFont(font_name, 13)
    c.drawCentredString(x + 85*mm, y + 75*mm, "AHB-Lite 总线互连")
    
    # Memory and Peripherals
    mem_box_width = 72*mm
    mem_box_height = 25*mm
    
    # IROM
    c.setFillColor(COLOR_LIGHT)
    c.roundRect(x + 10*mm, y + 35*mm, mem_box_width, mem_box_height, 5*mm, fill=1, stroke=0)
    c.setStrokeColor(COLOR_SECONDARY)
    c.setLineWidth(1.5)
    c.roundRect(x + 10*mm, y + 35*mm, mem_box_width, mem_box_height, 5*mm, fill=0, stroke=1)
    c.setFillColor(COLOR_DARK)
    c.setFont(font_name, 12)
    c.drawCentredString(x + 46*mm, y + 50*mm, "指令ROM")
    c.drawCentredString(x + 46*mm, y + 40*mm, "(IROM)")
    
    # BRAM
    c.setFillColor(COLOR_LIGHT)
    c.roundRect(x + 88*mm, y + 35*mm, mem_box_width, mem_box_height, 5*mm, fill=1, stroke=0)
    c.setStrokeColor(COLOR_SECONDARY)
    c.setLineWidth(1.5)
    c.roundRect(x + 88*mm, y + 35*mm, mem_box_width, mem_box_height, 5*mm, fill=0, stroke=1)
    c.setFillColor(COLOR_DARK)
    c.setFont(font_name, 12)
    c.drawCentredString(x + 124*mm, y + 50*mm, "数据RAM")
    c.drawCentredString(x + 124*mm, y + 40*mm, "(BRAM)")
    
    # Peripherals box
    c.setFillColor(COLOR_LIGHT)
    c.roundRect(x + 10*mm, y + 5*mm, 150*mm, 25*mm, 5*mm, fill=1, stroke=0)
    c.setStrokeColor(COLOR_HIGHLIGHT)
    c.setLineWidth(1.5)
    c.roundRect(x + 10*mm, y + 5*mm, 150*mm, 25*mm, 5*mm, fill=0, stroke=1)
    c.setFillColor(COLOR_DARK)
    c.setFont(font_name, 11)
    c.drawCentredString(x + 85*mm, y + 20*mm, "外设接口")
    c.drawCentredString(x + 85*mm, y + 10*mm, "LED · 按键 · 七段数码管 · UART")
    
    # Draw connecting arrows
    c.setStrokeColor(COLOR_PRIMARY)
    c.setLineWidth(2)
    # CPU to Bus
    c.line(x + 85*mm, y + 90*mm, x + 85*mm, y + 85*mm)
    # Bus to Memory
    c.line(x + 46*mm, y + 70*mm, x + 46*mm, y + 60*mm)
    c.line(x + 124*mm, y + 70*mm, x + 124*mm, y + 60*mm)
    # Bus to Peripherals
    c.line(x + 85*mm, y + 70*mm, x + 85*mm, y + 30*mm)

def draw_technical_specs(c, x, y, font_name):
    """Draw technical specifications"""
    # Section title
    c.setFillColor(COLOR_PRIMARY)
    c.setFont(font_name, 20)
    c.drawString(x, y + 140*mm, "技术规格")
    
    # Underline
    c.setStrokeColor(COLOR_ACCENT)
    c.setLineWidth(2)
    c.line(x, y + 138*mm, x + 80*mm, y + 138*mm)
    
    specs = [
        ("指令集架构", "RISC-V RV32I"),
        ("流水线级数", "5级 (IF-ID-EX-MEM-WB)"),
        ("总线协议", "AMBA AHB-Lite"),
        ("目标频率", "50-100 MHz"),
        ("指令吞吐", "CPI ≈ 1 (理想)"),
        ("存储器", "指令ROM + 数据BRAM"),
        ("外设接口", "GPIO, UART, 数码管"),
        ("开发工具", "Vivado 2023.2"),
        ("硬件描述", "Verilog/SystemVerilog"),
        ("目标器件", "Xilinx Artix-7"),
    ]
    
    c.setFillColor(COLOR_DARK)
    c.setFont(font_name, 11)
    
    spec_y = y + 120*mm
    for label, value in specs:
        c.setFont(font_name, 11)
        c.drawString(x + 5*mm, spec_y, f"{label}:")
        c.setFont(font_name, 10)
        c.drawString(x + 55*mm, spec_y, value)
        spec_y -= 12*mm

def draw_highlights(c, x, y, width, font_name):
    """Draw project highlights"""
    # Section title
    c.setFillColor(COLOR_PRIMARY)
    c.setFont(font_name, 20)
    c.drawString(x, y + 110*mm, "项目亮点")
    
    # Underline
    c.setStrokeColor(COLOR_ACCENT)
    c.setLineWidth(2)
    c.line(x, y + 108*mm, x + 80*mm, y + 108*mm)
    
    highlights = [
        "✓ 完整的五级流水线实现，支持数据前递和冒险检测",
        "✓ 标准AHB-Lite总线协议，外设即插即用",
        "✓ 模块化设计，易于扩展和复用",
        "✓ 丰富的外设支持，适合教学和实验",
        "✓ 开源项目，推动RISC-V生态发展",
        "✓ 完整的仿真验证和硬件测试",
    ]
    
    c.setFillColor(COLOR_DARK)
    c.setFont(font_name, 12)
    
    hl_y = y + 90*mm
    for hl in highlights:
        c.drawString(x + 5*mm, hl_y, hl)
        hl_y -= 14*mm

def draw_footer(c, width, height, font_name):
    """Draw footer with contact and competition info"""
    footer_height = 40*mm
    
    # Footer background
    c.setFillColor(COLOR_DARK)
    c.rect(0, 0, width, footer_height, fill=1, stroke=0)
    
    # Footer text
    c.setFillColor(white)
    c.setFont(font_name, 14)
    c.drawCentredString(width/2, footer_height - 15*mm, 
                        "开源 · 创新 · 协作 | Open Source · Innovation · Collaboration")
    
    c.setFont(font_name, 11)
    c.drawCentredString(width/2, footer_height - 30*mm,
                        "GitHub: Narwhal-Wu/LibreCore")

def generate_poster(output_file="competition_poster.pdf"):
    """Generate the complete competition poster"""
    
    # Use A1 landscape for a large poster
    page_width, page_height = landscape(A1)
    
    # Create canvas
    c = canvas.Canvas(output_file, pagesize=landscape(A1))
    
    # Register fonts
    font_name = register_fonts()
    
    # Set page background
    c.setFillColor(white)
    c.rect(0, 0, page_width, page_height, fill=1, stroke=0)
    
    # Draw all sections
    draw_header(c, page_width, page_height, font_name)
    
    # Main content area starts below header
    content_start_y = page_height - 140*mm
    
    # Team info box (centered near top)
    team_box_x = (page_width - 200*mm) / 2
    draw_team_info(c, team_box_x, content_start_y - 60*mm, font_name)
    
    # Content layout - three columns
    col1_x = 30*mm
    col2_x = 270*mm
    col3_x = 510*mm
    content_y = content_start_y - 130*mm
    
    # Column 1: Abstract and Highlights
    draw_abstract_section(c, col1_x, content_y + 135*mm, 220*mm, font_name)
    draw_highlights(c, col1_x, content_y, 220*mm, font_name)
    
    # Column 2: Key Features
    draw_features_section(c, col2_x, content_y, font_name)
    
    # Column 3: Architecture and Technical Specs
    draw_architecture_section(c, col3_x, content_y + 130*mm, 220*mm, font_name)
    draw_technical_specs(c, col3_x, content_y, font_name)
    
    # Footer
    draw_footer(c, page_width, page_height, font_name)
    
    # Save the PDF
    c.save()
    
    # Get file size
    file_size = os.path.getsize(output_file)
    file_size_mb = file_size / (1024 * 1024)
    
    print(f"\n✓ Poster generated successfully!")
    print(f"  Output file: {output_file}")
    print(f"  Page size: A1 Landscape ({page_width/mm:.0f}mm x {page_height/mm:.0f}mm)")
    print(f"  File size: {file_size_mb:.2f} MB")
    
    if file_size_mb > 50:
        print(f"  ⚠ Warning: File size exceeds 50MB limit!")
    else:
        print(f"  ✓ File size is within 50MB limit")
    
    return output_file

if __name__ == "__main__":
    generate_poster("/home/runner/work/LibreCore/LibreCore/OpenRV_Competition_Poster.pdf")
