Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3173B27E7
	for <mfd@lists.linux.dev>; Tue,  6 Oct 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281221; cv=pass; b=jWb/oMIKitXVRlvb9Khx9+/UreOrlv2oM198sJlc8GaDeYxqOrrjdS9JL96qks9mxgGUzDCJi2B60J/xdL8rBDgZSJu9l7bUAwwDQIXs89QPg1riD/eicVw0ysBKnHUbsoOUwdBQzYmLNwcEdD0Vabojvh4n+EBGXwnB0yn3+Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281221; c=relaxed/simple;
	bh=jXoCJSmZrRsEtjPvzR6W3LtMbjIzm96pCRvUzmkQjw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxti4sO4AClEtvqkvBghX20dM2NTJHZO3UJvITMTxySvDRzTa0T8JMTpZVLANBwEmT/kg5QQMtbnBesGyWdrozcC6F2+tSAKbrKKhaIdofvl7tZ9PlFCXMlXzVbsK0VUVOWKC6VWy13stnrOsJxixIP6qmNwsE9FzDIKq8jIt+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/iZONME; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/iZONME"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35127e848feso672492eec.0
        for <mfd@lists.linux.dev>; Tue, 06 Oct 2026 03:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791281219; cv=none;
        d=google.com; s=arc-20260327;
        b=lotI21PVKXJ29Uc0GzimmUUW7ixaPNJLc+QdWrIZUPxLBH+nym8UQIt+o/MGeGtke6
         y0n9be/+mtJoDBG+2DoO3pPgUN0dY9LaTgioFsPGd2IyQER3+pXOV2aLI1fpSukjOVuS
         37rAi8JlUB1okn3bpkzqgqXUqwlnYQbg8eaGbqORy6IT2krVsZlrx4cOP+E/yP7d2AZ9
         aXhfdHpZY0SZplXR2V0D5XC5R+5ZQHn2niw6h2JVWlySQmytLtzslzJtwIkdNPW8BUGE
         PwmfcdRWyeSyVcZxit2/ok3n5rnZ2kfRpjJPXk+SpiwGcc/SoBvP4aBR0kJ8eoRL5DXa
         d/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6NBVbMbxanh8syK4XzpA91skjBSLQAwKVvNkTlGCE98=;
        fh=FfTY8ZZKy2dd9vWY6L8KNlOYEUPvE+FeMbGDM/2f5QE=;
        b=PyOl8EM8GxOK+vplEU5pblcR+qBvXgN2df/hUNYS45q9tZX0Z+oeebMksVymqs62f6
         EpTvfG+djDijE2c87/jN2UCBDtATlr83OLoJqMDtal6ZNHnSY/APCyIhOkOT0KdhjQ7K
         uO4lc6TRdJaXZJY3ZLPohreJNFxP1fQHV07iw86QUAfBL22m57tJaDp6AMqmqgXNsPBg
         P7ms0++VKbWcAJfK8Vw4th6jwnR6ZvPz5W2dqirvbG0GAJruqGc8BWbdb5M2VQZC7ab/
         p7jOKupFx5C3y3in50xzgTkbFUz80iJnfRyZrHadEE4o3e8bqHy2CWYpB5MhSPquuE8u
         93gw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281219; x=1791886019; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6NBVbMbxanh8syK4XzpA91skjBSLQAwKVvNkTlGCE98=;
        b=o/iZONMErzI/m+RmIFSZ0fh548unV3Qc2IysaE9yBQZRi19SIdC1Y03WJtAisOGf9H
         actjIG/ZLlnWE2nH2HedhVB0ExP21b2invlqDHLOyLwCPBcX2uWkzBaSyhcPfNMQr00Q
         VuAWpd3M+xhXbstaMmcQxiFxCEhv1sr3OBECQhj7eYMRvy8PdQeuFIgJ8rF6MgWylsTV
         2vP8HeyPI4cd7uWqIL/fdyGsw4TrBOW6h3v8NPDwFSnY5Pj9L4NbNVAIMIgd5quDtfxk
         AcQCIlfOjaYANfMtPeLjlZEkx0r6zpwKx79Qb7jg/LurZ6mloCvi8GOXk6uXDirSWip+
         hSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281219; x=1791886019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NBVbMbxanh8syK4XzpA91skjBSLQAwKVvNkTlGCE98=;
        b=Vbf2N/nTKjh1HJzzqt3sUC0bUiFjk7KYpe8osoOXS+M+PX4BhtvukYB84fziD1QkGN
         YY+lIikTTgkrP75sLDpIRLLAZ/9kfZBCQu+BJJBzZSXdje5pw/7M7qEN0F/T9KCfJ97i
         TqK9Lz7vdailJI5yDYplxzsaaB6+DpdP1rWHUaP0J8UdN4jxG9lfIKPYuNkgpNRHFfqS
         dvl3iKYLgWDGMOurAHQxJ7e+Ya0rh3ZdRj4rAYpyeLEAQLAIrHsES4kouyG4jzARn7t5
         9UOQIhbv1CCUy53/UQs0wCL9NY9cz1P6fyLpz0QZJr8WtGalaLluq6/ApAnRRobMB4mo
         sAaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkHahC5dA5YC8XLzDR2217CttqgL6odrvGVKW5/Jh2lvAghI4oxMXG9zYVbU01zfIOOHg=@lists.linux.dev
X-Gm-Message-State: AFq9FYL3TlrRdEmXdMYTEIO6ar711C69iyDLKFesgFkuKZsZQJDYFijM
	jPR6ni+l1dABdNdZ918RSSh0OLTueJltJFE99lDskfTjN5oeYlJPSBk6RsYs+M6wg/EpFt3FgxP
	OWBePu8a5fjEIhJDLa9FGqliFiRwxlwY=
X-Gm-Gg: AYBFou1yWm1WXVjtfzzAVJznwFdRMlgvozRA6Ge3EX7MbSOy0WZXatcK7nz4yssqC4W
	+YGHmLNY/9/oe4SHwC0deuJUKD8oQ32XNODwhmqzSexIdjlUT88/nyNDv9MHc7zk6ECdQG2GnBJ
	smqHLy8txRehUnzz1x52459yL8vIIIkz2kNfzWPFU0pbk4ycp+tZF7S6L4Z00APABAPxcL1LjOR
	zX3ucz33ncjF2owRW9kad5ybTlFRtN1GQxgBpY9h2GHlllBXFnh2LBydSFbWit76vCFVIVLSkZZ
	ZRE5MmyREOoBAIudkhbrLUKO+S2oA5VwsxtkNCe9zytQ6hA+8/+tk6I5TI/dRPS+T+sIvf8EFwv
	AiHJ0iFazmPAFa4cJCvjYG8k=
X-Received: by 2002:a05:7300:fe83:b0:34d:2c1a:9881 with SMTP id
 5a478bee46e88-3514e2e4731mr1077709eec.36.1791281218726; Tue, 06 Oct 2026
 03:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004164121.193514-1-clamor95@gmail.com> <20261004164121.193514-3-clamor95@gmail.com>
 <asPVmbvyslGgEsjk@aspen.lan> <CAPVz0n29+1yOO0i057RdpUAu+z85hhnm9GGaHkqgf5XW1SPfeQ@mail.gmail.com>
 <asTBp2RPPvsD4AsU@aspen.lan>
In-Reply-To: <asTBp2RPPvsD4AsU@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 6 Oct 2026 13:06:47 +0300
X-Gm-Features: AclHuK9B4BcbljbuUp4qHu8_KC4fu9LyfN3Q8g8blEUDDcIte_SIuNY9L1q_5iI
Message-ID: <CAPVz0n1PMxOoHMJ3viKa-e3=tjZ6AtzffjnHE9kCFrz1tjezOw@mail.gmail.com>
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

=D0=B2=D1=82, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:38=
 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 05, 2026 at 08:18:31PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 5 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
9:51 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Oct 04, 2026 at 07:41:20PM +0300, Svyatoslav Ryhel wrote:
> > > > Conversion of the AAT2870 driver to use OF bindings requires a few =
complex
> > > > changes that should be done simultaneously.
> > > >
> > > > The AAT2870 essentially provides two functions via child devices:
> > > > backlight and regulators. Both functions are fairly self-sufficient=
 and
