Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A17F49480C
	for <mfd@lists.linux.dev>; Sat,  5 Sep 2026 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788609951; cv=none; b=aFjC6v8qkh9GlY48K2BLGtvd0bMK9uC7lJbVdSt+FFPNAktXt/mEcd0H7QnUH7ykOUk6v358QN2Xtj2Wydt+l7gbaZchyt17fDDMsMmYoR2V1N3lpSRXuGFHSGQMHuGmbE7BKrEgBwTpuHZgs2tjlkJK17wOMP7T7QtS2Byb1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788609951; c=relaxed/simple;
	bh=1eeMQfsmePhlbse5A4y6u93sOcFxkVfCRqpSjo5oRrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrLnJ1e1IulYhpd/hKErd7z2P16yd5owPccL+X59bqRu4v+qO6VeZ4JvCvJptOvFoJxmHzylSIwnP6A1QkKPgxt7ZrJRsf3XbMvuJ+Nir/WQgyjOud7FRc3QBsmeEkSuwYQlvufUs1HmHS3xx3EMRlhAvoPBHdxy7G73zUwvRcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EenK6ZGA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EenK6ZGA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1794799a91.3
        for <mfd@lists.linux.dev>; Sat, 05 Sep 2026 05:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788609948; x=1789214748; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XripSuDqgxKOvt4K4G6jlwYCH+apKWt0I2taU66jF40=;
        b=EenK6ZGAcdwPUbcQ1o53Wmis4fm688iAoKqqt02oXhyhoCbfT74lnt2okuXoF/pRjt
         zvavMBXO7L6UlDoZkz7sjZZ89j9+l4N6WeYXzT5/wa0Cz+jkeerr6yyBhu+/Jvc0EA+d
         k6s9R1EAyFNRhjMtK8jEutvfN6vhap/Kr18CTVlIWrbP9TIeZUbW+9AT5O3ilLVOno+A
         4LhXzgwjP2vdZdydWtFICwVNUrMkswtH5lM8tHaU7Wnv1Vbliu3lOyYkYIZVBNEbU3va
         rfJuFGg1pQD7zZuhZu6vSpmaIfjkdZDS1RQRSCBgNGN5RsrzglNB7ilyvCda5gkiuFio
         bjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788609948; x=1789214748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XripSuDqgxKOvt4K4G6jlwYCH+apKWt0I2taU66jF40=;
        b=NZs0otIOYGnGDE6yTTq20aZaXzpzdSMILDeucOk8C4z1+momhwQnvwRkTk7aX6Bxh7
         U9fb4MHTH84EGz+pR+2KKwEUHFsPqGYBqAH+gyTp9T4JvR5XiRK0FZHyzhen3ArsC2zO
         QrsU04MXujlXlsqLpJGk9u5hG3TZoiteeRxuDd1g9RTUZzP6N+thmDMY3vGo2TAX2aLo
         Ex9jCu3Rpv7OlfpWHtdIup7FKfJjjZWI4GhuQ+bEEhEg5x9vdKTvZLr7oHXUxF11qteT
         PjmkrDPr+aSHQzpvfNshA+jcJfFtdH8BOzBKe9+rCFgnphCVQkS98BEps5oTPmnWIV/G
         JdEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkunAPzyyFztTb9bOG25m84tbPvzv/eWkV2saOreebEDKUq9cbbSsiXn6k7rO/nAhsjW4=@lists.linux.dev
X-Gm-Message-State: AFuF++lvSgDtsNBH2KwSqy2GR8ye21w62RZTARxCCy+nIRjr1zB2x9oF
	hMFhbI7JL9j7tHiO6RcBmvmbepGz6a64jwrOce7kb+mHd3JPLdhFTJ/J
