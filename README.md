DecimalUtils
============

This project provide set ot utility functions to directly manipulation NSDecimal variables.

For example:

    NSDecimal  myNumber = decimalFromDouble( 16.0 );
    NSDecimal  result;

    result = decimalDivideDouble( myNumber, 4.0 );
    result = decimalDivideDouble( decimalFromDouble( 16.0 ), 4.0 );