> > > > may not be populated on the final board. Consequently, the MFD
> > > > registration API was replaced with of_platform_populate(), and each
> > > > sub-device was given its own compatible string.
> > > >
> > > > Additionally, aat2870-core utilizes an enable GPIO. Obtaining this =
GPIO
> > > > was converted to use modern gpiod/OF helpers, allowing the redundan=
t
> > > > aat2870_enable() and aat2870_disable() helpers to be removed.
> > > >
> > > > The aat2870-regulator driver was updated to register each of the fo=
ur LDOs
> > > > from a dedicated OF node.
> > > >
> > > > The aat2870-backlight driver was changed to populate all required
> > > > properties from a dedicated Device Tree node. Its channel map was u=
pdated
> > > > to use u8 instead of int. Furthermore, because the maximum current =
is now
> > > > parsed as an absolute value rather than an enum entry, the calculat=
ion and
> > > > application of the maximum current were updated accordingly.
> > > >
> > > > All of the changes above allow platform data to be removed entirely=
.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/mfd/aat2870-core.c            | 115 ++++++----------------=
----
> > > >  drivers/regulator/aat2870-regulator.c |  76 ++++++++++++-----
> > > >  drivers/video/backlight/aat2870_bl.c  |  55 ++++++------
> > > >  include/linux/mfd/aat2870.h           |  95 +--------------------
> > > >  4 files changed, 111 insertions(+), 230 deletions(-)
> > > >
> > > > [snip]
> > > >
> > > > diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/b=
acklight/aat2870_bl.c
> > > > index 8b790df1e842b..933a8f728f66a 100644
> > > > --- a/drivers/video/backlight/aat2870_bl.c
> > > > +++ b/drivers/video/backlight/aat2870_bl.c
> > > > @@ -15,11 +15,19 @@
> > > >  #include <linux/backlight.h>
> > > >  #include <linux/mfd/aat2870.h>
> > > >
> > > > +/* Backlight has 8 channels, each bit represents one channel */
> > > > +#define AAT2870_BL_CH_ALL    0xff
> > > > +
> > > > +/* Backlight current magnitude (uA), 450uA current is eq to 0 */
> > > > +#define AAT2870_CURRENT_MIN  450
> > > > +#define AAT2870_CURRENT_MAX  27900
> > > > +#define AAT2870_CURRENT_STEP 900
> > > > +
> > > >  struct aat2870_bl_driver_data {
> > > >       struct platform_device *pdev;
> > > >       struct backlight_device *bd;
> > > >
> > > > -     int channels;
> > > > +     u8 channels;
> > > >       int max_current;
> > > >       int brightness; /* current brightness */
> > > >  };
> > > > @@ -30,7 +38,7 @@ static inline int aat2870_brightness(struct aat28=
70_bl_driver_data *aat2870_bl,
> > > >       struct backlight_device *bd =3D aat2870_bl->bd;
> > > >       int val;
> > > >
> > > > -     val =3D brightness * (aat2870_bl->max_current - 1);
> > > > +     val =3D brightness * aat2870_bl->max_current;
> > > >       val /=3D bd->props.max_brightness;
> > >
> > > What is the purpose of max_brightness?
> > >
> > > Normally it is used to limit brightness but max_current is already do=
ing
> > > that. Is it just being used to reduce the number of steps in the
> > > brightness scale (and if so, why is that useful)?
> > >
> >
> > This is the original driver behavior; I did not modify it.
>
> I can see that but the parameters for these (rather dubious) previous
> behaviours are now being copied into the devicetree bindings where they
> become stable ABI.
>
>
> > The AAT2870 backlight intensity is regulated by the Main Backlight
> > Current Magnitude register. It has 31 steps from 450uA (0) to 27.9mA
> > (31), so even setting max_current to 0 will not disable the backlight.
> > The max current value may be limited for some configurations, which is
> > why this property exists.
> >
> > The max_brightness property determines the maximum number of steps the
> > backlight can have and is mapped to the available current range
> > provided by the hardware. The backlight is controlled in steps, not in
> > uA.
>
> This behaviour does not match the devicetree bindings documentation for
> max-brightness:
>
>   Normally the maximum brightness is determined by the hardware and this
>   property is not required. This property is used to put a software limit
>   on the brightness apart from what the driver says, as it could happen
>   that a LED can be made so bright that it gets damaged or causes damage
>   due to restrictions in a specific system, such as mounting conditions.
>
> Hence the question, why is the current behaviour useful?
>
> If I understand your summary correctly the hardware has 32 steps
> including 0) and the effect of max_current is to ban all brightness
> values greater than max_current / AAT2870_CURRENT_STEP.
>
> If that is the case then max_brightness if fundamentally broken because
> it's default value offers more steps than exists in the hardware.
> bd->props.max_brightness should be set to max_current /
> AAT2870_CURRENT_STEP and the whole of aat2870_brightness() should be
> removed (use backlight_get_brightness() instead).
>
> IMHO the patchset will be cleaner if the weird max_brightness logic is
> removed in a separate before doing the DT changes.
>

Noted, I will see what I can do. Thank you.

>
> Daniel.