X-Gm-Gg: AYBFou2RctMVBX/TRZkw8PxD/6vfApwL6xnXrFXbClk5VIfBQ7k2PXWKQ7PrhlsmdkU
	6cSajuuQjVN2cTjWpEUqtGKpFktEOjQZ1Cb/J0AtD1iqFPsK6mYjDcW7wlrFgPup5mOHZDZtKb0
	88GmnnrjsHLdT2YwRNlUnce45SIUdjh+Gnv6D821Sr8Z/Dc4glVwgr4TM4SEEHndI8axe3HJ5Q2
	UNHM4gmQAGknFRb6depxSTNvW7EA6OCmwBKoTlrvWD79iwJdCmLO3pM0eMoelWu51vslo/Cxpwr
	X9UbN4pkhonFs7EmZVt2Kvzs7dyjjx/IEUIRbxPz5mROyfCNOy6SKLJU/YMiokXBHgic0VDAYUR
	L86A8QM/jGZJp04G6k6XZ2du8pqyioWLOjn2H1FzPeVA0/GCALUmGdkyO4ANDdBEYdE81S0HfUf
	4r7aKfebbFrdwaXSpoIkQ3HLb6LRWB2v7U9KpZvSQAaSOIQzAkn9VOUKj9qEvXor64VMy0zdR0M
	SE46PFE/exicUzx5qhd70aoDvDF/jLrwaY+3adeJkNm5iFOby9+UGr6/unkFyj/mZtggsi5Zt+u
	5Oa6HXFn+wFh1NkNzE+SUu99gu91bflID+0omz4PftKtsaeIOijhVIA1KRWw23vxKk+594L/4Zh
	iZI7r4DMo+xgdMr6qQnWHSx7N+bVxoKCqUcQSZdw6n6AANIHExhMJ73toRTcC
X-Received: by 2002:a17:90b:3d48:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-39b260e13e0mr17880217a91.3.1788609947420;
        Sat, 05 Sep 2026 05:05:47 -0700 (PDT)
