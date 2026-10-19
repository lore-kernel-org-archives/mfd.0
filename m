Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421717;
	b=QyLCSSdwfPCxdzziSnbeRvpwRwEosOlZk0hrjd5Ce5lnna9pekq449P6lPp5QZbOXZIm
	 CynTbWpBlq78ckymfPmIIzQQ8WNBZQ7xP50yG4pRSQ9Smrn5hJkRXRx6GygQmxfYZ/oq3
	 X2T5NNPB3ZEUqq57d/TXInz5esFSNPaJyUTyLV7XxNBLCEA+X2zdfdLVoYLpC0fzqvcHf
	 MHJT7mRy3VRIK3bZiQDxRjQjg5kEfymMI7hc01K3w9dN3sERRb2MJEEc29f8RuJBdp0eW
	 JKP//UlHZPX8rZYRMKyHPSwyjxjmngA0MkOF/n9uhS/ys4VuboTyAQhT89FmJzzi8GQ==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421717;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
	b=bvTJ3nduqTH5KXTePD9HxhrS6fhNorJJpoQlOHklBOoyXcSWdmrdNT7rs81mi1eAifso
	 iPNoksO5eYVQr7xknRkTVFmjyfUZTD7re7jsaeOzEO9Hir7TjXEQIA//CFibnY3lHaKfi
	 j6YNX0JAN2Ud7jbtDZGY9W7TjldK4Faz9kywrnFqLJbv+nbuyWTq8S1SW70SRVueo2F/N
	 XWMsyZITp5GnsXUD6UhFOGC6V8O347b7UbQsp2HeDik011aWol4Ozo6ANct0n5Rk6vzE0
	 2UERu57rzcPl/MA1SGOsptCqgCKszFnDiUgyTVXNSr8T74786esuINnlJgPLgjDdj7g==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LepSe1wF;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579F3606EFFD
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LepSe1wF
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E3533D6
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421717; cv=pass; b=sW8xp5JYYRlwkAyfzNFUeJa/ZtrYiUIYaxb7kx1IUE5C9r+WgqgoHoPzYm8DnU8k010ncjaCUEThGBsF2W1YnkUHABsVQISsHuHshsvLckNZvsvsxe7XLcWsibyq4dfZ1NGPe03zmtaaT2nX27gL/f51V51/4EEL3HKR5rR7634=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421717; c=relaxed/simple;
	bh=AKW3t68ZOk81dPuxPw32ZX6gYuPNE52T8jj7L1+y7RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRGGZo9PiLQePBLqtTYBpqrsSIuHkzXWLhQc3d7e2+v2fmvgazMVFOBFYeL7RX/Kj/XCvocC4e0ujeiaf/UnH7x3dOoBjlCFqB1FYrrN5oBVndJFHYdba/o0c55aDvDWhySbRb23lza+n+nYsv9IHGlKkdmGQueq0VSEB9iPybQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LepSe1wF; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-17bc533fda3so2462587c88.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421715; cv=none;
        d=google.com; s=arc-20260327;
        b=gPFu0g/fk52/nd0oHVVkviEBTGPlqnIJXmyYZyZNyhaV+K78YA9IknU0F35Y8lREvG
         rwJbyXsdFGMACulNrmRL+QDCQO3ORCRwO9whx7XVmELSjmByv8BStBBQtkS8e6YKAXqB
         UBKbDpLYdFUdsKlB9ZZxhTaIOwe3C5UnFrcsP5nIRmTnYhvsw3IFX06hGxQe0YNII4im
         bLdth9IWa0mbbCVZ7u9AAFmxl9LYipdCS5NdsSFNBKG2SSri7Lx3Dy8eqXN/KBEOxutY
         v5d67K/zP7x6yoL7cedz3fZRniQA9O8OjGhxpGFKL3jhcAAvT/Bg9Mo4GOQV8NbFjoF4
         +/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        fh=7QJl5XWodGJUnTMQJADOj5JoN5JioqgMNoIA/H0GtmA=;
        b=Ssz0rJDwkOSPSYyIfguYtU3z552PotLjl4jouWUXe7XX4iWtDC7LC4TcWpA5W6r3IG
         sZ0v++3jJ8M9K2v7qMB8HUxmNWn0hEOxvFhS+clSgW2mSSj7ppeaErpyqT18qsdHQaYG
         ZpT/8dTFLGVprFRdN1RE0m4ne4OK4DcgVZr9PSMK95SCPIn8TaBIBtfx7MCO/Vo8rJBu
         s3/1+4UbXqOx9rA4uIGoHMIrGroU8LtmthS9qOS/PKbMLl5HPVVnCxFl2RsjCA4n6Mw/
         8FVyXIc6LGZDV4Q8dlfqsZL6rL2Fi2CEUzBvT6z3yFwOCVp7xMOf44aSqiE80brI99v7
         Ielw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421715; x=1793026515; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        b=LepSe1wF4cJZXKu5Mgx4n4dBBU8FC1/hhkAJbGICqOapYpPiwaXLA3vVxfzvBrU0Xh
         pCHtd3YosJkgJ1S+XB9082J57UpkyXeFcmDi7XfR5Y4M96AbRsAxQL2PjOd5eQZzD2s4
         GRJO1peOuQgp114WHqysp112gdeeLFhWVLk4KeIq0Nf/ifQg2ZLooOmt4wSN65XQ0a+k
         Ha0av3jrcAXMg6uZ/vIadO59IFTssm4FTAvUIGZe8Zt51kpyxoyOi2skT3NU8RVyLKvV
         0x1qwr7zzVl+ePn0VhruGCzuTwPbpC6QzurTXbiHC5iiZQ18o3NKPaFShGNv4M9DCwwe
         wbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421715; x=1793026515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JVa4anZLJXOQzT6DdFCFiAtwNU6Km/IK3O7kS1gknE=;
        b=gLy2QDTgqPxvxF5GVfZFdkPI9lPiAiqBJMakDg055FU4Gbe+1oyS0SdSto5zPOXEC8
         URXzni4JX4JHe7L6V862XEiCAT/5J1C84GYN+GR64qJxBKccB98ExuSvb9FC0hIHUTCm
         RyP7Mdk6/+J2mezl3HJJeEGYwISEjUNnCjOI+ChlpVobwFdAcY5cEESYVFoZZBtOxNz/
         pYzRrnVdN5ldWU8Wfmk2rH5BFrStPYgFQjIL+0Vno2rz9Yfuuj8hz94A4Qcb52u4nY4d
         l+gqkilOOI9Lkg4EuQeLk65czF5tAJEfXbkiXa9txKGkG5CPZH4V0Op41+V0RHe9gRin
         jdOA==
