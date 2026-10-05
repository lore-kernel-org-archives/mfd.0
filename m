Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9B5208DF
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 17:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220726; cv=pass; b=k8H4G9aLuT4kfBotWmSNL6qvnO5Gv+8ruVlVWbakBki639aPMqZ9DNzlpQ43l6rjkTcCwhmWNh72acBK57UD3Ri/7+Ufv+olHMqWQtuHM29lBXIgXFXB3/7ttL1NIiUhGuS5Vx6cgXNmlyoML3FhjwsAqSzYLSOHeYuLcmoSjRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220726; c=relaxed/simple;
	bh=uuRxUEWAiTYG1xcsGVUJv5Gj+GudNMkgTE5oMCqx0vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYxHGMCZqsbBByRi5+oTvvaQpbQ0pRXEQELCNyCniNN5+5Z8tHNaolz6IR7DU9Tnd4tVgSsE8H8QJ6yubZQwO5BKcBhd9pwUuOQcBZtBEtP9rQvU9COn5+JtFW6Tq4/2lV1higRdKYSR4z/ciYVCjI5SavSAr1G3Nrg5KeUBv0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbbeEPyJ; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbbeEPyJ"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c4a0870d2so1382369eec.2
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 10:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791220723; cv=none;
        d=google.com; s=arc-20260327;
        b=SROLwM7zep5KGIWItxXq0WeBEPXckxxV7faCMrcJUjmjGKMdRg2Xd5w/5zJfzm0fF6
         wBgpDKG3bqe8bPBwGdtte/BCKsoQwQqmFeAv95edmQ9qOLGMTx9Bnt1koUWl8OYL3rGu
         w16/B1e67VEiF/STx6AQhqCwf7mO99973k+lTsFaqUETVYOEXrq1/a8x1OclBwA+tJEX
         /GwlcdlaE+ntm8Ewf5eEL8kPEtjnwGpPkXjXUgdjiTJLoWBVCY2dYaVEIitQoxg4QqyW
         PDrwuuidy6BQTwlgnPR6T3NwcHPT5405Q1piMk+N873I+VZBmp8U2/2gEFPk+FqkjH2w
         DC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJFeJtfT8/aRZATxwvI0/pPdKdSmPKSztHUwOt17NCQ=;
        fh=KxDGSPaepO++U6WkHt0DExPnx7NzCbv2Ms0hlw/LUHo=;
        b=AgTMxrmhPKZnS8btwzTrb3ItT3otrI4DhkGmBUeXPCnX2b4QTeDgdui3FMrWrQ/mUu
         RbYICKTL60Q0uim0d7vj8cJPII3lFLyCan8g0CsdMMaj+CrgZpqJWZQ3GODZWTvgPrMs
         TIuG+AWwYoz+NYxTb2v36VF+RPbqj+RkclvT714a+2hphIPU0x3YPt1MAkIRhzYI6Zhe
         HPZVuoZoeWUDuBYhrUTjtZNqtT8HkZvqFWMMoQ7ahhft9UZrTyZAbOecEsZ8bIMxcgkC
         JalEfq7gCx8Mx9lHgNg6VZi+RTZWw3tb3fGoKbv9CYOiMKJX7IeLM3bSl9kfG0/WqNN9
         DONg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220723; x=1791825523; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJFeJtfT8/aRZATxwvI0/pPdKdSmPKSztHUwOt17NCQ=;
        b=RbbeEPyJxvDXvAoPD869+sqwQ7sf3StXW5FT1/bAIO1Os0oCQLIIwH1rAj5rLFIdna
         /etx1odXgpJh1DlzAIFh3lBgeXVUm1edgA46JL8pwVTItTK+zFHJZXWPU++8eu5F/JTF
         FDRhGfEilnHKT89SfCLK6/bzbiBG5mxPaLbQTwpfhrxH2qX9GEieGmmZFfYqHy/0EdWz
         0nNgrKywCOuice+iOh3XiHpxCI/JVYeLWjPmZC1Pq4xK6EMXoOJtz2ux6HtXPlpzxobG
         5B9YcclbYrHe53kh4Us29BQrnGOiXJvvsMUOG++DS/F8yYzgridhtlGtgowOWu+HaFc8
         zO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220723; x=1791825523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJFeJtfT8/aRZATxwvI0/pPdKdSmPKSztHUwOt17NCQ=;
        b=cL1X4S1rBjwk2lEJG83IIJhk5mMXzv9X+Lp8YoICfL1V/VADRk37KoEBbbtakg66es
         zOjk0B8UFND4SZ5p9dl/+YMn+fRaark4SBhTDCGGE9qTRavdpk+or2OKHYMUzet7ANGk
         NiZu3itffrGkwwU7xnnU34tep9lOCggRXcJPmasijsk//UKvEBsmeqeOKZyya2YxuzW8
         NJY/Vle/jHNvmqhUmjpQBJuZ33Wfd6ut5+C5WwRYXq4h6AbDv1sG20L1+P7979gZ3w/m
         TCx4AUkB4BYCjsaX2FlLEC5bBb5FJETR9UfFH0ap5lgWcUTfRnwoUi4bbxExY/Mnbr6m
         t3Cg==
