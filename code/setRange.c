#define CTRL_REG_4 	0x23

/* Measurement range  H3LIS331DL_H */
typedef enum {
    RANGE_100g    = 0x00,
    RANGE_200g    = 0x01,
    RANGE_400g    = 0x03
} RANGE_t;

void setRange(RANGE_t rg){
	uint8_t res;
	uint8_t reg;
	res = H3LI_ReadReg(CTRL_REG_4,(uint8_t*)&reg, 1);
	if (res != ERR_OK){		
		for(;;);					/* error */
	}
	reg &= 0xCF;				/* mask */
	reg |= rg <<4;
	/* strange error: need to wait a moment after reading a register before writing */
	WAIT1_WaitOSms(1);	
	res = H3LI_WriteReg(CTRL_REG_4, reg);
	if (res != ERR_OK){
		for(;;);					/* error */
	}
}