X-Forwarded-Encrypted: i=1; AKwUvBwXqFDrk2RHeKx4HQjg2bcr1JK7L2CK9BmPBrhVn1fknwJo0FVsXqkuda/8gWteb9vvga4=@lists.linux.dev
X-Gm-Message-State: AFq9FYK7M9a1+UOqmogMnli8P9Scwq+tPUWMfTOiIirYW3EdsqgCnPEB
	V64BLmrAiC/F8vU+txKA6qNxtSwfv8duhKVUIg4ptcUNwKyjZOz+2RIvT85c8yIfE1U6g0QcHga
	ZCSenYJs8eWJUzarg65EJpeyF80cc8FY=
X-Gm-Gg: AYBFou3HN1MUc4HBX99ApCj/ALfiyEEwAA1z8UtmkpC9Jtfsr9sk9Gmru7DLGAksjMr
	uXpuKSv/Vlw97UuP2bWOQK7nmuztgtz40EidOxa7T7r/eO7ssbl9aQSnHXumbdb8QTQM55znmkU
	HQq+MmMxR87FLOfT4R3/0fLcuipCqFweA83hIa23vsJN0lSvnlUkV+O2fDOpO4MI4UGmWe9mtXD
	VEEBpnO5O7Ub2Ew62E1pf8iFcaTS9tgHB+MPf5z8Z+q1z/ly5UrZD0dgF9rzMN61bebuZ6xbolm
	qvOQivaAx/Mdj5dmUnWWo1Slvrva1EayliKracVBoZnGohMpkTBSlPXEtxXMOfeZ8fvNs5d5mAP
	pC7gA7/onPQNS
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id
 5a478bee46e88-361a2e3d3abmr10553103eec.39.1792421714834; Mon, 19 Oct 2026
 07:55:14 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-3-clamor95@gmail.com>
 <179198332384.839288.13126529382772558553@kernel.org>