X-Forwarded-Encrypted: i=1; AKwUvByQY8zPhpgJ2fATOEUnCcm8YiAZBHv8hrwfAuzUnUZ3QEpmXK+cgswUe/dilY2q0xIFz3E=@lists.linux.dev
X-Gm-Message-State: AFuF++nmecgNyLKN4DC7nYbGf1Xm35GftHp1fG5TV/UjAZ13qGAziJzy
	uXg5ZD9GPTIidz0Q3SWby3qlEyN1uEmv6QoNO+W4MyXEWoF376k+WwF5UaXYRgESXnosR1+hLYY
	my5KxzYgLYd2xfcJIbDb4zSfBR9eiRVY=
X-Gm-Gg: AYBFou3hsqEEEUKlnAIxuwHT9x06/FmEJ07JfouS8tTXv7T9MdmNHUk+FITgzKunjfV
	oEW8gv6Lw/JQA08HIYIA/BsGE05Jx9hMJqJjia1eds/BaKaM+BvsaSVEIn1xenCG0ZLfX8wmZL7
	fZTAC+Zt8f3GZF/JzFYCt0Zy/Ul12KOrlaf+0X2gbIQtnR295/zITWs/QIfD0BKbzjWGGV8atra
	b1rK0II+J6URIyjrBYXXviAjnJtYkV3bf8G+VbzcpxfWiY6n5Wfb+7QvMPjR9Bvy4zn7tC0F+TH
	3tDR+86qF7MUlZVcHFFBG+LAyVMReOuqizH0nDsGqpvwOpZDdrKbytP7c0FNsnVAcKyVSd2XbZe
	P3ygOBHx/R30/
X-Received: by 2002:a05:693c:87d1:20b0:34c:1bc7:bcb with SMTP id
 5a478bee46e88-34f159887a3mr13944123eec.22.1791220722737; Mon, 05 Oct 2026
 10:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004164121.193514-1-clamor95@gmail.com> <20261004164121.193514-3-clamor95@gmail.com>
 <asPVmbvyslGgEsjk@aspen.lan>
In-Reply-To: <asPVmbvyslGgEsjk@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 5 Oct 2026 20:18:31 +0300
X-Gm-Features: AclHuK8sdu976map0XQTAXXmXCzthY8nwPjOHGJ7oTbO_2PaU56B3jQ1t93eAwE
Message-ID: <CAPVz0n29+1yOO0i057RdpUAu+z85hhnm9GGaHkqgf5XW1SPfeQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mfd: aat2870: Convert to use OF bindings
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 5 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:51=
 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:41:20PM +0300, Svyatoslav Ryhel wrote:
> > Conversion of the AAT2870 driver to use OF bindings requires a few comp=
lex
> > changes that should be done simultaneously.
> >
> > The AAT2870 essentially provides two functions via child devices:
> > backlight and regulators. Both functions are fairly self-sufficient and
> > may not be populated on the final board. Consequently, the MFD
> > registration API was replaced with of_platform_populate(), and each
> > sub-device was given its own compatible string.
> >
> > Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
> > was converted to use modern gpiod/OF helpers, allowing the redundant
> > aat2870_enable() and aat2870_disable() helpers to be removed.
> >
> > The aat2870-regulator driver was updated to register each of the four L=
DOs
> > from a dedicated OF node.
> >
> > The aat2870-backlight driver was changed to populate all required
> > properties from a dedicated Device Tree node. Its channel map was updat=
ed
> > to use u8 instead of int. Furthermore, because the maximum current is n=
ow
> > parsed as an absolute value rather than an enum entry, the calculation =
and
> > application of the maximum current were updated accordingly.
> >
> > All of the changes above allow platform data to be removed entirely.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/aat2870-core.c            | 115 ++++++--------------------
> >  drivers/regulator/aat2870-regulator.c |  76 ++++++++++++-----
> >  drivers/video/backlight/aat2870_bl.c  |  55 ++++++------
> >  include/linux/mfd/aat2870.h           |  95 +--------------------
> >  4 files changed, 111 insertions(+), 230 deletions(-)
> >
> > [snip]
> >
> > diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backl=
ight/aat2870_bl.c
> > index 8b790df1e842b..933a8f728f66a 100644
> > --- a/drivers/video/backlight/aat2870_bl.c
> > +++ b/drivers/video/backlight/aat2870_bl.c
> > @@ -15,11 +15,19 @@
> >  #include <linux/backlight.h>
> >  #include <linux/mfd/aat2870.h>
> >
> > +/* Backlight has 8 channels, each bit represents one channel */
> > +#define AAT2870_BL_CH_ALL    0xff
> > +
> > +/* Backlight current magnitude (uA), 450uA current is eq to 0 */
> > +#define AAT2870_CURRENT_MIN  450
> > +#define AAT2870_CURRENT_MAX  27900
> > +#define AAT2870_CURRENT_STEP 900
> > +
> >  struct aat2870_bl_driver_data {
> >       struct platform_device *pdev;
> >       struct backlight_device *bd;
> >
> > -     int channels;
> > +     u8 channels;
> >       int max_current;
> >       int brightness; /* current brightness */
> >  };
> > @@ -30,7 +38,7 @@ static inline int aat2870_brightness(struct aat2870_b=
l_driver_data *aat2870_bl,
> >       struct backlight_device *bd =3D aat2870_bl->bd;
> >       int val;
> >
> > -     val =3D brightness * (aat2870_bl->max_current - 1);
> > +     val =3D brightness * aat2870_bl->max_current;
> >       val /=3D bd->props.max_brightness;
>
> What is the purpose of max_brightness?
>
> Normally it is used to limit brightness but max_current is already doing
> that. Is it just being used to reduce the number of steps in the
> brightness scale (and if so, why is that useful)?
>

This is the original driver behavior; I did not modify it.

The AAT2870 backlight intensity is regulated by the Main Backlight
Current Magnitude register. It has 31 steps from 450uA (0) to 27.9mA
(31), so even setting max_current to 0 will not disable the backlight.
The max current value may be limited for some configurations, which is
why this property exists.

The max_brightness property determines the maximum number of steps the
backlight can have and is mapped to the available current range
provided by the hardware. The backlight is controlled in steps, not in
uA.

>
> >
> >       return val;
> > @@ -42,7 +50,7 @@ static inline int aat2870_bl_enable(struct aat2870_bl=
_driver_data *aat2870_bl)
> >                       =3D dev_get_drvdata(aat2870_bl->pdev->dev.parent)=
;
> >
> >       return aat2870->write(aat2870, AAT2870_BL_CH_EN,
> > -                           (u8)aat2870_bl->channels);
> > +                           aat2870_bl->channels);
> >  }
> >
> >  static inline int aat2870_bl_disable(struct aat2870_bl_driver_data *aa=
t2870_bl)
> > @@ -96,24 +104,12 @@ static const struct backlight_ops aat2870_bl_ops =
=3D {
> >
> >  static int aat2870_bl_probe(struct platform_device *pdev)
> >  {
> > -     struct aat2870_bl_platform_data *pdata =3D dev_get_platdata(&pdev=
->dev);
> >       struct aat2870_bl_driver_data *aat2870_bl;
> >       struct backlight_device *bd;
> >       struct backlight_properties props;
> > +     u32 max_brightness =3D 0;
> >       int ret =3D 0;
> >
> > -     if (!pdata) {
> > -             dev_err(&pdev->dev, "No platform data\n");
> > -             ret =3D -ENXIO;
> > -             goto out;
> > -     }
> > -
> > -     if (pdev->id !=3D AAT2870_ID_BL) {
> > -             dev_err(&pdev->dev, "Invalid device ID, %d\n", pdev->id);
> > -             ret =3D -EINVAL;
> > -             goto out;
> > -     }
> > -
> >       aat2870_bl =3D devm_kzalloc(&pdev->dev,
> >                                 sizeof(struct aat2870_bl_driver_data),
> >                                 GFP_KERNEL);
> > @@ -140,18 +136,18 @@ static int aat2870_bl_probe(struct platform_devic=
e *pdev)
> >
> >       aat2870_bl->bd =3D bd;
> >
> > -     if (pdata->channels > 0)
> > -             aat2870_bl->channels =3D pdata->channels;
> > -     else
> > -             aat2870_bl->channels =3D AAT2870_BL_CH_ALL;
> > +     aat2870_bl->channels =3D AAT2870_BL_CH_ALL;
> > +     device_property_read_u8(&pdev->dev, "skyworks,channels", &aat2870=
_bl->channels);
> >
> > -     if (pdata->max_current > 0)
> > -             aat2870_bl->max_current =3D pdata->max_current;
> > -     else
> > -             aat2870_bl->max_current =3D AAT2870_CURRENT_27_9;
> > +     device_property_read_u32(&pdev->dev, "led-max-microamp", &aat2870=
_bl->max_current);
> > +     aat2870_bl->max_current =3D clamp(aat2870_bl->max_current, AAT287=
0_CURRENT_MIN,
> > +                                     AAT2870_CURRENT_MAX);
> > +     aat2870_bl->max_current /=3D AAT2870_CURRENT_STEP;
> >
> > -     if (pdata->max_brightness > 0)
> > -             bd->props.max_brightness =3D pdata->max_brightness;
> > +     /* If max-brightness property is missing or set to zero, use chip=
's max value */
> > +     device_property_read_u32(&pdev->dev, "max-brightness", &max_brigh=
tness);
> > +     if (max_brightness)
> > +             bd->props.max_brightness =3D max_brightness;
> >       else
> >               bd->props.max_brightness =3D 255;
>
> IIUC max_current can be zero (since AAT2870_CURRENT_MIN <
> AAT2870_CURRENT_STEP). Since that means aat2870_brightness() will
> always return 0 then there might need to be a special case
> max_brightness for this case.
>
>
> > @@ -181,9 +177,16 @@ static void aat2870_bl_remove(struct platform_devi=
ce *pdev)
> >       backlight_update_status(bd);
> >  }
> >
> > +static const struct of_device_id aat2870_bl_match_table[] =3D {
> > +     { .compatible =3D "skyworks,aat2870-backlight" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, aat2870_bl_match_table);
> > +
> >  static struct platform_driver aat2870_bl_driver =3D {
> >       .driver =3D {
> >               .name   =3D "aat2870-backlight",
> > +             .of_match_table =3D aat2870_bl_match_table,
> >       },
> >       .probe          =3D aat2870_bl_probe,
> >       .remove         =3D aat2870_bl_remove,
>
>
> Daniel.
