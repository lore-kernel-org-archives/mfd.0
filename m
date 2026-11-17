Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922754;
	b=5rd03fdM5e+AowcTD5S1aCodBxvVgoD72D6QxnXkFxxjRk6hxXQJtEb74KHHJ3SLpRtz
	 nJ/7eP9hGNvPnJTRoPmCapIeomkSFKDE6oqLo7B0ZsrPUg5WWsx11A1kv3FTR1jmOm+Ax
	 BO4v3ZDJb3dIoI7k6Pjq6DIt4MhhZWWK34pWpj6G4Oz0h8VWYqbXENITLQabm7kd97qga
	 P8Sr90LlAMNQf9jg9K/nHOrJ2j7xbMATqvjjtzghGi7zA2ZIIit6JYXwt0//gdyc24tqH
	 mjuxzEd3uvtpr5CWwn8FqqZ4Qr+mSOdTClJIKSOY2tpf3uq6gh8Ga/4sWVzFQsRhCog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=09R3lOh1wOFf5cQMSYWu6LsJcHr0cCCnDln1UQeQ3Kg=;
	b=wWX331A2PCshrkk3JQm7aV4scevxP5Bik6f3jSyX6HOArSZVhWj00/7SEyFyfuSRfjPL
	 SlwiRxM0i5Uu54xotJ8I6yGmeV2avAMGs7VLiJOjgk1FY8p+gVeOVHQzi4NQ9I0lwaOUY
	 AXzhg34159MvsNA0XAiMIj7t2gLrAQz1omFph8XbtaY9YvmDPWycFMhrWV7BEUPeWnnc9
	 JHk5mQEFPsSyd5uiEefJ01A+pN1VoYbfH4C6Zyh0ZsJ8k9/F3cFqgY3N2Mmo1L6vp6j/T
	 z5tWZ9bRNGWDLJiN/DyXjSmaGVowtVq6IRHQtY9tSKXjKSFnLM6N33SY3J4RuMwH0Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wX714J7B;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BF8606A338
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 13:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65BF8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wX714J7B
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso33261155e9.0
        for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 05:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922752; x=1795527552; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=09R3lOh1wOFf5cQMSYWu6LsJcHr0cCCnDln1UQeQ3Kg=;
        b=wX714J7BB6PuBSUuPxk2+0Y+BkSCIsOwAQyQj5DqiUNgPFX7dQOFVzhJ0BH2G3V2Wc
         GuvJpeNfjRWA+YsHvxidzaLjc454rn5/f+kNTyaClnWSODyyscfWCH50JNNb1oi9nT9u
         lsVj7eFqPLLxVTWOlFYFh2jU+g5SHLXLWqtcHMyuNeobu4Kv63dz0EMBoykrP7CStz3I
         5imfDbj0y57+rN8uSaoYF5D8gAGbICbYBtzUrxJNQ+ITAQPs/lbx1fsKRNy5dAVo2jPQ
         S4xZKXvmTfJUvtaiQx086Fm8Sj/EVl0BBW7RYsOFqXQHcQHgAbKFnOd60WHaAxeqSvLo
         ZDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922752; x=1795527552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09R3lOh1wOFf5cQMSYWu6LsJcHr0cCCnDln1UQeQ3Kg=;
        b=TWmr/9hY1yWE3G1iRsPQPoYMkBAbTeP3MP8o0L+P5SmyfKNMDyq0unG+S4oVhBU7wY
         89TE7TeHeJeFs09+s2bRhtmLCNA+f4EJy6iBsQI8RpZWdOVGYxeP/RAuUcEqGilnW54O
         AOv52BULrC7R4oDuHWMOGxfDjkYhxrVmpXsshA3hBb0vCnGEysgEPystrqW6WWiNskZq
         ueNxmLL++JJtkQXlgFYbg5UVZIieiDwCeVNnp9ilT6IASQH/b2s0F5aXyFDDPbvpErc1
         bKQ1WjEP10tXhlANRCvxxXNgHLrBYXMUlCv/ITohcuwNzH6dCz2mz7o2vTlzWI7GmU4T
         M9Fg==
