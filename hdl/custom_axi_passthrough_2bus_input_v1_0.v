
`timescale 1 ns / 1 ps

	module custom_axi_passthrough_2bus_input_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line
        parameter integer AXI_READ_RPLC_AMOUNT = 1,
        parameter integer AXI_WRITE_RPLC_AMOUNT = 1,

		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 32,
	
		parameter integer C_M00_AXI_DATA_WIDTH	= 32,
		parameter integer C_M00_AXI_ADDR_WIDTH	= 32	
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line

		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,

		// Ports of Axi Master Bus Interface M00_AXI
		input wire  m00_axi_aclk,
		input wire  m00_axi_aresetn,
		output wire [C_S00_AXI_ADDR_WIDTH-1 : 0] m00_axi_awaddr,
		output wire [2 : 0] m00_axi_awprot,
		output wire  m00_axi_awvalid,
		input wire  m00_axi_awready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] m00_axi_wdata,
		output wire [C_S00_AXI_DATA_WIDTH/8-1 : 0] m00_axi_wstrb,
		output wire  m00_axi_wvalid,
		input wire  m00_axi_wready,
		input wire [1 : 0] m00_axi_bresp,
		input wire  m00_axi_bvalid,
		output wire  m00_axi_bready,
		output wire [C_S00_AXI_ADDR_WIDTH-1 : 0] m00_axi_araddr,
		output wire [2 : 0] m00_axi_arprot,
		output wire  m00_axi_arvalid,
		input wire  m00_axi_arready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] m00_axi_rdata,
		input wire [1 : 0] m00_axi_rresp,
		input wire  m00_axi_rvalid,
		output wire  m00_axi_rready,
		
		// Ports of Axi Slave Bus Interface SC_AXI
		input wire  sc_axi_aclk,
		input wire  sc_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] sc_axi_awaddr,
		input wire [2 : 0] sc_axi_awprot,
		input wire  sc_axi_awvalid,
		output wire  sc_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] sc_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] sc_axi_wstrb,
		input wire  sc_axi_wvalid,
		output wire  sc_axi_wready,
		output wire [1 : 0] sc_axi_bresp,
		output wire  sc_axi_bvalid,
		input wire  sc_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] sc_axi_araddr,
		input wire [2 : 0] sc_axi_arprot,
		input wire  sc_axi_arvalid,
		output wire  sc_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] sc_axi_rdata,
		output wire [1 : 0] sc_axi_rresp,
		output wire  sc_axi_rvalid,
		input wire  sc_axi_rready
	);

// Instantiation of Axi Bus Interface M00_AXI
	custom_axi_passthrough_2bus_input_v1_0_M00_AXI # (
		.C_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH),
		.C_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_AXI_RDATA_REPLACEMENT_AMOUNT(AXI_READ_RPLC_AMOUNT),
		.C_AXI_WDATA_REPLACEMENT_AMOUNT(AXI_WRITE_RPLC_AMOUNT)
	) custom_axi_passthrough_2bus_input_v1_0_M00_AXI_inst (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready),
		
		.M_AXI_ACLK(m00_axi_aclk),
		.M_AXI_ARESETN(m00_axi_aresetn),
		.M_AXI_AWADDR(m00_axi_awaddr),
		.M_AXI_AWPROT(m00_axi_awprot),
		.M_AXI_AWVALID(m00_axi_awvalid),
		.M_AXI_AWREADY(m00_axi_awready),
		.M_AXI_WDATA(m00_axi_wdata),
		.M_AXI_WSTRB(m00_axi_wstrb),
		.M_AXI_WVALID(m00_axi_wvalid),
		.M_AXI_WREADY(m00_axi_wready),
		.M_AXI_BRESP(m00_axi_bresp),
		.M_AXI_BVALID(m00_axi_bvalid),
		.M_AXI_BREADY(m00_axi_bready),
		.M_AXI_ARADDR(m00_axi_araddr),
		.M_AXI_ARPROT(m00_axi_arprot),
		.M_AXI_ARVALID(m00_axi_arvalid),
		.M_AXI_ARREADY(m00_axi_arready),
		.M_AXI_RDATA(m00_axi_rdata),
		.M_AXI_RRESP(m00_axi_rresp),
		.M_AXI_RVALID(m00_axi_rvalid),
		.M_AXI_RREADY(m00_axi_rready),

		.SC_AXI_ACLK(sc_axi_aclk),
		.SC_AXI_ARESETN(sc_axi_aresetn),
		.SC_AXI_AWADDR(sc_axi_awaddr),
		.SC_AXI_AWPROT(sc_axi_awprot),
		.SC_AXI_AWVALID(sc_axi_awvalid),
		.SC_AXI_AWREADY(sc_axi_awready),
		.SC_AXI_WDATA(sc_axi_wdata),
		.SC_AXI_WSTRB(sc_axi_wstrb),
		.SC_AXI_WVALID(sc_axi_wvalid),
		.SC_AXI_WREADY(sc_axi_wready),
		.SC_AXI_BRESP(sc_axi_bresp),
		.SC_AXI_BVALID(sc_axi_bvalid),
		.SC_AXI_BREADY(sc_axi_bready),
		.SC_AXI_ARADDR(sc_axi_araddr),
		.SC_AXI_ARPROT(sc_axi_arprot),
		.SC_AXI_ARVALID(sc_axi_arvalid),
		.SC_AXI_ARREADY(sc_axi_arready),
		.SC_AXI_RDATA(sc_axi_rdata),
		.SC_AXI_RRESP(sc_axi_rresp),
		.SC_AXI_RVALID(sc_axi_rvalid),
		.SC_AXI_RREADY(sc_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule