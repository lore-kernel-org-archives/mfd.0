Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697431;
	b=FrIwf399PAPL6oLOOC3i26pOKeyVTPVUMuiP4scHXcmYxm+SHPV1m6SlxH9ta0fgpOje
	 bXNm2JAZGTGGocqTPozECV0x5VxW9K83nf0X7Bz5suTuewleiakVYsVdOdV4/Mjk7HHeq
	 44ZkCjnXKCi/vJyKmsdjOdunkhHBK/s6IsoIX4itDHIggP0j6xlzB3iTUYJHbiX9LbOrz
	 YuIKvSNiLJ5ZxsCnNXout1lWHlZEhoNfoqM5F/3vwtEp7+HetJCx/p/YX40ScHbWXgD1n
	 KiIOT69+J3zyt7Pvsr/0/+9yL0a3Ao8YUx8/0UyIfZPUBBAf3SkAnMt9Q6c0QHnnnbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
	b=23iEKShxsBDPWN4d3OOZOqs6WHY/6hrwTTWoc5eu54+Bw71Em6ns72/pi8iF4b19p957
	 bEOCMRFfV1hWU6hBnBvWv2SwGYPX8ekMr2QVrv6IB9ezR2ZjzzpjiJIzM5zNABB+0cmDh
	 4/am6NvurreyVxnZXjj4kSgsMgUyCGf+1la3o3v1nAdrV7w6+adIi7O7lv2UhXGbHC2Un
	 r+dcgsYT1rzpIP6W3gMkSm6g5sM7tAQPXaYjNkHz9pp/1EjBHPdw8QkHKsPMDYdHrldwN
	 7r1CON8UHovGb4Jmg4hlLnpLmkyVzT9rMYDTaAgV7neHWrGKB2dClxixwg7w4Opi7Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFN5TY9Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB00606A323
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB00606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFN5TY9Y
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so11515397c88.0
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 04:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697430; cv=none;
        d=google.com; s=arc-20260327;
        b=Ne17GgQsc46nVWktp4QGhTpmIKwWdGCRVD+SeBIe5o+R0bPXtfDMcYcEqsRu0trJCf
         T6egS59bjlQPE66Ug9wxIqMvK/UPozunaS2C0+UiqBWVgj19xvRpqwsK8TDyMWaIEVsu
         q4ZzlK2aIkhCfJiI3+74enNdDz6TEbL0nb3Z/lbgEsFWdo42g5M2nlSFdjrQKAzEces7
         5vNyuSNkiu8jiUCDlykq83bLuRtQ/ZOr8VRQUfxbW0FgInW8yz1U71DTocVg9pGttFsB
         E9Cwu7d0gAF53fOfwDUpzpSk4lxInG4LaJ8empxWVRjiQg16Ah6TCK7QnSDEWqgv5R6g
         8h8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        fh=QQnqolquFW810Rmz+Bp4W8uPEJ88Zl5txwKGToP/8f4=;
        b=LkTgRfR2b7P/bA0ODe8Fqg2K7vQEjejrpSi8SRJ0NxhEGXkpT3e0y+RPMCAVq5FtJF
         jlpCXy7Rwhmqd3MusDlu2xqiZLS+c7AjvlqfrdZ/PsPWYO2T+H8TB1AtMdXaz+45aS3e
         5pMa4w/nZhRzxkrpeZ60XW7Uyr7/lUxLI8BdRXAGzfoX/NiwAZZq9u9DOHXh3/bWzjag
         zarwBI4rIpHifu4fH+trVmnwujZWU+5gXUmIHxndfE7+AJNA8haGleiTnepSLS2AFnrO
         HK+bjcDxyUfKAyH3Bvs91MzkDQaD/bREx9fiNv4uMbDoN44d1lAl456YKKmYCRvTCv64
         ukRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697430; x=1796302230; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        b=NFN5TY9YbcIcg56HY7ClxPxvcm8wM+H+WPs/UJJMTO9b8hoxS0JxH6xyGhqPy9TwBi
         RjHSGJk2sQfXCsCxA3PAzIsds9xsblpyRa7Ez7Nja0j2rb0+kWqcKUPRkTLKa1z70YNe
         n4BsIaNRh3guc5POcUm7/DqaSGyrQvwKmhC9Gb0YTRz2ho4i6WS3BBQjIgRFJc570+6c
         yeSldrGBlqCoNfGcob2qmKgDNHsackIxp5Odh8YW9/hNS7VGQabL3CwTxxJKSHh7N7vg
         lrYdqV+7GImPus0WdUNfAQ7FSeWxvTtXq/HAN1ywF0OEhzG07QcR+w4P7SaXMSRI5sE7
         TH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697430; x=1796302230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruYpKxR0jnfDu2Yt0vn3RyxCANQ3viM4x4RpbrQpd9M=;
        b=HxdPS7+an36cTEdDdt4srzK8o3USmPPdf8JnOFzWWJ9L5U0ReeWwMQZA8emYoOUsEn
         p9SAn5Z5zVHAjeFTwnbddUV0ITrt/brghZORrz5E3lEVHsVtw02YcKpsYv5iE2ODrJis
         C6murv4PczPAPKN8/ZJv/++wiDfH+JINhY47mLcWHeIayp/hjQOSZRSvapM84KBysTz1
         CMTxtbZQiJIE603NyhTqP29URE7vbByCngqhVBiUTSeKjdHqVA3d2Un3lZDPxmivB5L1
         FCi//4Bgc+wQPiaZR9jWMYpXn6tnzui3HKhsedskT9znKcFey/As/UU85hP9AZnrxGcl
         jRmA==
X-Forwarded-Encrypted: i=1; AL+hErE2fEh4yKB8knmeBKo5qZ6I//RcyX1VejJIavY8qTP1H/ktnfI/Z/qWHqX3sQBrdb9cLtg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+GWWDopmMhX95LA7GklA8xFQytU3bISdZ7Lj1y99BkMFHlY5nU
	Ql1FcHQVMRNlHNbPNZXADiBkivZ2oH2DW1gHc0c8cKpNCQV/p4UukHUNBe22Mr41gwGw4aWMhkk
	qEmWYJXgeZN1XIPqaVmsVB8nTK8dVKj0yRQ==
X-Gm-Gg: AZFdTZfe4oWaFkUnYeWTKZr7/2qBFvRPKQev2jffs3is/yZpC1maBu3d6ogBnA8BTMX
	O7YplyOjczUAIGJ+82nubxYVyIa7CflL7eQc0gN9tc1mSgv6NVhSE1lC6p3MaGFBsHNT3MjZe3c
	KaDzUXqMFFw11k9SEiQFXJuQKTun+CrzsME+wMsPyL733rgCnFt7x3z77CNiN/59XH/vxDucqbg
	YTtVH+4+qE+Jp61FX4f5FCaYm2XfwhqEVdRNmxyZDvTv+A0c1XBfMrYwXwbhOwaWkID9FPfaUwj
	ziXwA0RPr8jB1T+5C+ImOXQjq5wB4L/sIPWzA+hYpm202MNC6FSogoqGdsgLtRjAkGP8FoOX/OU
	li593lhtTH2SfTf0QR8T26fbzJJSUHqZNihPwCg/c+j5WVwk/QlOD3uwT03WXg557ef+aMl7vLj
	q6zm+YvzGVteS4qKHovVenm/2mZ5GQ8g==
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id
 5a478bee46e88-3857181d8ddmr20532737eec.41.1795697429793; Thu, 26 Nov 2026
 04:50:29 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115085826.89641-1-clamor95@gmail.com> <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
 <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com> <20261126124719.GJ38590@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261126124719.GJ38590@joneslee-macbookpro.roam.internal>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:50:18 +0200
X-Gm-Features: Aa3M54royAl1sABN4xJ1Cip7AOIlFSUkJQoKYmmC67r_RL_cs_moDjpaDX6PwaQ
Message-ID: <CAPVz0n1xgOqusgO23pXzZdaq0A-j0NyX2PvYPyzrzrqUfYM+3Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:4=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 26 Nov 2026, Svyatoslav Ryhel wrote:
>
> > =D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:47 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
> > >
> > > > The AAT2870 supports a dedicated main power supply input alongside =
parent
> > > > power supply for its internal regulators.
> > > >
> > > > Add support for retrieving and managing these supply regulators
> > > > (vin-supply and in-ldo-supply) using the regulator framework to ens=
ure
> > > > proper power supply dependencies and power-up sequencing.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/mfd/aat2870-core.c            | 5 +++++
> > > >  drivers/regulator/aat2870-regulator.c | 1 +
> > >
> > > Is this a build dep?
> > >
> >
> > More a logical link, I can break it but it still will be part of this p=
atch set.
> >
> > > Would something that was working before, break?
> >
> > Other way, it was broken (aat2870 may have a dedicated supply) and now
> > it is fixed.
>
> Great.  Split it and Mark and I will take them into our own subsystems.
>
> Thanks.
>

Then pick first 3. I will send this as a follow-up

> --
> Lee Jones
