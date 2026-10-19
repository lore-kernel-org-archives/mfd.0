Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428420;
	b=Q16vQZ3x7GTDMELYPBRXfySKjVWm6PFQSt4UUNm7yZH4Rcj517Y7eACRdvFNTqykGokS
	 7Ijn44oQ2CAcAHBDmncsItpvWWSAZXiKtYVQTJiXkBxapcWn2F/dXCTf6R660qKDlSQmd
	 C7vpNjc3NYppG7739Fk9p0IuQk06qJhEChsO0+GMyCY6jbt6sm0RoKIpgTniTar5mSuPk
	 2my1ez4nZAa+tPmTUHShypwW1zESoTO8WwCirHdjQPJIeoj0Sqj01PanWMyTnS3RmpUqC
	 P97owgSPXIZsMxv53mOTI3EAP8sgXSPaIP73q3MEfIcSa1xdouEL4Y/KBit6Y6he+ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0/9efCui3/xIgzAalfuRCkOK3+yAIMEf/WrJRW5n/Zc=;
	b=iKbtkxuPEi0p36epN6q9ZOBXVNp69QwD2/fiZCN6YekoNljyrWZhLCD0GWBGFdNhdkBA
	 JbE8ulFs8kdmbga2OG1Wr9ZNhCcE+FNfk/i8aW1eCZUUK4BmDBnN0PzxB+hcD8XC6K+ql
	 KyY6driJtpmyyWg5IQRWIXi1aSgyifcXu5EwUQOh+3StC85AUhQ2GAYZ3uYDdw/I9b3zu
	 md4sJAVyIwuV1OhLKhpK7lWNursVS9PjnasAG/tzoEiXFhNCAq66K0PltcKYQrc52fGjZ
	 zkxOVR9+gmWDLfvyVeq17TK5Vuzchmzn7sTJ0hhYSoh0Yc6yYZdnUqKv1WWRrigc6GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JV3bOuWZ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9D606A324
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 16:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B9D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JV3bOuWZ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so9556995e9.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792428419; x=1793033219; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/9efCui3/xIgzAalfuRCkOK3+yAIMEf/WrJRW5n/Zc=;
        b=JV3bOuWZ9nDvqSjces454GoZxw+gfRlRNyCUXOIz2ZlaG2mw2C40H6WtbbKHdFjvYg
         PQrOgXcIFeMS0OcXi7efY8bSRIuMUATi+lezm/KhJFA/jPT1taoqApE98eC1gr8LMp9o
         brFB9nalzx/szc/gXD9QHfY1W3cpR3XExsaQ9I5hJ3qC+FuwvDfdBwjIsmps25gL8gUL
         J2XO9wZjW9jc1ntp8dTPXmxDpH4zAWuow42g1PL5vEEww9tyi/6DU2Tq3xvXEB3DbqZh
         oaWr1NxA7G9j+Rd0daA7ceaRNDNBrVa8ff3GzFkrT4gE/WDKeJ8kKHR6+Fvf0bcKFakQ
         T5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428419; x=1793033219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/9efCui3/xIgzAalfuRCkOK3+yAIMEf/WrJRW5n/Zc=;
        b=DJp8McdwBcPO9e6GlhTn6syBHiYJOZNQRBAC/JLfeNM/UcNVgZfLzkcZXEqYI2jrOt
         /G2Qt3rpZj+lAFYvlkczrDevO5VM6w26z4UdCv5BmGDZ1NwUcgUuIt69ADDFX3kVArmP
         OxQc9jo1c2W9hxQn04wX2/Es4ujWwntkQgwQTvmt6j3TALYD+BI5+9h/RwyeMDFHul0R
         ycnXcWCPfZppBVcg/7Ks8FxReFZoKun5PQKJryS9jgQ95G9L73saGNUs754+FPo+0IT+
         OXp1+Jx0/B9IMfzlQ4pQUOJWpB85ToH1bRFzBXCe8VFJVzvVz9+/yUIWBOjHoJ9cCFI7
         E4WA==
X-Forwarded-Encrypted: i=1; AKwUvByY/zr7MoxV/c5Kb6uQokjSOlOx0Laaby6lMO8yu0kL0oJFsjoUSHPFUutUipYMcFav/Sw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJT6sonBcV7Ca7HR1dGBzZPnRUPUNbtIWIvX7S22E1bPAFTDzie
	9r0qX3roZseGmT6Ucx74WXrvYexYdX/hTl0oCmiCde/e2mqu5OhtxcWF
