Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792426047;
	b=Vg7F0DLG61XspF/sqUnu2EhdJbqczNFrShX9Jbj9PHfuZ7REr4tZ6cq+xts6pb7tpq5e
	 ZiIDpQoOVtr8xtryUwHKwpDhQvoBRjLxeHRmVju4qiurxgolkBweeBuiBbVTDkFXv5sGN
	 NVEtVZMExg5A4S5azsRgGm9WkhcLfpfGBPmJ4Zg896p2Km03sahoO+qM342NsxWyPpa0V
	 7JBgjAeuEVazivJvmrffOFb2wEnEMsdtSXskG034Dk3XuBy/5LNHUUjcREONLVGoj058+
	 hmTsroj/hq2gUxfV/+9WXMnV+sGvNzm5BWdp6w1BBg2iV331zbOLqZ+ATPKPil8rFvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
	b=eR4dTGPt6WxNtwvtqNbitOl9siff//GQPBva2YBSuHuLzjficGSAxDWTN7WpGLHXKDqc
	 2O7L3WLN+0EyEGOVQdvrcacz25cqGDKwps1PqUUTYycpSvA1ytrM1IHDfE85GLYwsrPSN
	 jznQpo4SayAQ4gCrKU9uLuDMC0suEeQbGy07wOTaESUHSNNwnnWCmgpFif6ooRLxz0R0A
	 BIgB5n6ETC9c6Qkbex86aRcaPKGQ+FuxLh2kyLHG5nSvurBdJkuZ2E7xmrlV29o4ZEC1F
	 zGRdIApyLxjttXdZvh68gT0uL+Z/UZhYcdxGuAuohSgLO4HDkku/dUPDvUQSPz6iP1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F6zQT7tv;
	arc=fail smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DDD606AFAB
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 16:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DDD606AFAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F6zQT7tv
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514b90bb89so5872189eec.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 09:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426046; cv=none;
        d=google.com; s=arc-20260327;
        b=mMOD2P5866485kbmdwoSp0zYX0kwt/Spfj3vK8BWf1mP3Y4qKCKrSJRW+Lttw22h+N
         KHBMtnlVjqVWvRxpB7TZNp6IPPPFwOOqcioXf7A7fu1PF4B68pdiVHhPr8zbdYBjpanq
         l0ogU1JlXvb0QrZCCAOwGtmx+8jpxmqTVbegzszLlSlrlEvtyiO3Ld6Oy+hjSsjY2ILS
         E4GZN7rSHpdilL3bhX1w+Jy1koz/TGMIyYlSlmheG7HaeFGkCoA4EfMJuXsgU+A7Iwkb
         VDyLdArEpUipX+aruLTFCeJ4CYc5JlN9cbL/PtNMisOfZc8zba74n0SVs7pTVr7MyJ1G
         T4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        fh=YrKULtXIQQOe3EmZzh1Omb9MjQEyLVkxnLbyj6YwiB4=;
        b=lUxfgo7tunp1WRaPhtnflvt/2cJjMtWP0eekHiX1beq3alUGXDY13ujJrT2mPYTfb8
         JoNIe0EqrfUUMGJcoDVt9BVfQzr1yOGj8qxm2VdGuJiIzp5kjqDMvtPRrI1GeqrfORR3
         g8Vy4xu6vZk/uNo5C6IuS3hn4OoIsKcF9WOvXmB9FJMBavIWOcnNvLp8f3T38anOcyiB
         NUHF6lnPB+mUlIT09xoWzqU9nBaZboR1C21tjaA2Z6oWLPTq3PzRGGaCKaSLVtHjzgkr
         t4jX+vWiK5sji41avJMZF5ZaiNz6FomNSSKDpz2PdROe4cQokcoPRy0DDPXW8newUWSN
         +ZnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426046; x=1793030846; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        b=F6zQT7tvS7yTs862GYugrggdILe+KTuX036/sKRIqd6PqA6tehxWbbfnvYb05M7QnV
         APVKg8pJkvfOZhYV4HQV4poyigph0HZb/pb65O8NPDg2la5cBk9BjdjwXi/m/SHDa6bH
         VlfPz35La5bo7geqt4UNFJqxopbZqKn0NAjYu2J8hKuK1PTtWmX7egWNq+qJ/LRB/RWA
         lY95yA0FVM84RlLlGlRuNcbf97HPqVlQGnCxrfNn3ZJZ9PLH3cHyj/bxwv7m9ofxlzFg
         nJIT/NKW6TYT0vJZfIjOPj9nEfqCipLpAn0X6A+/j9pE0Sp3Z3cTQ3zJnl6ySllrSoKQ
         faow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426046; x=1793030846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        b=T5BjjY4D9uHiiycrEEvhss8nvsebHdkStvR7zyAX6+kZh7bqybAOP+2BmitwowATuM
         2IlUbQzDUAKgOcRyyTbxL4Ia1urgnJkZx/sIiH4Lv4VmGc4N805DaMy7Bct7MvDL+Zgb
         ViLBZEnap9VLlvq09X/GeQuDkSHhVjblY8YRHaYU3qVrJE8d3FJgXxobk7PYSWAo0NN3
         BTSn1FgVAv/A80Rr2PQT+wo/XAIBt5SWF7GuMYYX+MotBI3y6PcfNw45vdNS9/QEasWG
         bIyESJKCSdPUwtphEXQsOR5W0e0tvjYtjKsnnIKrCjn23i1WNO58Yd4LHED0GvjFdR8+
         +bjA==
