Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398614;
	b=q2z8/l0cPk3L3J9OjIXSvyaH4l1nhR0ThOUm4zI9gw7N1uhvpOmJ/PtI9WAR1UNA9Bc1
	 veeEFpXmwQYxNDKmUywdR/1UKGKSFJISzLiMZ21w//I01ev3U8D9ElPJGMo9GgYLep0AU
	 kd9gdtwNAKh1RURbTgm3NdUJpDQxVnoHdRqXhmpPuyZMtcIWIFfdbPKxfDgf6BrfGQHtV
	 n/WTH/opybz9xEuy91bR3I8zxkaZ/CnGXFNfO999QKEjSXLDluMDSdFY6tZQHZH4WVcFN
	 MISJ2Zi0GtrTyFus5UGtT58KppTq7P4TdHd5yz67KIdd4Y/Bt7SpNCeXxbzA64GretQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=HPgiKAKXJD1IfapqnG6OwznXuOp3qOSKSxNr/yY/XDo=;
	b=AIqwZexJVez3YRNdgRex4SR6F2dHK9rbJozJXjxYACWsgoATi9IyI4ARr+qjnRYeLX82
	 45lwGiTThbLf6a/yyyuMwhDSHHNQU/Qls9APchqozb0SAaQhFVhzXD5JyiBHRfiNIL+t2
	 A+NQsMJkA4yBVGaV6zf3aoOtVc8bQ9fSmBVgOuoJT6P6Qk32E+GT2xrWoyqVTfhZE/nNi
	 /JMmES2hr1HE2munzJAhgEUECsFv257o0Qxt8vScFulxOz64tRJsFHrD6zJS1Z5qguqFz
	 ImVaqShSMaguISkBG9nB9Ac7DGFgPTNXWjysGlEq7dD0EbCwoT2tYjMVrvVykutCbkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FRGyOUHF;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0154606A31E
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 01:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0154606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FRGyOUHF
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so4135675c88.1
        for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 17:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795398613; x=1796003413; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPgiKAKXJD1IfapqnG6OwznXuOp3qOSKSxNr/yY/XDo=;
        b=FRGyOUHFDTdZUojn3jzl+JjXfnR69iGIQGeUGv7Ek3wYw0UQQ/2aKnf6mec6u9Ldus
         4xL8hxDUlThGB4L/MRsr8IfoADTIi1+oiv77thhIkJMglYPk+4U7rEBgdXHHpkXdzk6e
         k1FRxD/3gd1vtJ9S5rXn9ZOFpyFruCjK9XCqTvBCzcnZB4h1bfLLN0Op3fkm6i4M4BJe
         1XY/vd1rakWds5w/Ggrg1AG7vgojm8iMCjYnztKYuXzUEJh0y8OZzwm25j9MIVkDCtj4
         kf7fZOkjS1d93obW9OIUVLpbXRTYu7mTqL4v+iubw4W5K2F/wHluz/kK/j9gum1Dp+Vr
         YEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398613; x=1796003413;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HPgiKAKXJD1IfapqnG6OwznXuOp3qOSKSxNr/yY/XDo=;
        b=Ts3pQzdB9Rhpegm9GrLY7erQO3gYtggUGoHUgh4Ggkp4hlPQyEUD3K1eD321QALDxA
         d3X6ac08g4j6tJad/weDikYEbapduoTK++vlcnmhG44hc9Y2HADDEROCECy5TDYaWefd
         qABMxw3218qVL9UrN89A6KihQciS3J6JO8drKePZJJicN4PgihzwyfHiADcB3gt6nbjO
         jlfIK7DODlMG3hTP9l20fR0zSBEEeSrZJwYQeSNPJJBXaD5etF3dnJWZTeHfXaN0523g
         06FSHxG47kQSsm8ewpffVHs8RqAfqIkl1uUc8YK3wjsvjerpDmf+yCef8/Cq9nBl95Cf
         ApfA==
X-Forwarded-Encrypted: i=1; AL+hErGN/yMqDFMzvMkidISs9PznFPPdzJtUOMmBYvU7S/4IwUsxceG000z4TFA0vYGUkLU7UoA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/PGmuCSlp+cfL7p6pa37wkSb5T9noxSyBzCqZbIpWVuiQo2zlk
	suWI1LY1nGqRsRLLlRytYgXDKZNy1j3RCrvLuZ4ercyCjaC86hqayP8R
