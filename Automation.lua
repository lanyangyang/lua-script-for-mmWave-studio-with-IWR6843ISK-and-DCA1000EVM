---------------------------------- STARTUP -------------------------------------
------------------------ DO NOT MODIFY THIS SECTION ----------------------------
-- -- local RSTD = RSTD
-- -- -- mmwavestudio installation path
-- RSTD_PATH = RSTD.GetRstdPath()
-- --
-- -- -- Declare the loading function
-- dofile(RSTD_PATH .. "\\Scripts\\Startup.lua")
-- --
-- ------------------------------ CONFIGURATIONS ----------------------------------
-- Use "DCA1000" for working with DCA1000
capture_device  = "DCA1000"

-- SOP mode
SOP_mode        = 2

-- RS232 connection baud rate
baudrate        = 921600
-- RS232 COM Port number
uart_com_port   = 8
-- Timeout in ms
timeout         = 1000

-- BSS firmware
bss_path        = "D:\\RD\\mmwave_studio_02_01_01_00\\rf_eval_firmware\\radarss\\xwr68xx_radarss.bin"
-- MSS firmware
mss_path        = "D:\\RD\\mmwave_studio_02_01_01_00\\rf_eval_firmware\\masterss\\xwr68xx_masterss.bin"

adc_data_path   = "D:\\RD\\mmwave_studio_02_01_01_00\\mmWaveStudio\\PostProc\\test_adc_data.bin"

------------------------- Connect Tab settings ---------------------------------
-- Select Capture device
-- ret=ar1.SelectCaptureDevice(capture_device)
-- if(ret~=0)
-- then
--     print("******* Wrong Capture device *******")
--     return
-- end

-- SOP mode
-- ret=ar1.SOPControl(SOP_mode)
-- RSTD.Sleep(timeout)
-- if(ret~=0)
-- then
--     print("******* SOP FAIL *******")
--     return
-- end
--
-- -- RS232 Connect
-- ret=ar1.Connect(uart_com_port,baudrate,timeout)
-- RSTD.Sleep(timeout)
-- if(ret~=0)
-- then
--     print("******* Connect FAIL *******")
--     return
-- end

-- Download BSS Firmware
-- ret=ar1.DownloadBSSFw(bss_path)
-- RSTD.Sleep(2*timeout)
-- if(ret~=0)
-- then
--     print("******* BSS Load FAIL *******")
--     return
-- end
--
-- -- Download MSS Firmware
-- ret=ar1.DownloadMSSFw(mss_path)
-- RSTD.Sleep(2*timeout)
-- if(ret~=0)
-- then
--     print("******* MSS Load FAIL *******")
--     return
-- end
--
-- -- SPI Connect
-- ar1.PowerOn(1, 1000, 0, 0)
--
-- -- RF Power UP
-- ar1.RfEnable()

------------------------- Other Device Configuration ---------------------------

-- ADD Device Configuration here

ar1.ChanNAdcConfig(1, 1, 1, 1, 1, 1, 1, 2, 1, 0)

ar1.LPModConfig(0, 0)

ar1.RfInit()
RSTD.Sleep(1000)

ar1.DataPathConfig(513, 1216644097, 0)

ar1.LvdsClkConfig(1, 1)

ar1.LVDSLaneConfig(0, 1, 1, 0, 0, 1, 0, 0)

ar1.SetTestSource(4, 3, 0, 0, 0, 0, -327, 0, -327, 327, 327, 327, -2.5, 327, 327, 0, 0, 0, 0, -327, 0, -327, 
                      327, 327, 327, -95, 0, 0, 0.5, 0, 1, 0, 1.5, 0, 0, 0, 0, 0, 0, 0)

ar1.ProfileConfig(0, 60, 100, 6, 60, 0, 0, 0, 0, 0, 0, 29.982, 0, 256, 10000, 0, 131072, 30)

ar1.ChirpConfig(0, 0, 0, 0, 0, 0, 0, 1, 0, 0)
ar1.ChirpConfig(1, 1, 0, 0, 0, 0, 0, 0, 1, 0)
ar1.ChirpConfig(2, 2, 0, 0, 0, 0, 0, 0, 0, 1)


ar1.FrameConfig(0, 2, 0, 32, 40, 0, 0, 1)

ar1.CaptureCardConfig_EthInit("192.168.33.30", "192.168.33.180", "12:34:56:78:90:12", 4096, 4098)

ar1.CaptureCardConfig_Mode(1, 1, 1, 2, 3, 30)

ar1.CaptureCardConfig_PacketDelay(25)

--Start Record ADC data
-- ar1.CaptureCardConfig_StartRecord(adc_data_path, 1)
-- RSTD.Sleep(1000)
--
-- --Trigger frame
-- ar1.StartFrame()
-- RSTD.Sleep(5000)

------------------------- Close the Connection ---------------------------------
-- SPI disconnect
-- ar1.PowerOff()

-- RS232 disconnect
-- ar1.Disconnect()

------------------------- Exit MMwave Studio GUI -----------------------------------
-- os.exit()

-- end
