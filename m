Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428992;
	b=eFM+bXzjkiQwlAarStQKN6LoX0uTi6TLOz3VY7A4O0PMO/+tFCuXQXUkljPSuW6m3mU/
	 yEostEGZb26ACotteK/9MycXS4PCZTf5T1JwpwTy1t3DQw0O9FSDZS6lJ+eZijlU1NGTz
	 DfvvsPL5IQiNAQDLTiwSjHkb2BRpCcnSYR8KntDv91QKunDubS/PmafQh1u8O6BPu8bXx
	 jCMhHYxXrxEgXBWrsP+bsQDcIh/JmDB2TFr7KnqpZX9aoRtAJ7SAlelwhWu/t5XTWa5kD
	 bnkYkMqDIFld0KfPeoe0xOxKOjK4FiovLViBWhJXk16gkudcC2Im3sx5oc/4elV0HzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bgvtFckoRwO/w6wYyG/SDEa4Hefzwa+zI6y6vYHDT00=;
	b=fYiRuIXENBXkrFvLVKEvgipIFqVnUxX2xZnsOPh94IMnw1DhffydbJhwnNXvirHUp5FT
	 jDoMEQfZ2FrJTq7qwqlyWUoLaCByE04EoEp4vdYXJLb3XQthVOsQoQ2CjOuo58VR2nt0A
	 Xm3TNqpjxHBsnO4xk27oxgCPQKyBsCOiajrfAK0XqwOi6pd1GopJaNddYbnbgNcNgM8pG
	 aDxd0PBKHwlfB5cl59mg4cimL6wuI3mjs57GaKW81B+CGBaslsQ0L0MdSLMavafLPgnuH
	 JzC6gkYCPqMzDrn3lTx2D/SthYIeEp6f+j9G7QMxRBo5jeTCY6BTHerZGgwzQRBOq1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pZTsVKGj;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F80606A32D
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 16:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F80606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pZTsVKGj
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so29358315e9.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 09:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792428990; x=1793033790; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bgvtFckoRwO/w6wYyG/SDEa4Hefzwa+zI6y6vYHDT00=;
        b=pZTsVKGjuxFl/ARs7NmtzPsjMzxWmOrYC6HLVDM9G4Yrf6rp8K2Y//BZpWHCaMEtf5
         mFrKbVjjKh1YqjtZqOvC1cPA6sNxLASuqlqM4tmy/9mGo4QumGxs2wKBoTy4uzQpQghr
         m239qlUTJBfXMaLsRvvErX60ZfxvNdIJWYHWr+sl4HTZwsJRRIawaPpDeNmpfPxU69kV
         oQsTSxFbD4wuvrtoIgM7ePceJbpxy0hD7oXIXfbqGVfcW2hFCDBYT/drYAKi4yNrUuO7
         R00Rehv0Ls7nPS2nAjMrSHMIEfnzGq3GXQBC4CPOLm6FtqxNSDBk5a7v91mtgvSQju4y
         dYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428990; x=1793033790;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgvtFckoRwO/w6wYyG/SDEa4Hefzwa+zI6y6vYHDT00=;
        b=MsWcb15W07EQ/ItVNEEiWJqPsZnRESzw8KwpO2zbBxxO8UA/fvUCG/3OcnECvj/KeU
         aJpqXPspjwXz3OR83jkdylwXQd8wHvbBzUP3AZLKUiiUPhQpGrWMBV0TJaAJs2v2VOlp
         VDvKfEJdDOPOra2O17M28QsJpmlo5iW9+lwZtGIfMXPR2S+6tXJMjA5G5W1kje4A5HPQ
         HjjLeax6Ymeo+jPApH6D+hn2Xu5fxk2FoNDu71YOAUpHk0ynMmvGU4YSBPsXqDxOAQ9q
         TRAC0hMde9a5uMUiTWJuiMmAsX1mgzaCG0RSaWYuYZcsIMGqf0+82qsbr8ETTIRF8Si/
         Bhkg==
X-Forwarded-Encrypted: i=1; AKwUvByX8R3IBgh8gBobR92mf2F2roexSgu+6DnMbzEN1IR29G3vYZ+CzpHQS38/uqOAfxutjpY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9Pj/LglUT3+cy5QElroII72gpKuzy23/G7iM+b3AR+UMkXeV7
	NsVNK1Hz3nPLs7x/u88j6FwK6f4zQJftHn3kREdL3uB/P4l+MTe5w9Oc
X-Gm-Gg: AYBFou2HHKyUL9awhzo7hW6qcmN7/WOlf2ecWV6dyFiyAUEMaqYYPQntYPXVRIkzvCr
	bFosk7EeVR1AGfa0vpmJCpePL9LapqJf5oJoUkqhrK6IftBRm5nYkdiMVRjYkOYalqe5TDoSyqJ
	9N9iZhmpAUxIXbK3pe2KIDBUfn+QPX5nqDjsFco9JxcjhUfqcwW4VpDPnhXQg4vuJZz4s+juTjp
	COXEGp4ei5+aqURalo0a0Ga0IEAkZdDDp2C6gKx8ZgCVrK1hAsGnqzBEQReqWSxqLmjXWEktmDm
	IjW1ib1XOrMKlrXPSBDwHKA1zVjbOdWulMlciB2FWSAeIbH4ZfmcX/lUciMWftpaTCiUZfbKL45
	uTXnkYnWsMG+O2DflEJFLpAbImFEtsGbLX/0W+kGeDb3K7K9Vvv19XLKGROu012q4KeDILfQ9i2
	BtkWBf/1B6xIWj5J9G6dOuLobOAjuzDNF6ZkOjZqEygdnJu8v0n6P2df147df3QEqYBrZtk814K
	mXdN5A1mIwxr1msq05sFQrozanrhauxvOg608DUwl6BAdKsX/GIJHlbLCfnrg==