X-Gm-Gg: AYBFou1O0gfTCLjzvw7OL5Jh1HvuMeBgweMQ2Coimt6D9eD1oH/8eXyfKdDbSauZmtZ
	SdwYbKFXQBKX34UCQUtFmN3UHBi/TK7u9TyfEfkarS1xNuc6Z19cnMVlj5IwpyUWFG8f+MUWExu
	XSLWfk9aV5K/ZJsRhiqdQ3K2sOvoGZqEJb5KJgKjtHtrvg+dMsLYueJUkN+/sVJyoje3FFCTBZa
	Xcn8ae3Bt/kWU8isX+1mfHx4HHSQoFWVjhVFQ7Zlq2VgiW+VjSBrMOC68ej8flaxikQJ94aEue0
	Za9XTsihtaRnSl2+5g6AoMXqzxe41zIFb3jq/koCIoIeA1wLqPqUdy+NFW1vxV4f5mVLCyGqSCy
	wXVaAXgNfH86RUeqZIhaiUTgbV4ZZynbxTItMMkesNCunBtH0Un81ThFMofXdlIs+9WHaL6GXIm
	HvZYWbjfzviZ5YPA4d0NkxOhslOizRi2II4w7o3j1sALn4FzK5KjbDF+jLn0kUxdxTk99lrxDM7
	s0ueXA2nFQQU2qCxXx1C+oyKUQucxXQRiJKlCN5Y947ZWAqrkY4lKPlp0EHkg==
X-Received: by 2002:a05:600c:3551:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a1d75a4653mr187564615e9.2.1792428418471;
        Mon, 19 Oct 2026 09:46:58 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm2377005e9.4.2026.10.19.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:57 -0700 (PDT)
Message-ID: <6ad64981.198a47d7.3d6d5a.6d01@mx.google.com>
X-Google-Original-Message-ID: <atZJfjkGIL2V--en@Ansuel-XPS.>
Date: Mon, 19 Oct 2026 18:46:54 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
 <sashiko-outbox-166721@kernel.org>
 <6acccc4e.4c22a69b.132624.271f@mx.google.com>
 <20261019164430.GI2663669@google.com>
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
In-Reply-To: <20261019164430.GI2663669@google.com>

On Mon, Oct 19, 2026 at 05:44:30PM +0100, Lee Jones wrote:
> On Mon, 12 Oct 2026, Christian Marangi wrote:
> 
> > On Sat, Oct 10, 2026 at 04:11:40PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > - [Medium] mfd: overlapping regmap readable ranges for General Purpose and GPU timers
> > > - [Low] mfd: structure and variable naming violates MFD API guidelines
> > > --
> > > 
> > > commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
> > > Author: Christian Marangi <ansuelsmth@gmail.com>
> > > 
> > > mfd: an8855: Add support for Airoha AN8855 Switch
> > > 
> > > This commit adds support for the Airoha AN8855 Switch which provides
> > > a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
> > > and registers a regmap for each internal PHY.
> > > 
> > > > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > > > new file mode 100644
> > > > index 0000000000000..a2778511dfefc
> > > > --- /dev/null
> > > > +++ b/drivers/mfd/airoha-an8855.c
> > > [ ... ]
> > > > +static const struct regmap_range an8855_readable_ranges[] = {
> > > [ ... ]
> > > > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > > > +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> > > > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> > > 
> > > [Severity: Medium]
> > > Is this range definition correct? The General Purpose Timer range
> > > (0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
> > > (0x1000a200 to 0x1000a2ff).
> > > 
> > > Could this be a typo in the hardware memory map definition? It seems like
> > > the General Purpose Timer range might have been intended to end at
> > > 0x1000a1ff to avoid overlapping and potential register access boundary
> > > issues.
> > 
> > I have to double check this from documentation, but if possible I would
> > like to fix this with a followup patch.
> >  
> > > [ ... ]
> > > > +static int an8855_core_probe(struct mdio_device *mdiodev)
> > > > +{
> > > > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > > > +	struct device *dev = &mdiodev->dev;
> > > > +	struct an8855_core *priv;
> > > > +	struct regmap *regmap;
> > > > +	int num_phys;
> > > > +	int i, ret;
> > > > +
> > > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > 
> > > [Severity: Low]
> > > This isn't a bug, but does this variable and structure naming align with MFD
> > > subsystem conventions?
> > > 
> > > The MFD guidelines suggest avoiding generic variable names like priv, and
> > > instead recommend using ddata for the instance variable. Also, should the
> > > struct name itself avoid hardcoding implementation details like core?
> > > Naming it something closer to struct an8855 might better adhere to the
> > > subsystem guidelines.
> > > 
> > 
> > I already updated the struct, is it needed to also update the local
> > variables?
> 
> Ah, I was just about to apply this!
> 
> This would be preferred:
> 
>   struct an8855 *ddata;
>

Ahhhhhh! You got me!

Do you think there might be a faster method to submit this so I can quickly
rename the variable and you can pick it? 

-- 
	Ansuel