Received: from botszhome (2001-b011-c00e-bbbd-a023-4c33-dec3-b811.dynamic-ip6.hinet.net. [2001:b011:c00e:bbbd:a023:4c33:dec3:b811])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d4dbsm21432375ad.33.2026.09.05.05.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:05:46 -0700 (PDT)
Date: Sat, 5 Sep 2026 20:05:41 +0800
From: Botsz HUANG <huang.botsz@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: fix typos in comments
Message-ID: <apwFlV97bLVlvsOJ@botszhome>
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904122834.33723-1-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 05:58:28PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/mfd/88pm800.c                |  2 +-
>  drivers/mfd/kempld-core.c            |  2 +-
>  drivers/mfd/max8998.c                |  2 +-
>  drivers/mfd/rave-sp.c                |  6 +++---
>  drivers/mfd/si476x-i2c.c             |  2 +-
>  include/linux/mfd/da9063/registers.h |  2 +-
>  include/linux/mfd/db8500-prcmu.h     | 32 ++++++++++++++--------------
>  include/linux/mfd/lp8788.h           |  2 +-
>  include/linux/mfd/max8998.h          |  2 +-
>  include/linux/mfd/palmas.h           |  2 +-
>  include/linux/mfd/rohm-bd71828.h     |  2 +-
>  include/linux/mfd/samsung/core.h     |  2 +-
>  include/linux/mfd/si476x-core.h      |  2 +-
>  include/linux/mfd/twl.h              |  2 +-
>  14 files changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index e9941da58b18..aac630322b3c 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -275,7 +275,7 @@ static int device_gpadc_init(struct pm80x_chip *chip,
>  		goto out;
>  
>  	/*
> -	 * the defult of PM800 is GPADC operates at 100Ks/s rate
> +	 * the default of PM800 is GPADC operates at 100Ks/s rate
>  	 * and Number of GPADC slots with active current bias prior
>  	 * to GPADC sampling = 1 slot for all GPADCs set for
>  	 * Temprature mesurmants
> diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
> index b64729918dfd..47062f876e5d 100644
> --- a/drivers/mfd/kempld-core.c
> +++ b/drivers/mfd/kempld-core.c
> @@ -37,7 +37,7 @@ static void kempld_get_hardware_mutex(struct kempld_device_data *pld)
>  
>  static void kempld_release_hardware_mutex(struct kempld_device_data *pld)
>  {
> -	/* The harware mutex is released when 1 is written to the mutex bit. */
> +	/* The hardware mutex is released when 1 is written to the mutex bit. */
>  	iowrite8(KEMPLD_MUTEX_KEY, pld->io_index);
>  }
>  
> diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
> index eb13bbaeda55..5032eab05bb4 100644
> --- a/drivers/mfd/max8998.c
> +++ b/drivers/mfd/max8998.c
> @@ -146,7 +146,7 @@ static struct max8998_platform_data *max8998_i2c_parse_dt_pdata(
>  
>  	/*
>  	 * ToDo: the 'wakeup' member in the platform data is more of a linux
> -	 * specfic information. Hence, there is no binding for that yet and
> +	 * specific information. Hence, there is no binding for that yet and
>  	 * not parsed here.
>  	 */
>  	return pd;
> diff --git a/drivers/mfd/rave-sp.c b/drivers/mfd/rave-sp.c
> index 05d26d92df03..53c57bafea8f 100644
> --- a/drivers/mfd/rave-sp.c
> +++ b/drivers/mfd/rave-sp.c
> @@ -331,7 +331,7 @@ static u8 rave_sp_reply_code(u8 command)
>  		return command + 0x20;
>  	case 0xE0 ... 0xEF:
>  		/*
> -		 * Events emitted by all versions of the firmare use
> +		 * Events emitted by all versions of the firmware use
>  		 * least significant bit to get an ACK code
>  		 */
>  		return command | 0x01;
> @@ -544,7 +544,7 @@ static size_t rave_sp_receive_buf(struct serdev_device *serdev,
>  				 * NOTE: The above means that only the
>  				 * frame started by third SOF, sent
>  				 * after this one will have a chance
> -				 * to get throught.
> +				 * to get through.
>  				 */
>  				goto reset_framer;
>  			case RAVE_SP_DLE:
> @@ -595,7 +595,7 @@ static size_t rave_sp_receive_buf(struct serdev_device *serdev,
>  
>  	/*
>  	 * The only way to get out of the above loop and end up here
> -	 * is throught consuming all of the supplied data, so here we
> +	 * is through consuming all of the supplied data, so here we
>  	 * report that we processed it all.
>  	 */
>  	return size;
> diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
> index 9bce720a0a08..6351aef2d3bb 100644
> --- a/drivers/mfd/si476x-i2c.c
> +++ b/drivers/mfd/si476x-i2c.c
> @@ -222,7 +222,7 @@ int si476x_core_stop(struct si476x_core *core, bool soft)
>  	atomic_set(&core->is_alive, 0);
>  
>  	if (soft) {
> -		/* TODO: This probably shoud be a configurable option,
> +		/* TODO: This probably should be a configurable option,
>  		 * so it is possible to have the chips keep their
>  		 * oscillators running
>  		 */
> diff --git a/include/linux/mfd/da9063/registers.h b/include/linux/mfd/da9063/registers.h
> index 7b8364bd08a0..376c5d330599 100644
> --- a/include/linux/mfd/da9063/registers.h
> +++ b/include/linux/mfd/da9063/registers.h
> @@ -14,7 +14,7 @@
>  #define DA9063_I2C_PAGE_SEL_SHIFT	1
>  #define	DA9063_EVENT_REG_NUM		4
>  
> -/* Page selection I2C or SPI always in the begining of any page. */
> +/* Page selection I2C or SPI always in the beginning of any page. */
>  /* Page 0 : I2C access 0x000 - 0x0FF	SPI access 0x000 - 0x07F */
>  /* Page 1 :				SPI access 0x080 - 0x0FF */
>  /* Page 2 : I2C access 0x100 - 0x1FF	SPI access 0x100 - 0x17F */
> diff --git a/include/linux/mfd/db8500-prcmu.h b/include/linux/mfd/db8500-prcmu.h
> index c939c9a1170a..87a28c4f1d81 100644
> --- a/include/linux/mfd/db8500-prcmu.h
> +++ b/include/linux/mfd/db8500-prcmu.h
> @@ -337,31 +337,31 @@ enum sia_mmdsp_stat {
>   * @SYSCLKOK_ERR: The SYSCLK is not available in the given time
>   * @BOOT_ERR: Romcode has not validated the XP70 self reset in the given time
>   * @ROMCODESAVECONTEXT: The Romcode didn.t correctly save it secure context
> - * @VARMHIGHSPEEDVALTO_ERR: The ARM high speed supply value transfered
> + * @VARMHIGHSPEEDVALTO_ERR: The ARM high speed supply value transferred
>   *          through I2C has not been correctly executed in the given time
> - * @VARMHIGHSPEEDACCESS_ERR: The command value of VarmHighSpeedVal transfered
> + * @VARMHIGHSPEEDACCESS_ERR: The command value of VarmHighSpeedVal transferred
>   *             through I2C has not been correctly executed in the given time
> - * @VARMLOWSPEEDVALTO_ERR:The ARM low speed supply value transfered through
> + * @VARMLOWSPEEDVALTO_ERR:The ARM low speed supply value transferred through
>   *                     I2C has not been correctly executed in the given time
> - * @VARMLOWSPEEDACCESS_ERR: The command value of VarmLowSpeedVal transfered
> + * @VARMLOWSPEEDACCESS_ERR: The command value of VarmLowSpeedVal transferred
>   *             through I2C has not been correctly executed in the given time
> - * @VARMRETENTIONVALTO_ERR: The ARM retention supply value transfered through
> + * @VARMRETENTIONVALTO_ERR: The ARM retention supply value transferred through
>   *                     I2C has not been correctly executed in the given time
> - * @VARMRETENTIONACCESS_ERR: The command value of VarmRetentionVal transfered
> + * @VARMRETENTIONACCESS_ERR: The command value of VarmRetentionVal transferred
>   *             through I2C has not been correctly executed in the given time
> - * @VAPEHIGHSPEEDVALTO_ERR: The APE highspeed supply value transfered through
> + * @VAPEHIGHSPEEDVALTO_ERR: The APE highspeed supply value transferred through
>   *                     I2C has not been correctly executed in the given time
> - * @VSAFEHPVALTO_ERR: The SAFE high power supply value transfered through I2C
> + * @VSAFEHPVALTO_ERR: The SAFE high power supply value transferred through I2C
>   *                         has not been correctly executed in the given time
> - * @VMODSEL1VALTO_ERR: The MODEM sel1 supply value transfered through I2C has
> + * @VMODSEL1VALTO_ERR: The MODEM sel1 supply value transferred through I2C has
>   *                             not been correctly executed in the given time
> - * @VMODSEL2VALTO_ERR: The MODEM sel2 supply value transfered through I2C has
> + * @VMODSEL2VALTO_ERR: The MODEM sel2 supply value transferred through I2C has
>   *                             not been correctly executed in the given time
> - * @VARMOFFACCESS_ERR: The command value of Varm ON/OFF transfered through
> + * @VARMOFFACCESS_ERR: The command value of Varm ON/OFF transferred through
>   *                     I2C has not been correctly executed in the given time
> - * @VAPEOFFACCESS_ERR: The command value of Vape ON/OFF transfered through
> + * @VAPEOFFACCESS_ERR: The command value of Vape ON/OFF transferred through
>   *                     I2C has not been correctly executed in the given time
> - * @VARMRETACCES_ERR: The command value of Varm retention ON/OFF transfered
> + * @VARMRETACCES_ERR: The command value of Varm retention ON/OFF transferred
>   *             through I2C has not been correctly executed in the given time
>   * @CURAPPWRSTISNOTBOOT:Generated when Arm want to do power state transition
>   *             ApBoot to ApExecute but the power current state is not Apboot
> @@ -376,11 +376,11 @@ enum sia_mmdsp_stat {
>   *                    been correctly executed in the given time
>   * @ARMREGU2VALTO_ERR: The ArmRegu2 value transferred through I2C has not
>   *                    been correctly executed in the given time
> - * @VAPEREGUVALTO_ERR: The VApeRegu value transfered through I2C has not
> + * @VAPEREGUVALTO_ERR: The VApeRegu value transferred through I2C has not
>   *                    been correctly executed in the given time
> - * @VSMPS3REGUVALTO_ERR: The VSmps3Regu value transfered through I2C has not
> + * @VSMPS3REGUVALTO_ERR: The VSmps3Regu value transferred through I2C has not
>   *                      been correctly executed in the given time
> - * @VMODREGUVALTO_ERR: The VModemRegu value transfered through I2C has not
> + * @VMODREGUVALTO_ERR: The VModemRegu value transferred through I2C has not
>   *                    been correctly executed in the given time
>   */
>  enum mbox_to_arm_err {
> diff --git a/include/linux/mfd/lp8788.h b/include/linux/mfd/lp8788.h
> index fd17bec2a33e..e8c50bd38a8a 100644
> --- a/include/linux/mfd/lp8788.h
> +++ b/include/linux/mfd/lp8788.h
> @@ -34,7 +34,7 @@
>  #define LP8788_ALM_IRQ		"ALARM_IRQ"
>  
>  enum lp8788_int_id {
> -	/* interrup register 1 : Addr 00h */
> +	/* interrupt register 1 : Addr 00h */
>  	LP8788_INT_TSDL,
>  	LP8788_INT_TSDH,
>  	LP8788_INT_UVLO,
> diff --git a/include/linux/mfd/max8998.h b/include/linux/mfd/max8998.h
> index 5473f1983e31..ad2ad24412fb 100644
> --- a/include/linux/mfd/max8998.h
> +++ b/include/linux/mfd/max8998.h
> @@ -45,7 +45,7 @@ enum {
>  /**
>   * max8998_regulator_data - regulator data
>   * @id: regulator id
> - * @initdata: regulator init data (contraints, supplies, ...)
> + * @initdata: regulator init data (constraints, supplies, ...)
>   * @reg_node: DT node of regulator (unused on non-DT platforms)
>   */
>  struct max8998_regulator_data {
> diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
> index dabcc0dea802..1d872363820a 100644
> --- a/include/linux/mfd/palmas.h
> +++ b/include/linux/mfd/palmas.h
> @@ -251,7 +251,7 @@ enum tps65917_regulators {
>  	TPS65917_NUM_REGS,
>  };
>  
> -/* External controll signal name */
> +/* External control signal name */
>  enum {
>  	PALMAS_EXT_CONTROL_ENABLE1      = 0x1,
>  	PALMAS_EXT_CONTROL_ENABLE2      = 0x2,
> diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
> index 39fe275a8117..ea9b1a8f495f 100644
> --- a/include/linux/mfd/rohm-bd71828.h
> +++ b/include/linux/mfd/rohm-bd71828.h
> @@ -186,7 +186,7 @@ enum {
>  #define BD71828_REG_RTC_ALM2		0x63
>  #define BD71828_REG_RTC_START		BD71828_REG_RTC_SEC
>  
> -/* Charger/Battey */
> +/* Charger/Battery */
>  #define BD71828_REG_CHG_STATE		0x65
>  #define BD71828_REG_CHG_FULL		0xd2
>  #define BD71828_REG_CHG_EN		0x6F
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
> index 6191f409de94..e489ca0d55ed 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -106,7 +106,7 @@ struct sec_platform_data {
>  /**
>   * sec_regulator_data - regulator data
>   * @id: regulator id
> - * @initdata: regulator init data (contraints, supplies, ...)
> + * @initdata: regulator init data (constraints, supplies, ...)
>   */
>  struct sec_regulator_data {
>  	int				id;
> diff --git a/include/linux/mfd/si476x-core.h b/include/linux/mfd/si476x-core.h
> index d9e3a322134c..40866d7162c9 100644
> --- a/include/linux/mfd/si476x-core.h
> +++ b/include/linux/mfd/si476x-core.h
> @@ -97,7 +97,7 @@ enum si476x_power_state {
>   * @command: Wait queue for wainting on the command comapletion.
>   * @cts: Clear To Send flag set upon receiving first status with CTS
>   * set.
> - * @tuning: Wait queue used for wainting for tune/seek comand
> + * @tuning: Wait queue used for wainting for tune/seek command
>   * completion.
>   * @stc: Similar to @cts, but for the STC bit of the status value.
>   * @power_up_parameters: Parameters used as argument for POWER_UP
> diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
> index b31e07fa4d51..238d9dcefc35 100644
> --- a/include/linux/mfd/twl.h
> +++ b/include/linux/mfd/twl.h
> @@ -739,7 +739,7 @@ int twl4030_sih_setup(struct device *dev, int module, int irq_base);
>  #define TWL4030_REG_VUSB3V1	19
>  
>  /* TWL6030 SMPS/LDO's */
> -/* EXTERNAL dc-to-dc buck convertor controllable via SR */
> +/* EXTERNAL dc-to-dc buck converter controllable via SR */
>  #define TWL6030_REG_VDD1	30
>  #define TWL6030_REG_VDD2	31
>  #define TWL6030_REG_VDD3	32
> -- 
> 2.48.1
>

good job~
Acked-by: Botsz HUANG <huang.botsz@gmail.com>