X-Forwarded-Encrypted: i=1; AL+hErHuFA2PwBWsDXEBfMzp+fpsm8OSsVRaHoyUPvIbSHqPBg32isyBXNew3SVr7VdD2jNaRog=@lists.linux.dev
X-Gm-Message-State: APuU4Z937MF0DG9tfcojhXdMMoVhNe6DItEHJA3t3YtieD0EREL3c9yt
	WwnJr79uyVp/lqIKeAG9xbdwtyC28Zewhixoso1EkyKKCtgcstbiU/9d
X-Gm-Gg: AYBFou29vKPFHyvuPVKXRe/6OiOyRVkCCgad1rrAh7VVH8rizG98a9IA1wIJdlF4l2u
	syixP5HBDLMuJIVrMhDIJsTw+mH8TI7nf6H5/9Lnk8vBXrjzVXtZkbDHAi7nSvcWrCzEIY44+jG
	I/yN5ReHd3MnJ5jZj966HymNeRVy/N2KaSZWmcy/9sLPZgief1GXyrIVHJWrTMYYzGQkok/Uceu
	jvJ0ZkhbEMxuoDGdgYNHATXEsuDuPZbOauncwJjZwNUInOkqbicHuiJhqkSBAUcofIRjqw9ot/0
	xO6+eDjnsEeWr5RsCFOx9UVqvE0SjbCjAKjDYJiB2mstVlQuazmL3MCtVUYdfGP+8o3mD41fnYR
	SYSs6sEX4vAsZCVmb3mgJnZYuD3yLcTQHwzlWGVfCOyMTGfuyrHGZaoxEx3SDKP3omQGQkMZqvi
	ZlH8baFupxOodHaC2uJ/DaZbeZM0GDN5bXTq0ttShLXxv/tu7gYqSV/vz5DvRa0GArJESqfGk1U
	i+6A1vgAQ69xiXKKxRn/kp5UQjEspqrRRWO/nJchVx02pJzFlihP5SGa+oMwVfANGn7kNndoM1B
	wPw08GO1e0a0cOBZWT5rQl46iRUnJCx8t/vgBjWdgHM0boe5815ZHsw44DaIijAeEXb94vYj+lz
	M6gdWx1LH+cfjNIMy
X-Received: by 2002:a05:600c:6989:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb68233edamr216683745e9.20.1794922751487;
        Tue, 17 Nov 2026 05:39:11 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5671059bsm222808165e9.1.2026.11.17.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:39:10 -0800 (PST)
Message-ID: <6afc58fe.d7f8dee2.386e81.2730@mx.google.com>
X-Google-Original-Message-ID: <avxY_H1cKtyfBDAy@Ansuel-XPS.>
Date: Tue, 17 Nov 2026 14:39:08 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: an8855: Add support for Airoha AN8855 Switch
References: <20261103203034.12869-1-ansuelsmth@gmail.com>
 <20261103203034.12869-3-ansuelsmth@gmail.com>
 <179381088649.1840692.12177563377919419687@kernel.org>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179381088649.1840692.12177563377919419687@kernel.org>