In-Reply-To: <179198332384.839288.13126529382772558553@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:55:03 +0300
X-Gm-Features: AclHuK-mou-LoaLS3qywfc3GD7SbgOiLXnwqTE0Jl9qjYTR1SQVKYSakF-bo474
Message-ID: <CAPVz0n14BhmK4P-tqnt6AMrAh=W-HPoBbP0ztdOrRd_JocRSqQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:4=
4 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Wrong subject line.
>

What do you mean by "Wrong subject line"? Specify.

> Please review, explain or fix the Sashiko review(s).
> If this is a set, this request includes the other patches too.
>
> > The AAT2870 allows only 32 steps of brightness, with this amount define=
d
> > by the maximum supported current. Remove the need for max_brightness by
> > calculating the allowed number of steps from the maximum current.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
> >  1 file changed, 10 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backl=
ight/aat2870_bl.c
> > index 8b790df1e842b..eb686e315921d 100644
> > --- a/drivers/video/backlight/aat2870_bl.c
> > +++ b/drivers/video/backlight/aat2870_bl.c
> > @@ -24,18 +24,6 @@ struct aat2870_bl_driver_data {
> >       int brightness; /* current brightness */
> >  };
> >
> > -static inline int aat2870_brightness(struct aat2870_bl_driver_data *aa=
t2870_bl,
> > -                                  int brightness)
> > -{
> > -     struct backlight_device *bd =3D aat2870_bl->bd;
> > -     int val;
> > -
> > -     val =3D brightness * (aat2870_bl->max_current - 1);
> > -     val /=3D bd->props.max_brightness;
> > -
> > -     return val;
> > -}
> > -
> >  static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat=
2870_bl)
> >  {
> >       struct aat2870_data *aat2870
> > @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backligh=
t_device *bd)
> >       dev_dbg(&bd->dev, "brightness=3D%d, power=3D%d, state=3D%d\n",
> >                bd->props.brightness, bd->props.power, bd->props.state);
> >
> > -     ret =3D aat2870->write(aat2870, AAT2870_BLM,
> > -                          (u8)aat2870_brightness(aat2870_bl, brightnes=
s));
> > -     if (ret < 0)
> > -             return ret;
> > +     if (brightness) {
> > +             ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightne=
ss - 1);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       if (brightness =3D=3D 0) {
> >               ret =3D aat2870_bl_disable(aat2870_bl);
> > @@ -150,10 +139,11 @@ static int aat2870_bl_probe(struct platform_devic=
e *pdev)
> >       else
> >               aat2870_bl->max_current =3D AAT2870_CURRENT_27_9;
> >
> > -     if (pdata->max_brightness > 0)
> > -             bd->props.max_brightness =3D pdata->max_brightness;
> > -     else
> > -             bd->props.max_brightness =3D 255;
> > +     /*
> > +      * The maximum number of brightness steps is determined by the ma=
x current.
> > +      * The aat2870_current enum maps directly to the allowed brightne=
ss steps.
> > +      */
> > +     bd->props.max_brightness =3D pdata->max_current;
>
> What happens if 'pdata->max_current' is 0?  Above, we fall back to
> AAT2870_CURRENT_27_9 when assigning 'aat2870_bl->max_current'.  Shouldn't=
 this
> use 'aat2870_bl->max_current' instead, and if 'aat2870_bl->max_current' i=
s no
> longer used anywhere else, should it be dropped from 'aat2870_bl_driver_d=
ata'?
>

Resolved in v4

https://lore.kernel.org/lkml/20261019100930.110954-1-clamor95@gmail.com/

> >
> >       aat2870_bl->brightness =3D 0;
> >       bd->props.power =3D BACKLIGHT_POWER_ON;
> > --
> > 2.53.0
> >
>
> --
> Lee Jones
