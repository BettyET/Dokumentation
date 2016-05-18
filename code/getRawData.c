#define OUT_Z_L_MSB 0xAC		/* read more than 1 registers */
static uint8_t accelZ[2]={0,0};

int16_t getRawData(void){
	uint8_t res;
	res = H3LI_ReadReg(OUT_Z_L_MSB, (int8_t*)&accelZ, 2);
	if (res != ERR_OK){
		for(;;);									/* error */
	}
	return ((int16_t)accelZ[1]<<8)| ((int16_t)accelZ[0]);
}