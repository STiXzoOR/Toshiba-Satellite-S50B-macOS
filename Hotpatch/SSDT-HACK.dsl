// Custom configuration for Toshiba Sattelite S50B-N-15 laptop

DefinitionBlock ("", "SSDT", 2, "hack", "S50B", 0)
{
    Device(RMCF)
    {
        Name(_ADR, 0)   // do not remove

        // AUDL: Audio Layout
        //
        // The value here will be used to inject layout-id for HDEF and HDAU
        // If set to Ones, no audio injection will be done.
        Name(AUDL, 3)

        // IGPI: Override for ig-platform-id (or snb-platform-id).
        // Will be used if non-zero, and not Ones
        // Can be set to Ones to disable IGPU injection.
        // For example, if you wanted to inject a bogus id, 0x12345678
        //    Name(IGPI, 0x12345678)
        // Or to disable, IGPU injection from SSDT-IGPU:
        //    Name(IGPI, Ones)
        // Or to set a custom ig-platform-id, example:
        //    Name(IGPI, 0x01660008)
        Name(IGPI, 0x16260006)
            
        // LMAX: Backlight PWM MAX.  Must match framebuffer in use.
        //
        // Ones: Default will be used (0x710 for Ivy/Sandy, 0xad9 for Haswell/Broadwell)
        // Other values: must match framebuffer
        //Name(LMAX, 0xad9)
    }
    
    #define NO_DEFINITIONBLOCK
    #include "Downloads/SSDT-IGPU.dsl"
    #include "Downloads/SSDT-PNLF.dsl"
    #include "Downloads/SSDT-HDEF.dsl"
    #include "Downloads/SSDT-HDAU.dsl"
    #include "Downloads/SSDT-DEHCI.dsl"
    #include "Downloads/SSDT-XCPM.dsl"
    #include "Downloads/SSDT-XOSI.dsl"
    #include "SSDT-UIAC.dsl"
    #include "SSDT-CX20756.dsl"
    #include "SSDT-DGPU.dsl"
    #include "SSDT-PS2K.dsl"
    #include "SSDT-GPRW.dsl"
}
//EOF