On Fri, Nov 13, 2026 at 08:07:42PM +0000, Lee Jones wrote:
> Please review, explain or fix the Sashiko review(s).
> If this is a set, this request includes the other patches too.
> 
> > Add support for Airoha AN8855 Switch that provide support for a DSA
> > switch and a NVMEM provider.
> >
> > Also make use of the mdio-regmap driver and register a regmap for each
> > internal PHY of the switch.
> > This is needed to handle the double usage of the PHYs as both PHY and
> > Switch accessor.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/mfd/Kconfig         |  14 +
> >  drivers/mfd/Makefile        |   1 +
> >  drivers/mfd/airoha-an8855.c | 579 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 594 insertions(+)
> >  create mode 100644 drivers/mfd/airoha-an8855.c
> >
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 87ed55c155f0..653a81435b20 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -54,6 +54,20 @@ config MFD_ALTERA_SYSMGR
> >  	  using regmap_mmio accesses for ARM32 parts and SMC calls to
> >  	  EL3 for ARM64 parts.
> >
> > +config MFD_AIROHA_AN8855
> > +	tristate "Airoha AN8855 Switch Core"
> > +	select MFD_CORE
> > +	select REGMAP
> > +	select PHYLIB
> > +	select MDIO_REGMAP
> > +	depends on NETDEVICES && OF
> > +	help
> > +	  Support for the Airoha AN8855 Switch Core. This is an SoC
> > +	  that provides various peripherals, to count, i2c, an Ethrnet
> > +	  Switch, a CPU timer, GPIO, eFUSE.
> > +
> > +	  Currently it provides a DSA switch and a NVMEM provider.
> > +
> >  config MFD_ACT8945A
> >  	tristate "Active-semi ACT8945A"
> >  	select MFD_CORE
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index f8101d2a9ce9..96bbe3fad736 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
> >  obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
> >  obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
> >  obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
> > +obj-$(CONFIG_MFD_AIROHA_AN8855)	+= airoha-an8855.o
> >  obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
> >  obj-$(CONFIG_MFD_SM501)		+= sm501.o
> >  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
> > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > new file mode 100644
> > index 000000000000..6a270555db5c
> > --- /dev/null
> > +++ b/drivers/mfd/airoha-an8855.c
> > @@ -0,0 +1,579 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Core driver for Airoha AN8855 Switch
> > + *
> > + * Copyright (C) 2024 Christian Marangi <ansuelsmth@gmail.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/fwnode_mdio.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mdio.h>
> > +#include <linux/mdio/mdio-regmap.h>
> 
> Alphabetical.
> 
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/phy.h>
> > +#include <linux/regmap.h>
> > +
> > +/* Register for HW trap status */
> > +#define AN8855_HWTRAP			0x1000009c
> > +
> > +/*
> > + * Register of the Switch ID
> > + * (called Project ID in Documentation)
> > + */
> > +#define AN8855_CREV			0x10005000
> > +#define   AN8855_ID			0x8855 /* Switch ID */
> > +
> > +/* Register for GPHY Power Down
> > + * Used to Toggle the Gigabit PHY power and enable them.
> > + */
> 
> This is an incorrectly formatted multi-line comment.
>

Sorry I was following netdev comment style (that is also deprecated)
 