X-Received: by 2002:a05:600c:1392:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1d75aa87cmr195261465e9.2.1792428989590;
        Mon, 19 Oct 2026 09:56:29 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c59sm92295f8f.30.2026.10.19.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:56:28 -0700 (PDT)
Message-ID: <6ad64bbc.66e4af69.3b9046.552a@mx.google.com>
X-Google-Original-Message-ID: <atZLucG4T0G9wQur@Ansuel-XPS.>
Date: Mon, 19 Oct 2026 18:56:25 +0200
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
 <6ad64981.198a47d7.3d6d5a.6d01@mx.google.com>
 <20261019165231.GJ2663669@google.com>
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
In-Reply-To: <20261019165231.GJ2663669@google.com>

On Mon, Oct 19, 2026 at 05:52:31PM +0100, Lee Jones wrote:
> On Mon, 19 Oct 2026, Christian Marangi wrote:
> 
> > On Mon, Oct 19, 2026 at 05:44:30PM +0100, Lee Jones wrote:
> > > On Mon, 12 Oct 2026, Christian Marangi wrote:
> > > 
> > > > On Sat, Oct 10, 2026 at 04:11:40PM +0000, sashiko-bot@kernel.org wrote:
> > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > - [Medium] mfd: overlapping regmap readable ranges for General Purpose and GPU timers
> > > > > - [Low] mfd: structure and variable naming violates MFD API guidelines
> > > > > --
> > > > > 
> > > > > commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
> > > > > Author: Christian Marangi <ansuelsmth@gmail.com>
> > > > > 
> > > > > mfd: an8855: Add support for Airoha AN8855 Switch
> > > > > 
> > > > > This commit adds support for the Airoha AN8855 Switch which provides
> > > > > a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
> > > > > and registers a regmap for each internal PHY.
> > > > > 
> > > > > > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > > > > > new file mode 100644
> > > > > > index 0000000000000..a2778511dfefc
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/mfd/airoha-an8855.c
> > > > > [ ... ]
> > > > > > +static const struct regmap_range an8855_readable_ranges[] = {
> > > > > [ ... ]
> > > > > > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > > > > > +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> > > > > > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> > > > > 
> > > > > [Severity: Medium]
> > > > > Is this range definition correct? The General Purpose Timer range
> > > > > (0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
> > > > > (0x1000a200 to 0x1000a2ff).
> > > > > 
> > > > > Could this be a typo in the hardware memory map definition? It seems like
> > > > > the General Purpose Timer range might have been intended to end at
> > > > > 0x1000a1ff to avoid overlapping and potential register access boundary
> > > > > issues.
> > > > 
> > > > I have to double check this from documentation, but if possible I would
> > > > like to fix this with a followup patch.
> > > >  
> > > > > [ ... ]
> > > > > > +static int an8855_core_probe(struct mdio_device *mdiodev)
> > > > > > +{
> > > > > > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > > > > > +	struct device *dev = &mdiodev->dev;
> > > > > > +	struct an8855_core *priv;
> > > > > > +	struct regmap *regmap;
> > > > > > +	int num_phys;
> > > > > > +	int i, ret;
> > > > > > +
> > > > > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > > 
> > > > > [Severity: Low]
> > > > > This isn't a bug, but does this variable and structure naming align with MFD
> > > > > subsystem conventions?
> > > > > 
> > > > > The MFD guidelines suggest avoiding generic variable names like priv, and
> > > > > instead recommend using ddata for the instance variable. Also, should the
> > > > > struct name itself avoid hardcoding implementation details like core?
> > > > > Naming it something closer to struct an8855 might better adhere to the
> > > > > subsystem guidelines.
> > > > > 
> > > > 
> > > > I already updated the struct, is it needed to also update the local
> > > > variables?
> > > 
> > > Ah, I was just about to apply this!
> > > 
> > > This would be preferred:
> > > 
> > >   struct an8855 *ddata;
> > >
> > 
> > Ahhhhhh! You got me!
> > 
> > Do you think there might be a faster method to submit this so I can quickly
> > rename the variable and you can pick it? 
> 
> Is everything else ready to go?
> 
> BTW, there is no rush on this - I'm done for v7.4-rc1.
> 

Honestly it's really to slim down this series and the fact that it's
multi-subystem related.

The net part is done, I also asnwered the comments from sashiko but still
waiting a slot for maintainers to check.

I understand there is no rush but it's also true that it's getting
problematic to carry this part in this series (at least for me)

So if we can already include the mfd driver and related DT it might be
ideal.

-- 
	Ansuel
