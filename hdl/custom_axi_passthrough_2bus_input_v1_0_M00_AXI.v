
`timescale 1 ns / 1 ps

	module custom_axi_passthrough_2bus_input_v1_0_M00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// The master requires a target slave base address.
		// Width of M_AXI address bus. 
    // The master generates the read and write addresses of width specified as COM_AXI_ADDR_WIDTH.
		parameter integer C_AXI_ADDR_WIDTH	= 32,
		// Width of M_AXI data bus. 
    // The master issues write data and accept read data where the width of the data bus is COM_AXI_DATA_WIDTH
		parameter integer C_AXI_DATA_WIDTH	= 32,
		
		parameter integer C_AXI_RDATA_REPLACEMENT_AMOUNT = 1,
		parameter integer C_AXI_WDATA_REPLACEMENT_AMOUNT = 1
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line
		
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY,

		// AXI clock signal
		input wire  M_AXI_ACLK,
		// AXI active low reset signal
		input wire  M_AXI_ARESETN,
		// Master Interface Write Address Channel ports. Write address (issued by master)
		output wire [C_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
		// Write channel Protection type.
    // This signal indicates the privilege and security level of the transaction,
    // and whether the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_AWPROT,
		// Write address valid. 
    // This signal indicates that the master signaling valid write address and control information.
		output wire  M_AXI_AWVALID,
		// Write address ready. 
    // This signal indicates that the slave is ready to accept an address and associated control signals.
		input wire  M_AXI_AWREADY,
		// Master Interface Write Data Channel ports. Write data (issued by master)
		output wire [C_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
		// Write strobes. 
    // This signal indicates which byte lanes hold valid data.
    // There is one write strobe bit for each eight bits of the write data bus.
		output wire [C_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
		// Write valid. This signal indicates that valid write data and strobes are available.
		output wire  M_AXI_WVALID,
		// Write ready. This signal indicates that the slave can accept the write data.
		input wire  M_AXI_WREADY,
		// Master Interface Write Response Channel ports. 
    // This signal indicates the status of the write transaction.
		input wire [1 : 0] M_AXI_BRESP,
		// Write response valid. 
    // This signal indicates that the channel is signaling a valid write response
		input wire  M_AXI_BVALID,
		// Response ready. This signal indicates that the master can accept a write response.
		output wire  M_AXI_BREADY,
		// Master Interface Read Address Channel ports. Read address (issued by master)
		output wire [C_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
		// Protection type. 
    // This signal indicates the privilege and security level of the transaction, 
    // and whether the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_ARPROT,
		// Read address valid. 
    // This signal indicates that the channel is signaling valid read address and control information.
		output wire  M_AXI_ARVALID,
		// Read address ready. 
    // This signal indicates that the slave is ready to accept an address and associated control signals.
		input wire  M_AXI_ARREADY,
		// Master Interface Read Data Channel ports. Read data (issued by slave)
		input wire [C_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
		// Read response. This signal indicates the status of the read transfer.
		input wire [1 : 0] M_AXI_RRESP,
		// Read valid. This signal indicates that the channel is signaling the required read data.
		input wire  M_AXI_RVALID,
		// Read ready. This signal indicates that the master can accept the read data and response information.
		output wire  M_AXI_RREADY,

		input wire  SC_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  SC_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_AXI_ADDR_WIDTH-1 : 0] SC_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] SC_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  SC_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  SC_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_AXI_DATA_WIDTH-1 : 0] SC_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_AXI_DATA_WIDTH/8)-1 : 0] SC_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  SC_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  SC_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] SC_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  SC_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  SC_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_AXI_ADDR_WIDTH-1 : 0] SC_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] SC_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  SC_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  SC_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_AXI_DATA_WIDTH-1 : 0] SC_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] SC_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  SC_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  SC_AXI_RREADY
	);
		reg [(C_AXI_ADDR_WIDTH*C_AXI_RDATA_REPLACEMENT_AMOUNT)-1:0] C_AXI_RDATA_REPLACEMENT_ADDR = "0";
        reg [(C_AXI_DATA_WIDTH*C_AXI_RDATA_REPLACEMENT_AMOUNT)-1:0] C_AXI_RDATA_REPLACEMENT_VALUE = "0";
        reg [(C_AXI_DATA_WIDTH*C_AXI_RDATA_REPLACEMENT_AMOUNT)-1:0] C_AXI_RDATA_REPLACEMENT_MASK1 = "0";
        reg [(C_AXI_DATA_WIDTH*C_AXI_RDATA_REPLACEMENT_AMOUNT)-1:0] C_AXI_RDATA_REPLACEMENT_MASK2 = "0";
        
        reg [(C_AXI_ADDR_WIDTH*C_AXI_WDATA_REPLACEMENT_AMOUNT)-1:0] C_AXI_WDATA_REPLACEMENT_ADDR = "0";
        reg [(C_AXI_DATA_WIDTH*C_AXI_WDATA_REPLACEMENT_AMOUNT)-1:0] C_AXI_WDATA_REPLACEMENT_VALUE = "0";
        reg [(C_AXI_DATA_WIDTH*C_AXI_WDATA_REPLACEMENT_AMOUNT)-1:0] C_AXI_WDATA_REPLACEMENT_MASK1 = "0";
        reg [(C_AXI_DATA_WIDTH*C_AXI_WDATA_REPLACEMENT_AMOUNT)-1:0] C_AXI_WDATA_REPLACEMENT_MASK2 = "0";
        
//========================================Read setup========================================
        
//        assign M_AXI_WVALID = S_AXI_WVALID;
        reg m_axi_wvalid;
        assign M_AXI_WVALID = m_axi_wvalid;
        
//        assign S_AXI_WREADY = M_AXI_WREADY;
        reg s_axi_wready;
        assign S_AXI_WREADY = s_axi_wready;

//        assign M_AXI_AWVALID = S_AXI_AWVALID;
        reg m_axi_awvalid;
        assign M_AXI_AWVALID = m_axi_awvalid;
        
//        assign S_AXI_AWREADY = M_AXI_AWREADY;
        reg s_axi_awready;
        assign S_AXI_AWREADY = s_axi_awready;
        
//        assign M_AXI_ARADDR = S_AXI_ARADDR;
        reg [C_AXI_ADDR_WIDTH-1 : 0] actual_raddr;
        assign M_AXI_ARADDR = actual_raddr;
        
//        assign S_AXI_RDATA = M_AXI_RDATA;
        reg [C_AXI_DATA_WIDTH-1 : 0] actual_rdata;
        assign S_AXI_RDATA = actual_rdata;
        
//========================================Write setup========================================

//        assign S_AXI_RVALID = M_AXI_RVALID;
        reg s_axi_rvalid;
        assign S_AXI_RVALID = s_axi_rvalid;
        
//        assign M_AXI_RREADY = S_AXI_RREADY;
        reg m_axi_rready;
        assign M_AXI_RREADY = m_axi_rready;
        
//        assign M_AXI_ARVALID = S_AXI_ARVALID;
        reg m_axi_arvalid;
        assign M_AXI_ARVALID = m_axi_arvalid;
        
//        assign S_AXI_ARREADY = M_AXI_ARREADY;
        reg s_axi_arready;
        assign S_AXI_ARREADY = s_axi_arready;
        
//        assign M_AXI_AWADDR = S_AXI_AWADDR;
        reg [C_AXI_ADDR_WIDTH-1 : 0] actual_waddr;
        assign M_AXI_AWADDR = actual_waddr;
        
//        assign M_AXI_WDATA = S_AXI_WDATA;
        reg [C_AXI_DATA_WIDTH-1 : 0] actual_wdata;
        assign M_AXI_WDATA = actual_wdata;
 
//========================================Everything else========================================

// Just for the sake of similiar delay everywhere
        
//        assign S_AXI_BRESP = M_AXI_BRESP;
        reg [1 : 0] 	s_axi_bresp;
        assign S_AXI_BRESP	= s_axi_bresp;
	
//        assign S_AXI_BVALID = M_AXI_BVALID;
        reg  	s_axi_bvalid;
        assign S_AXI_BVALID	= s_axi_bvalid;
        
//        assign S_AXI_RRESP = M_AXI_RRESP;
        reg [1 : 0] 	s_axi_rresp;
        assign S_AXI_RRESP	= s_axi_rresp;
        
//        assign M_AXI_AWPROT = S_AXI_AWPROT;
        reg [2 : 0] 	m_axi_awprot;
        assign M_AXI_AWPROT	= m_axi_awprot;
        
//        assign M_AXI_WSTRB = S_AXI_WSTRB;
        reg [(C_AXI_DATA_WIDTH/8)-1 : 0] 	m_axi_wstrb;
        assign M_AXI_WSTRB	= m_axi_wstrb;

//        assign M_AXI_BREADY = S_AXI_BREADY;
        reg [(C_AXI_DATA_WIDTH/8)-1 : 0] 	m_axi_bready;
        assign M_AXI_BREADY	= m_axi_bready;

//        assign M_AXI_ARPROT = S_AXI_ARPROT;
        reg [2 : 0] 	m_axi_arprot;
        assign M_AXI_ARPROT	= m_axi_arprot;
        
//========================================Data replacement code========================================

    integer	 param1_index, param2_index; 

      always @(posedge S_AXI_ACLK)										      
	  begin                                                                        
	  	// Initiates AXI transaction delay    
        m_axi_wvalid <= S_AXI_WVALID;
        s_axi_wready <= M_AXI_WREADY;
        m_axi_awvalid <= S_AXI_AWVALID;
        s_axi_awready <= M_AXI_AWREADY;
        actual_raddr <= S_AXI_ARADDR;
        actual_rdata <= M_AXI_RDATA;
	    for (param1_index = 0; param1_index < C_AXI_RDATA_REPLACEMENT_AMOUNT; param1_index = param1_index + 1) begin
	      if (S_AXI_ARADDR == C_AXI_RDATA_REPLACEMENT_ADDR[param1_index * C_AXI_ADDR_WIDTH +: C_AXI_ADDR_WIDTH]) begin                                    
            actual_rdata <= ( (M_AXI_RDATA & ~C_AXI_RDATA_REPLACEMENT_MASK1[param1_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH]) | (C_AXI_RDATA_REPLACEMENT_VALUE[param1_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH] & C_AXI_RDATA_REPLACEMENT_MASK1[param1_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH] & ~C_AXI_RDATA_REPLACEMENT_MASK2[param1_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH]) | (~M_AXI_RDATA & C_AXI_RDATA_REPLACEMENT_MASK1[param1_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH] & C_AXI_RDATA_REPLACEMENT_MASK2[param1_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH]) );
	        end
	      end
	  end   

        always @(posedge M_AXI_ACLK)										      
	  begin                                                                        
	    // Initiates AXI transaction delay    
        s_axi_rvalid <= M_AXI_RVALID;
        m_axi_rready <= S_AXI_RREADY;
        m_axi_arvalid <= S_AXI_ARVALID;
        s_axi_arready <= M_AXI_ARREADY;
        actual_waddr <= S_AXI_AWADDR;
        actual_wdata <= S_AXI_WDATA;
	    for (param2_index = 0; param2_index < C_AXI_WDATA_REPLACEMENT_AMOUNT; param2_index = param2_index + 1) begin
	      if (S_AXI_AWADDR == C_AXI_WDATA_REPLACEMENT_ADDR[param2_index * C_AXI_ADDR_WIDTH +: C_AXI_ADDR_WIDTH]) begin
            actual_wdata <= ( (S_AXI_WDATA & ~C_AXI_WDATA_REPLACEMENT_MASK1[param2_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH]) | (C_AXI_WDATA_REPLACEMENT_VALUE[param2_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH] & C_AXI_WDATA_REPLACEMENT_MASK1[param2_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH] & ~C_AXI_WDATA_REPLACEMENT_MASK2[param2_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH]) | (~S_AXI_WDATA & C_AXI_WDATA_REPLACEMENT_MASK1[param2_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH] & C_AXI_WDATA_REPLACEMENT_MASK2[param2_index * C_AXI_DATA_WIDTH +: C_AXI_DATA_WIDTH]) );
	        end
	      end
	  end
	  
      always @(posedge S_AXI_ACLK)										      
	  begin 
        s_axi_bresp <= M_AXI_BRESP;
        s_axi_bvalid <= M_AXI_BVALID;
        s_axi_rresp <= M_AXI_RRESP;
        m_axi_awprot <= S_AXI_AWPROT;
        m_axi_wstrb <= S_AXI_WSTRB;
        m_axi_bready <= S_AXI_BREADY;
        m_axi_arprot <= S_AXI_ARPROT;
	  end
	  
//========================================Data read code========================================
	
	// AXI4LITE signals
	reg [C_AXI_ADDR_WIDTH-1 : 0] 	sc_axi_awaddr;
	reg  	sc_axi_awready;
	reg  	sc_axi_wready;
	reg [1 : 0] 	sc_axi_bresp;
	reg  	sc_axi_bvalid;
	reg [C_AXI_ADDR_WIDTH-1 : 0] 	sc_axi_araddr;
	reg  	sc_axi_arready;
	reg [C_AXI_DATA_WIDTH-1 : 0] 	sc_axi_rdata;
	reg [1 : 0] 	sc_axi_rresp;
	reg  	sc_axi_rvalid;
	
	// Example-specific design signals
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 1
	reg [C_AXI_DATA_WIDTH-1:0]	slv_reg0;
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	reg	 aw_en;
	
	reg addr_write = 1'b0;
    integer addr_pos;
	reg [2:0] role_pos;
    
    integer byte_index;

	// I/O Connections assignments


	assign SC_AXI_AWREADY	= sc_axi_awready;
	assign SC_AXI_WREADY	= sc_axi_wready;
	assign SC_AXI_BRESP	= sc_axi_bresp;
	assign SC_AXI_BVALID	= sc_axi_bvalid;
	assign SC_AXI_ARREADY	= sc_axi_arready;
	assign SC_AXI_RDATA	= sc_axi_rdata;
	assign SC_AXI_RRESP	= sc_axi_rresp;
	assign SC_AXI_RVALID	= sc_axi_rvalid;
	
	
	always @( posedge SC_AXI_ACLK )
	begin
	  if ( SC_AXI_ARESETN == 1'b0 )
	    begin
	      sc_axi_awready <= 1'b0;
	      aw_en <= 1'b1;
	    end 
	  else
	    begin    
	      if (~sc_axi_awready && SC_AXI_AWVALID && SC_AXI_WVALID && aw_en)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          sc_axi_awready <= 1'b1;
	          aw_en <= 1'b0;
	        end
	        else if (SC_AXI_BREADY && sc_axi_bvalid)
	            begin
	              aw_en <= 1'b1;
	              sc_axi_awready <= 1'b0;
	            end
	      else           
	        begin
	          sc_axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge SC_AXI_ACLK )
	begin
	  if ( SC_AXI_ARESETN == 1'b0 )
	    begin
	      sc_axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~sc_axi_awready && SC_AXI_AWVALID && SC_AXI_WVALID && aw_en)
	        begin
	          // Write Address latching 
	          sc_axi_awaddr <= SC_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge SC_AXI_ACLK )
	begin
	  if ( SC_AXI_ARESETN == 1'b0 )
	    begin
	      sc_axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~sc_axi_wready && SC_AXI_WVALID && SC_AXI_AWVALID && aw_en )
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          sc_axi_wready <= 1'b1;
	        end
	      else
	        begin
	          sc_axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = sc_axi_wready && SC_AXI_WVALID && sc_axi_awready && SC_AXI_AWVALID;

	always @( posedge SC_AXI_ACLK )
	begin
	  if (addr_write == 1'b1) begin
        case(role_pos)
        3'b000: C_AXI_RDATA_REPLACEMENT_ADDR[(C_AXI_ADDR_WIDTH * addr_pos) +: C_AXI_ADDR_WIDTH] <= slv_reg0;
        3'b001: C_AXI_RDATA_REPLACEMENT_VALUE[(C_AXI_DATA_WIDTH * addr_pos) +: C_AXI_DATA_WIDTH] <= slv_reg0;
        3'b010: C_AXI_RDATA_REPLACEMENT_MASK1[(C_AXI_DATA_WIDTH * addr_pos) +: C_AXI_DATA_WIDTH] <= slv_reg0;
        3'b011: C_AXI_RDATA_REPLACEMENT_MASK2[(C_AXI_DATA_WIDTH * addr_pos) +: C_AXI_DATA_WIDTH] <= slv_reg0;
        3'b100: C_AXI_WDATA_REPLACEMENT_ADDR[(C_AXI_ADDR_WIDTH * addr_pos) +: C_AXI_ADDR_WIDTH] <= slv_reg0;
        3'b101: C_AXI_WDATA_REPLACEMENT_VALUE[(C_AXI_DATA_WIDTH * addr_pos) +: C_AXI_DATA_WIDTH] <= slv_reg0;
        3'b110: C_AXI_WDATA_REPLACEMENT_MASK1[(C_AXI_DATA_WIDTH * addr_pos) +: C_AXI_DATA_WIDTH] <= slv_reg0;
        3'b111: C_AXI_WDATA_REPLACEMENT_MASK2[(C_AXI_DATA_WIDTH * addr_pos) +: C_AXI_DATA_WIDTH] <= slv_reg0;
        endcase
        
        addr_write <= 1'b0;
      end
      
	  if ( SC_AXI_ARESETN == 1'b0 )
	    begin
	      slv_reg0 <= 0;
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        role_pos <= S_AXI_AWADDR[6+:3];
            addr_pos <= S_AXI_AWADDR[2+:4];
	        addr_write <= 1'b1;
	        
	        for ( byte_index = 0; byte_index <= (C_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	          if ( SC_AXI_WSTRB[byte_index] == 1 ) begin
	            // Respective byte enables are asserted as per write strobes 
	            // Slave register 0
	            slv_reg0[(byte_index*8) +: 8] <= SC_AXI_WDATA[(byte_index*8) +: 8];
	          end
	      end
	  end
	end
	

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge SC_AXI_ACLK )
	begin
	  if ( SC_AXI_ARESETN == 1'b0 )
	    begin
	      sc_axi_bvalid  <= 0;
	      sc_axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (sc_axi_awready && SC_AXI_AWVALID && ~sc_axi_bvalid && sc_axi_wready && SC_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          sc_axi_bvalid <= 1'b1;
	          sc_axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (SC_AXI_BREADY && sc_axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              sc_axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge SC_AXI_ACLK )
	begin
	  if ( SC_AXI_ARESETN == 1'b0 )
	    begin
	      sc_axi_arready <= 1'b0;
	      sc_axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~sc_axi_arready && SC_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          sc_axi_arready <= 1'b1;
	          // Read address latching
	          sc_axi_araddr  <= SC_AXI_ARADDR;
	        end
	      else
	        begin
	          sc_axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge SC_AXI_ACLK )
	begin
	  if ( SC_AXI_ARESETN == 1'b0 )
	    begin
	      sc_axi_rvalid <= 0;
	      sc_axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (sc_axi_arready && SC_AXI_ARVALID && ~sc_axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          sc_axi_rvalid <= 1'b1;
	          sc_axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (sc_axi_rvalid && SC_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          sc_axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = sc_axi_arready & SC_AXI_ARVALID & ~sc_axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      reg_data_out <= slv_reg0;
	end

	// Output register or memory read data
	always @( posedge SC_AXI_ACLK )
	begin
	  if ( SC_AXI_ARESETN == 1'b0 )
	    begin
	      sc_axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          sc_axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    
	
	endmodule