X-Forwarded-Encrypted: i=1; AKwUvBz1lJY4L/tJBmhK9GGMNrb/Aq6Agv89KJpkC6V8a1mAK5/R6zf8rVWRal4KAUK1FHePG+g=@lists.linux.dev
X-Gm-Message-State: AFq9FYLL8RswfNsA67dcmnxc9rmYhA2H2KTJxDFSgpY72s92m0znexjh
	xsAjo/N6hsews9i/37HzcF2cfZsCNbbCyX08tfGOI4LtsjKISG5BGdSYNGAyaM6vurlXQmir/wp
	PnvE52Q5Smq4Vz7TyeB70BFCBPAZ2VI0=
X-Gm-Gg: AYBFou1SmgNv7t5ALh1NXEh4RjJKRl+XnaYw9yrRsipUUtxC3C3DmLq3RlGiEpToJAd
	8icujTPJULqWveNkwN9zJrA8fZ9EcDfQ+DIFh9/mKeM4PhUzInILjFoRM3nyuiVeHlWTihgpqtK
	XMISqQMlKWySt1U23GimJ75s/Bs5x4zxNRbsSlZzHT1iL05TiVa6gk4E4J6oJVHY9tad8ItgTuh
	j2Ju3szqSvn++vabodpc/OO02Gv21mkWYWMTNLP2ZDEqraL8zqcy1p1bmRXhoeU1B5iYpHLm2Ks
	/PbT6DB/WC7w+2cxJLl1j9LIckcDLLbHPW6tv5fmKHZ9jeV9M13TAViSX+QObm4HlxOjPMbSiBw
	izQyBAsoUQko9
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id
 5a478bee46e88-361a2c38d17mr11330019eec.33.1792426045527; Mon, 19 Oct 2026
 09:07:25 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-2-clamor95@gmail.com>
 <179198322819.839288.5272985130898382430@kernel.org> <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>
 <20261019160202.GE2663669@google.com>
In-Reply-To: <20261019160202.GE2663669@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 19:07:12 +0300
X-Gm-Features: AclHuK9VJmJMQJiC82ERiz5L-8HMq7v4t7pij145Dauw6OWtgiTFIN9w7D539M0
Message-ID: <CAPVz0n2oCKyLKG+pXFw2hAfMTXXSjrwwsFRrhzC24d33LOi-zg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:0=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
>
> > =D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
17:52 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Wrong subject line.
> > >
> >
> > What do you mean by "Wrong subject line"? Specify.
>
> This is a LEDs patch, but you have incorrectly tagged it as `mfd:`.
> Honestly, I would have thought it would have been obvious, hence the
> lack of further explanation.
>

Uh, yes, I have figured this out already, but thank you for
explanation and patience.

> > > > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lig=
hting
> > > > Management Unit.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++=
++++
> > > >  1 file changed, 124 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks=
,aat2870.yaml
> > >
> > > [...]
> > >
> > > --
> > > Lee Jones
>
> --
> Lee Jones
