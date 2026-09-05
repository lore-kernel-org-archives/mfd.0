Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFC9296BC8
	for <mfd@lists.linux.dev>; Sat,  5 Sep 2026 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788610168; cv=none; b=ISey4PVQ92Yh1R9MOBYZeCuI9EzKcDy2GAXnBQ4EfWOlJsmh7S0C3sAB0RniwYFFSZ6Ch+cKcDz0qo2GPPzkYeMMlm6pz2rSQVsViXkd5fiCL1HPZnRCZlI8wymTlJl7+k/H9VcTKTGNeJvXi5RK0HrmIen2gbGJ6+LMmb6E11A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788610168; c=relaxed/simple;
	bh=DiJxiFNXhFG1plQ9zJLQLn71kZEFf3NEqOCZTCKyvw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHlhsqv/9akb5lpvhnE+HmUn9m+XShIzpHPXAZX+PFTaOp5oOInnS3Kg+MORD7S9lL1MIYVvg+o9pDwHd2vQsX/8J3MbS2W7XqU+NYk/G4VXIXzh0KdQp8uGjjMC9UXcPWjA46ZeoPf6ljjt/d19jecxIkOqoM2oVhj4UzWdACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbwzrDTk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbwzrDTk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2254490a91.1
        for <mfd@lists.linux.dev>; Sat, 05 Sep 2026 05:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788610166; x=1789214966; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nNJORH3YGlZxLWwixVhbCct5+yk2ZAkw7RdZaj4KWU=;
        b=DbwzrDTkuwhY7Jcge8WdQGftQ1T0OPUSTTj+sDyI+DkizNzjdWUKdiWfUxYEqDT2Rv
         SLLWRTRC8cq56pNVYvpZTr8FOd+sT9dglRUQBY/umXOwlOH4xJC1BcEh9bH7yLt3LcVA
         OOSJzpnvaKAw8DPjD00M9pfMZgmL5b5GLWRVllGfB7VrkYAHFnow9TGsa4ozukrXaR5S
         PmRg9NXN4XLkDJds4f9JvAv+3FPH9MxhRzVOTxCAb0qiHDnYSoHhSVzTymu07hAEGKaj
         +SbF7RZBLkDtXJSMtc4Qr1XwAjtwPCoseVG23cYsABTfgNB/zM2DtA0cVO2dpNZBxX+/
         DgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788610166; x=1789214966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nNJORH3YGlZxLWwixVhbCct5+yk2ZAkw7RdZaj4KWU=;
        b=hYxPF10VqAu6AuGL+g+EmpBPECn6ASN+wPzCwumYH1ndGwu//N1659KBkVqPrVgHRa
         d466d6/WoOyXbjUG0lK2DnidVLCYke2/nIMexH1dKVptVSBKaY2KvhIMUu8bf3tbLZXu
         hx96GpA0jya+wu6J5Az5msWnEvm1r02yWSXRtyaBBQS/Ob4Jd6eNTWft4s3W1VPHoaoY
         B6qwmJHD6/SY6mfGHbZ4QWSKeV4HwDSP7IDqpHvCgknDf3Krrzh1y8F2gG4R/Do5i3p7
         qEUzgXnlMx1W0ywvDIu1aQ76oP/31g71xujec/bRmRrjNdIF/j5LpOkIm6fIxUJNaJKi
         9Z1g==
X-Forwarded-Encrypted: i=1; AKwUvBx/9vP/gPWMDT2C+H2T/w2flAC/csNkpbqo0VfyffB4wCd296g2mZ5v+JX5CUmR1DYTV9w=@lists.linux.dev
X-Gm-Message-State: AFuF++nALiXuXL2heguUHQBORtxK7aKzpqG1t+USAcFpm76cYR2X2+mL
	EfAWClSPQ1lyoMm29fZSqJyqSGWydtNgQ1LyC6Sad541KX9U+7RuF76+
X-Gm-Gg: AYBFou3iwouL5ayFd9zbmXdjHodX+n5QEDv1o3ECPJB3OeslikGr4j6I35WNvdtNTKt
	KAD6TAFO2dx89NplGkYbX2DBHUqflT9Xqve9iffutXIC+CcdB+bDqM2WCUd785Qv5t3lAsFpmvq
	QgHozIEGCsP/jX/56Q+gMTkCfl/f2CF1di7qDvMypqgRRyWsZpu6UyqM77APGaykY+6bqDyiucT
	OSVuDmXOWqfxjjadNLhbjWmRY/CCgg/EYbFwX9hl9BaVas80E1amV1TbW7P8Qfy+ffs5TmGk+Pe
	bbilhgTBz1ye84NkVsUes9Kti1mIUOwx30Js6S6WF0FS5zBzfkxkUzSilD6LZ9RXxr6lalSYMCa
	oTWYF4ZwQsPCCtERGajLXsLcVzVL7+1oj2go1d4gkg4YT3jl2XVuacn4NgvPEacQWQdU4nprmXX
	SbFWHAsBMQnhGC5WeFz1vJgNknZlVyEixmp/DCpiY/OKCH5af11oazdRslUtb2q4xmgz62XWc8A
	+dejKMWYNRVtYOzFZZ3ME/BPRbKcFcRPD9VuEIdGIQND9EA2YBrtIRS0HYh88+4c+6U4Kzg+lph
	LiXSV7ezsBc=
X-Received: by 2002:a17:90b:3d48:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-39b260e13e0mr17911289a91.3.1788610165515;
        Sat, 05 Sep 2026 05:09:25 -0700 (PDT)
Received: from nickhuang (2001-b400-e2da-caae-e718-2aad-4c92-5b14.emome-ip6.hinet.net. [2001:b400:e2da:caae:e718:2aad:4c92:5b14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm16487288a91.15.2026.09.05.05.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:09:25 -0700 (PDT)
Date: Sat, 5 Sep 2026 12:09:21 +0000
From: Nick Huang <sef1548@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: fix typos in comments
Message-ID: <apwGcRLAYLPKFuZK@nickhuang>
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
Hi Hemanth 

LGTM 

Acked-by: Nick Huang <sef1548@gmail.com>