X-Gm-Gg: AZFdTZdXIlFeDI3wzsRIyuej5dTZfFTMcmwt/xriybwgaEYdMMgAamLniTobelAVKYl
	ZSUq003tcpgJPHBJv2F0MozbtAtGvfHr5X0zp0inNLN84GoN9N3WK5EQiWWA0i0B8CRjQTcr+S6
	dvjrb8MY31gxqMJdbCiFMCaaKEWmAc/rOTw6OW38sxVY5eh3dtZGjwbicJjYDUirdjTuZkSJRrt
	aBWsGH6FbDsZrmIN6E3hz47/jYkCgeRQbFhCtFJhOFThdCYEDTMaGbPPZNurmjE5CeHg5xGlbBB
	7fmT81JjvKsBhe69V5n+vbxwkS+To6S75ADeL8Mu+HSdjg1JQ5+cPZix9MIrJFPO++2HelySu2R
	C9asu04p8VPaKELbVqE/MZ/LRXyAY2dnKhr1aYAt5/Jwiemg/PeK3Fqst+Rwb9uAcLzkE60kByn
	YNJekAQSHBrwiFhigc7QR79iQVJoi8wt18M5MhzvdvuPJJuCFW7z1wcclczd8HGEVsp82vuhDDo
	w+p+lea6TeEz3yCMcu6wrPvx6ptMuYgNNlw84QydDa/zkoaBrXkAbkGXMb/c3HM9pzhhfyrTMYm
	toVrAUms6PU7Zlgt91TjzOhTBd420TxjwWP1a6Z31oTw/yM5Tn7YAiPCXZGR64zKIBrQwg==
X-Received: by 2002:a05:701b:230b:b0:1b2:4da6:bccd with SMTP id a92af1059eb24-1b5568feaadmr8740253c88.34.1795398612828;
        Sun, 22 Nov 2026 17:50:12 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm23364703c88.3.2026.11.22.17.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:50:12 -0800 (PST)
Date: Sun, 22 Nov 2026 17:50:11 -0800
Message-ID: <8c2d4920319771e3f7edb083b2e831a9@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Cc: Mark Brown <broonie@kernel.org>,
	Jakob Unterwurzacher <jakobunt@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: rk805-pwrkey - enable the wakeup interrupt during system suspend
In-Reply-To: <7bec766f-14b1-4eac-96c7-d7f1cf38021d@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de> <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de> <avUGEQhSKlko0Fm9@google.com> <7bec766f-14b1-4eac-96c7-d7f1cf38021d@cherry.de>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Jakob,

On Fri, Nov 20, 2026 at 02:42:57PM +0100, Jakob Unterwurzacher wrote:
> On 11/12/26 01:25, Dmitry Torokhov wrote:
...
> > Sounds like this needs to be solved in PM core rather than hacked around
> > in individual driver? Let's CC Tony and Rafael.
>
> How about something like this, copy-pasted below? If no immediate 
> objections I'll post it as a proper patch.
>
> With this, rk805-pwrkey can use dev_pm_set_wake_irq with no issues 
> (tested on RK3588-Tiger).

This approach makes sense to me (and matches what several I2C controller
drivers such as i2c-imx already do), though ultimately it is up to Mark
Brown to decide for SPI.

For rk805-pwrkey, please use devm_pm_set_wake_irq() in v2.

...
> >     Take a runtime PM reference in the regular suspend phase and drop it on
> >     resume. This keeps the controller usable until its noirq suspend
> >     callback, and since it was active then, pm_runtime_force_resume()
> >     restores it in the noirq resume phase, before interrupts of child
> >     devices are handled again.
> >     
> >     Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Probably worth adding

	Fixes: be721b451aff ("spi: rockchip: Resolve unbalanced runtime PM / system PM handling")

as well.

...
> > +/*
> > + * Child devices (e.g. an RK806 PMIC with its interrupt controller and wakeup
> > + * interrupts) can still need the bus during the late and noirq phases of
> > + * system suspend and resume, while runtime PM is disabled. Keep the controller
> > + * runtime-active from the regular suspend phase on, so that such transfers
> > + * work and pm_runtime_force_resume() restores the controller in the noirq
> > + * resume phase, before child device interrupts are handled again.
> > + */

One nit on the comment: rockchip_spi_isr() does not use IRQF_NO_SUSPEND
(and pl330 DMA suspends in the late phase), so arbitrary transfers in
child suspend_noirq()/resume_noirq() callbacks still will not work. What
this actually enables are PIO transfers in the late/early phases, during
device_wakeup_arm_wake_irqs() before device IRQs are suspended, and once
resume_device_irqs() re-enables them at the end of the noirq resume
phase. It might be worth wording the comment more precisely so nobody
assumes general noirq transfers are supported.

Thanks.

-- 
Dmitry