> > +#define AN8855_RG_GPHY_AFE_PWD		0x1028c840
> > +
> > +/* MII Registers */
> > +#define AN8855_PHY_SELECT_PAGE		0x1f
> > +#define   AN8855_PHY_PAGE		GENMASK(2, 0)
> > +#define   AN8855_PHY_PAGE_STANDARD	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x0)
> > +#define   AN8855_PHY_PAGE_EXTENDED_1	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x1)
> > +#define   AN8855_PHY_PAGE_EXTENDED_4	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x4)
> > +
> > +/* MII Registers Page 4 */
> > +#define AN8855_PBUS_MODE		0x10
> > +#define   AN8855_PBUS_MODE_ADDR_FIXED	0x0
> > +#define   AN8855_PBUS_MODE_ADDR_INCR	BIT(15)
> > +#define AN8855_PBUS_WR_ADDR_HIGH	0x11
> > +#define AN8855_PBUS_WR_ADDR_LOW		0x12
> > +#define AN8855_PBUS_WR_DATA_HIGH	0x13
> > +#define AN8855_PBUS_WR_DATA_LOW		0x14
> > +#define AN8855_PBUS_RD_ADDR_HIGH	0x15
> > +#define AN8855_PBUS_RD_ADDR_LOW		0x16
> > +#define AN8855_PBUS_RD_DATA_HIGH	0x17
> > +#define AN8855_PBUS_RD_DATA_LOW		0x18
> > +
> > +#define AN8855_MAX_PHY_PORT		5
> > +
> > +struct an8855 {
> > +	struct mii_bus *bus;
> > +	struct mii_bus *phy_bus;
> > +	unsigned int switch_addr;
> > +	u16 current_page;
> > +};
> > +
> > +struct an8855_phy {
> > +	u8 addr;
> > +	struct an8855 *core;
> > +};
> > +
> > +struct an8855_phy_bus {
> > +	struct mii_bus *bus;
> > +	struct fwnode_handle *node;
> > +	u8 addr;
> > +};
> > +
> > +static const struct mfd_cell an8855_cells[] = {
> > +	MFD_CELL_OF("an8855-efuse", NULL, NULL, 0, 0,
> > +		    "airoha,an8855-efuse"),
> > +	MFD_CELL_OF("an8855-switch", NULL, NULL, 0, 0,
> > +		    "airoha,an8855-switch"),
> 
> Use 100-chars to avoid these pointless wraps.
> 
> They also appear to be shorter than some following lines.
> 
> > +};
> > +
> > +static int an8855_mii_set_page(struct an8855 *ddata, u8 addr,
> > +			       u8 page) __must_hold(&ddata->bus->mdio_lock)
> 
> This should line-up with the ( and is that 8 spaces?
> 

Probably confusion with the patch... it's 7 space and it's lined upo (or
checkpatch would have complained)

> > +{
> > +	struct mii_bus *bus = ddata->bus;
> > +	int ret;
> > +
> > +	ret = __mdiobus_write(bus, addr, AN8855_PHY_SELECT_PAGE, page);
> > +	if (ret) {
> > +		dev_err_ratelimited(&bus->dev, "failed to set mii page\n");
> 
> Can we start sentences with an upper-case char?
> 
> > +		return ret;
> > +	}
> > +
> > +	/* Cache current page if next MII read/write is for Switch page */
> > +	ddata->current_page = page;
> > +	return 0;
> > +}
> > +
> > +static int an8855_mii_read32(struct mii_bus *bus, u8 phy_id, u32 reg,
> > +			     u32 *val) __must_hold(&bus->mdio_lock)
> > +{
> > +	int lo, hi, ret;
> > +
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE,
> > +			      AN8855_PBUS_MODE_ADDR_FIXED);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_HIGH,
> > +			      upper_16_bits(reg));
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_LOW,
> > +			      lower_16_bits(reg));
> > +	if (ret)
> > +		goto err;
> > +
> > +	hi = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_HIGH);
> > +	if (hi < 0) {
> > +		ret = hi;
> > +		goto err;
> > +	}
> > +
> > +	lo = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_LOW);
> > +	if (lo < 0) {
> > +		ret = lo;
> > +		goto err;
> > +	}
> > +
> > +	*val = ((u32)hi << 16) | lo;
> 
> No magic numbers please.
> 
> > +	return 0;
> > +err:
> > +	dev_err_ratelimited(&bus->dev, "failed to read register\n");
> > +	return ret;
> > +}
> > +
> > +/*
> > + * Protect concurrent access to phy page if switch address also
> > + * expose a PHY.
> > + */
> > +static void an8855_regmap_lock(struct an8855 *ddata)
> > +{
> > +	if (ddata->phy_bus)
> > +		mutex_lock(&ddata->phy_bus->mdio_lock);
> 
> Nit: \n
> 
> > +	mutex_lock_nested(&ddata->bus->mdio_lock, MDIO_MUTEX_NESTED);
> > +}
> > +
> > +static void an8855_regmap_unlock(struct an8855 *ddata)
> > +{
> > +	mutex_unlock(&ddata->bus->mdio_lock);
> 
> Nit: \n
> 
> > +	if (ddata->phy_bus)
> > +		mutex_unlock(&ddata->phy_bus->mdio_lock);
> > +}
> > +
> > +static int an8855_regmap_read(void *ctx, uint32_t reg, uint32_t *val)
> > +{
> > +	struct an8855 *ddata = ctx;
> > +	struct mii_bus *bus = ddata->bus;
> > +	u16 addr = ddata->switch_addr;
> > +	int ret;
> > +
> > +	an8855_regmap_lock(ddata);
> 
> Nit: \n
> 
> > +	ret = an8855_mii_set_page(ddata, addr, AN8855_PHY_PAGE_EXTENDED_4);
> > +	if (ret < 0)
> 
> Can an8855_mii_set_page() return positive values?
> 
> If not, please use 'if (ret)'.
> 
> > +		goto exit;
> > +
> > +	ret = an8855_mii_read32(bus, addr, reg, val);
> > +
> > +exit:
> > +	an8855_regmap_unlock(ddata);
> > +
> > +	return ret < 0 ? ret : 0;
> 
> Both an8855_mii_set_page() and an8855_mii_read32() only return 0 or a
> negative error code.  Can't you just 'return ret;' here and in
> an8855_regmap_write() and an8855_regmap_update_bits()?
> 
> > +}
> > +
> > +static int an8855_mii_write32(struct mii_bus *bus, u8 phy_id, u32 reg,
> > +			      u32 val) __must_hold(&bus->mdio_lock)
> > +{
> > +	int ret;
> > +
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE,
> > +			      AN8855_PBUS_MODE_ADDR_FIXED);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_HIGH,
> > +			      upper_16_bits(reg));
> > +	if (ret)
> > +		goto err;
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_LOW,
> > +			      lower_16_bits(reg));
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_HIGH,
> > +			      upper_16_bits(val));
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_LOW,
> > +			      lower_16_bits(val));
> 
> 100-chars throughout.
> 
> > +	if (ret)
> > +		goto err;
> > +
> > +	return 0;
> > +err:
> > +	dev_err_ratelimited(&bus->dev,
> > +			    "failed to write an8855 register\n");
> > +	return ret;
> > +}
> > +
> > +static int an8855_regmap_write(void *ctx, uint32_t reg, uint32_t val)
> > +{
> > +	struct an8855 *ddata = ctx;
> > +	struct mii_bus *bus = ddata->bus;
> > +	u16 addr = ddata->switch_addr;
> > +	int ret;
> > +
> > +	an8855_regmap_lock(ddata);
> > +	ret = an8855_mii_set_page(ddata, addr, AN8855_PHY_PAGE_EXTENDED_4);
> > +	if (ret)
> > +		goto exit;
> > +
> > +	ret = an8855_mii_write32(bus, addr, reg, val);
> > +
> > +exit:
> > +	an8855_regmap_unlock(ddata);
> > +
> > +	return ret < 0 ? ret : 0;
> > +}
> > +
> > +static int an8855_regmap_update_bits(void *ctx, uint32_t reg, uint32_t mask,
> > +				     uint32_t write_val)
> > +{
> > +	struct an8855 *ddata = ctx;
> > +	struct mii_bus *bus = ddata->bus;
> > +	u16 addr = ddata->switch_addr;
> > +	u32 val;
> > +	int ret;
> > +
> > +	an8855_regmap_lock(ddata);
> > +	ret = an8855_mii_set_page(ddata, addr, AN8855_PHY_PAGE_EXTENDED_4);
> > +	if (ret)
> > +		goto exit;
> > +
> > +	ret = an8855_mii_read32(bus, addr, reg, &val);
> > +	if (ret < 0)
> 
> Same here - 'if (ret)'.
> 
> > +		goto exit;
> > +
> > +	val &= ~mask;
> > +	val |= write_val & mask;
> > +	ret = an8855_mii_write32(bus, addr, reg, val);
> > +
> > +exit:
> > +	an8855_regmap_unlock(ddata);
> > +
> > +	return ret < 0 ? ret : 0;
> > +}
> > +
> > +static const struct regmap_range an8855_readable_ranges[] = {
> > +	regmap_reg_range(0x10000000, 0x10000fff), /* SCU */
> > +	regmap_reg_range(0x10001000, 0x10001fff), /* RBUS */
> > +	regmap_reg_range(0x10002000, 0x10002fff), /* MCU */
> > +	regmap_reg_range(0x10005000, 0x10005fff), /* SYS SCU */
> > +	regmap_reg_range(0x10007000, 0x10007fff), /* I2C Slave */
> > +	regmap_reg_range(0x10008000, 0x10008fff), /* I2C Master */
> > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > +	regmap_reg_range(0x1000a100, 0x1000a1ff), /* General Purpose Timer */
> > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> > +	regmap_reg_range(0x1000a300, 0x1000a3ff), /* GPIO */
> > +	regmap_reg_range(0x1000a400, 0x1000a5ff), /* EFUSE */
> > +	regmap_reg_range(0x1000c000, 0x1000cfff), /* GDMP CSR */
> > +	regmap_reg_range(0x10010000, 0x1001ffff), /* GDMP SRAM */
> > +	regmap_reg_range(0x10200000, 0x10203fff), /* Switch - ARL Global */
> > +	regmap_reg_range(0x10204000, 0x10207fff), /* Switch - BMU */
> > +	regmap_reg_range(0x10208000, 0x1020bfff), /* Switch - ARL Port */
> > +	regmap_reg_range(0x1020c000, 0x1020cfff), /* Switch - SCH */
> > +	regmap_reg_range(0x10210000, 0x10213fff), /* Switch - MAC */
> > +	regmap_reg_range(0x10214000, 0x10217fff), /* Switch - MIB */
> > +	regmap_reg_range(0x10218000, 0x1021bfff), /* Switch - Port Control */
> > +	regmap_reg_range(0x1021c000, 0x1021ffff), /* Switch - TOP */
> > +	regmap_reg_range(0x10220000, 0x1022ffff), /* SerDes */
> > +	regmap_reg_range(0x10286000, 0x10286fff), /* RG Batcher */
> > +	regmap_reg_range(0x1028c000, 0x1028ffff), /* ETHER_SYS */
> > +	regmap_reg_range(0x30000000, 0x37ffffff), /* I2C EEPROM */
> > +	regmap_reg_range(0x38000000, 0x3fffffff), /* BOOT_ROM */
> > +	regmap_reg_range(0xa0000000, 0xbfffffff), /* GPHY */
> > +};
> > +
> > +static const struct regmap_access_table an8855_readable_table = {
> > +	.yes_ranges = an8855_readable_ranges,
> > +	.n_yes_ranges = ARRAY_SIZE(an8855_readable_ranges),
> > +};
> > +
> > +static const struct regmap_config an8855_regmap_config = {
> > +	.name = "switch",
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +	.max_register = 0xbfffffff,
> > +	.reg_read = an8855_regmap_read,
> > +	.reg_write = an8855_regmap_write,
> > +	.reg_update_bits = an8855_regmap_update_bits,
> > +	.disable_locking = true,
> > +	.rd_table = &an8855_readable_table,
> > +};
> > +
> > +static int an8855_regmap_phy_reset_page(struct an8855 *ddata,
> > +					int phy) __must_hold(&ddata->bus->mdio_lock)
> > +{
> > +	/* Check PHY page only for addr shared with switch */
> > +	if (phy != ddata->switch_addr)
> > +		return 0;
> > +
> > +	/* Don't restore page if it's not set to Switch page */
> > +	if (ddata->current_page != AN8855_PHY_PAGE_EXTENDED_4)
> > +		return 0;
> > +
> > +	/*
> > +	 * Restore page to 0, PHY might change page right after but that
> > +	 * will be ignored as it won't be a switch page.
> > +	 */
> > +	return an8855_mii_set_page(ddata, phy, AN8855_PHY_PAGE_STANDARD);
> > +}
> > +
> > +static int an8855_regmap_phy_read(void *ctx, uint32_t reg, uint32_t *val)
> > +{
> > +	struct an8855_phy *ddata = ctx;
> > +	struct an8855 *core_ddata;
> > +	u32 addr = ddata->addr;
> > +	struct mii_bus *bus;
> > +	int ret;
> > +
> > +	core_ddata = ddata->core;
> > +	bus = core_ddata->bus;
> 
> Why not initialise 'core_ddata' and 'bus' when declaring them?
> 

It was to keep the reverse tree. But ok.

> > +
> > +	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> > +	ret = an8855_regmap_phy_reset_page(core_ddata, addr);
> > +	if (ret)
> > +		goto exit;
> > +
> > +	ret = __mdiobus_read(bus, addr, reg);
> > +	if (ret >= 0)
> > +		*val = ret;
> > +
> > +exit:
> > +	mutex_unlock(&bus->mdio_lock);
> > +
> > +	return ret < 0 ? ret : 0;
> > +}
> > +
> > +static int an8855_regmap_phy_write(void *ctx, uint32_t reg, uint32_t val)
> > +{
> > +	struct an8855_phy *ddata = ctx;
> > +	struct an8855 *core_ddata;
> > +	u32 addr = ddata->addr;
> > +	struct mii_bus *bus;
> > +	int ret;
> > +
> > +	core_ddata = ddata->core;
> > +	bus = core_ddata->bus;
> 
> Same here.
> 
> > +
> > +	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> > +	ret = an8855_regmap_phy_reset_page(core_ddata, addr);
> > +	if (ret)
> > +		goto exit;
> > +
> > +	ret = __mdiobus_write(bus, addr, reg, val);
> > +
> > +exit:
> > +	mutex_unlock(&bus->mdio_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct regmap_config an8855_phy_regmap_config = {
> > +	.reg_bits = 16,
> > +	.val_bits = 16,
> > +	.reg_read = an8855_regmap_phy_read,
> > +	.reg_write = an8855_regmap_phy_write,
> > +	.disable_locking = true,
> > +	.max_register = 0x1f,
> > +};
> > +
> > +static int an8855_read_switch_id(struct device *dev, struct regmap *regmap)
> > +{
> > +	u32 id;
> > +	int ret;
> > +
> > +	ret = regmap_read(regmap, AN8855_CREV, &id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (id != AN8855_ID) {
> > +		dev_err(dev, "Detected Switch ID %x but %x was expected\n",
> > +			id, AN8855_ID);
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int an8855_phy_bus_register(struct device *dev, struct an8855 *ddata,
> > +				   struct device_node *phy_np,
> > +				   struct an8855_phy_bus *phy_bus_info)
> 
> Why can't we do this in the phy driver?
> 

More info below.

> > +{
> > +	struct mdio_regmap_config mrc = { };
> > +	struct an8855_phy *phy_ddata;
> > +	struct regmap *regmap;
> > +	u32 addr, phy_offset;
> > +	struct mii_bus *bus;
> > +	int ret;
> > +
> > +	ret = of_property_read_u32(phy_np, "reg", &addr);
> > +	if (ret)
> > +		return ret;
> > +
> > +	phy_offset = addr - ddata->switch_addr;
> > +	if (phy_offset >= AN8855_MAX_PHY_PORT)
> > +		return -EINVAL;
> > +
> > +	phy_ddata = devm_kzalloc(dev, sizeof(*phy_ddata), GFP_KERNEL);
> > +	if (!phy_ddata)
> > +		return -ENOMEM;
> > +
> > +	phy_ddata->addr = addr;
> > +	phy_ddata->core = ddata;
> 
> Nested ddatas!
> 

Is it a problem? I can merge in the full ddata... It's really to keep
things organized.

> > +	regmap = devm_regmap_init(dev, NULL, phy_ddata, &an8855_phy_regmap_config);
> > +	if (IS_ERR(regmap))
> > +		return dev_err_probe(dev, PTR_ERR(regmap),
> > +				     "phy%d regmap initialization failed\n",
> > +				      addr);
> > +
> > +	mrc.regmap = regmap;
> > +	mrc.parent = dev;
> > +	mrc.valid_addr = addr;
> > +	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%u", dev_name(dev), addr);
> > +
> > +	bus = devm_mdio_regmap_register(dev, &mrc);
> > +	if (IS_ERR(bus))
> > +		return PTR_ERR(bus);
> > +
> > +	if (addr == ddata->switch_addr)
> > +		ddata->phy_bus = bus;
> > +
> > +	phy_bus_info->bus = bus;
> > +	phy_bus_info->addr = addr;
> > +	phy_bus_info->node = fwnode_handle_get(of_fwnode_handle(phy_np));
> > +
> > +	return 0;
> > +}
> > +
> > +static int an8855_mdio_register(struct device *dev, struct an8855 *ddata,
> > +				struct an8855_phy_bus *phy_bus_infos)
> > +{
> > +	struct device_node *mdio_np;
> > +	int ret = 0;
> > +	int i = 0;
> > +
> > +	mdio_np = of_get_child_by_name(dev->of_node, "mdio");
> > +	if (!mdio_np)
> > +		return -ENODEV;
> > +
> > +	for_each_available_child_of_node_scoped(mdio_np, phy_np) {
> 
> Can you use __free(device_node) for 'mdio_np' too, or use the fwnode API
> consistently throughout instead of mixing 'of_*' and 'fwnode_*'?
> 
> > +		if (i >= AN8855_MAX_PHY_PORT) {
> > +			ret = -EINVAL;
> > +			goto exit;
> > +		}
> > +
> > +		ret = an8855_phy_bus_register(dev, ddata, phy_np,
> > +					      &phy_bus_infos[i]);
> > +		if (ret)
> > +			goto exit;
> > +
> > +		i++;
> 
> This isn't a meaningless iterator.  Can we name it?  'phy'?
> 
> > +	}
> > +
> > +exit:
> > +	of_node_put(mdio_np);
> > +	if (ret) {
> > +		while (i--)
> > +			fwnode_handle_put(phy_bus_infos[i].node);
> > +
> > +		return ret;
> > +	}
> > +
> > +	return i;
> > +}
> > +
> > +static int an8855_probe(struct mdio_device *mdiodev)
> > +{
> > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > +	struct device *dev = &mdiodev->dev;
> > +	struct regmap *regmap;
> > +	struct an8855 *ddata;
> > +	int num_phys;
> > +	int i, ret;
> > +
> > +	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +	if (!ddata)
> > +		return -ENOMEM;
> > +
> > +	ddata->bus = mdiodev->bus;
> > +	ddata->switch_addr = mdiodev->addr;
> > +	/* No DMA for mdiobus, mute warning for DMA mask not set */
> > +	dev->dma_mask = &dev->coherent_dma_mask;
> > +
> > +	/* Register virtual MDIO for each PHY */
> > +	num_phys = an8855_mdio_register(dev, ddata, phy_bus_infos);
> > +	if (num_phys < 0)
> > +		return num_phys;
> > +
> > +	regmap = devm_regmap_init(dev, NULL, ddata, &an8855_regmap_config);
> > +	if (IS_ERR(regmap)) {
> > +		ret = PTR_ERR(regmap);
> > +		dev_err_probe(dev, ret, "regmap initialization failed\n");
> > +		goto err_put_fwnodes;
> > +	}
> > +
> > +	/* Reset PHY page for switch address */
> > +	mutex_lock_nested(&ddata->bus->mdio_lock, MDIO_MUTEX_NESTED);
> > +	ret = an8855_mii_set_page(ddata, ddata->switch_addr,
> > +				  AN8855_PHY_PAGE_STANDARD);
> > +	mutex_unlock(&ddata->bus->mdio_lock);
> > +	if (ret)
> > +		goto err_put_fwnodes;
> > +
> > +	ret = an8855_read_switch_id(dev, regmap);
> > +	if (ret)
> > +		goto err_put_fwnodes;
> > +
> > +	/* Release global PHY power down */
> > +	ret = regmap_write(regmap, AN8855_RG_GPHY_AFE_PWD, 0x0);
> > +	if (ret)
> > +		goto err_put_fwnodes;
> > +
> > +	/* Register PHYs */
> > +	for (i = 0; i < num_phys; i++) {
> > +		ret = fwnode_mdiobus_register_phy(phy_bus_infos[i].bus,
> > +						  phy_bus_infos[i].node,
> > +						  phy_bus_infos[i].addr);
> > +		fwnode_handle_put(phy_bus_infos[i].node);
> 
> Why do we need 'an8855_phy_bus' and two separate loops at all?  If you
> initialise the switch regmap, verify the Switch ID, and release
> 'AN8855_RG_GPHY_AFE_PWD' before calling an8855_mdio_register(), can't
> an8855_phy_bus_register() call fwnode_mdiobus_register_phy() directly?
> That would allow you to drop 'struct an8855_phy_bus', the
> 'phy_bus_infos' array, and all of the manual fwnode_handle_get() /
> fwnode_handle_put() error-unwinding.
> 

You probably missed all the revision and fight with sashiko. It's needed to
first have all the virtaul bus and then register the realted phy. Or
race/panic can happen on unloading or if one of the 2 error out.

> Or, better yet, move all of this phy stuff out of MFD, which shouldn't
> have to know all of this stuff.
> 

The reason of this is the fact that the PHY page needs to be enforced.

Every PHY can access the switch by setting page 4 but PHY MUST USE page 0
and page 1 for PHY handling or wrong data/wrong registers are accessed.

This is why these virtual bus are needed, to attach custom read/write
function to enforce correct page usage.

> > +		phy_bus_infos[i].node = NULL;
> > +
> > +		if (ret)
> > +			goto err_put_fwnodes;
> > +	}
> > +
> > +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, an8855_cells,
> > +				    ARRAY_SIZE(an8855_cells), NULL, 0,
> > +				    NULL);
> > +
> > +err_put_fwnodes:
> > +	for (i = 0; i < num_phys; i++)
> 
> 'phy' and 'for (int phy = 0; ...'
> 
> > +		if (phy_bus_infos[i].node)
> > +			fwnode_handle_put(phy_bus_infos[i].node);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct of_device_id an8855_of_match[] = {
> > +	{ .compatible = "airoha,an8855" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, an8855_of_match);
> > +
> > +static struct mdio_driver an8855_driver = {
> 
> So this isn't a platform driver?
> 
> Not sure how we feel about splitting an mdio driver into various
> platform drivers?
> 

It's a strange thing... It's like it's more or less a SoC that use MDIO as
the comunication conduit. This is why I'm using MFD.

> > +	.probe = an8855_probe,
> > +	.mdiodrv.driver = {
> > +		.name = "an8855",
> > +		.of_match_table = an8855_of_match,
> > +	},
> > +};
> > +mdio_module_driver(an8855_driver);
> > +
> > +MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
> > +MODULE_DESCRIPTION("Driver for Airoha AN8855");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.55.0
> >
> 
> -- 
> Lee Jones

-- 
	Ansuel
