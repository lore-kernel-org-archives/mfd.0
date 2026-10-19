Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421778;
	b=l2UW12tj0qCScPEprJs7pe3XjxBALuEkjf/Eyk7AmLExo+R8JVGtg78Bd9mem6LPI2jw
	 30WKUaJsZaa0Nw9ul1TjceaC8mq/g2ABf5yFuHV/laaMy9OS+1Qi6EMYZFRHdI/IExXQ8
	 3v3tcXgwbBuiI4fco2DNUtRhpcYpkOVcfIefwDOfxkgi6hqpH84qMEohOKgZPJRFiN2Yu
	 14GDkivPmzAR9zQMNF9Rjb/sfyXcU75HQss1tiPj78OAS8fBxnGRGwi+VRXwQZTQ/s8Tb
	 HwA2yf9c+/GT2zdUh2BTQCcrsp3XXbTQQU5eBxiqZHyPxUquFPrlUdQ/cvyvYf55VAg==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421778;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
	b=MmKRxMTfgOfDshga7Z9cqaWf+SxMs7wkxJhb8ZwmcNxNKdIhbj887zFE7NI6Amh3tbnM
	 WXRaM0g+CILbWi49jxhqUC8Fy5UebPQvVOIrQe8JpgNhHzioscfgxkGK/LPsAjrVRY0DN
	 WNlKyh3iMA9hMoMgrSm/AjyNYb+Hr/Bfqj7oVxOI4UG7A4lVDPfX7oBoJxQVO5o+u9nLx
	 caf6K/9dXBQ3w40HGL+3s3M0Z7nfvVWyxW8RyC6u9w1v6XpcO55E+NhYwOHRFj4bSRMF7
	 AEDLEfJ+8GT45pFnLd/a5/6u8El5eXPhEyTk9q7c+TusqJ9V/Bq09DoSXM0jHsgZYKA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XOiX6Ovf;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB63E6072484
	for <mfd.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XOiX6Ovf
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F533451CE
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421777; cv=pass; b=J6SlXSLFhj8LAM5HLy1OOOV3xq2o0LmqErrdXEVBQHLVAG0FEVlZjhaC5a0npEtyoeG66qkZEp3WG1Qat2sC1IjgDCMpvbnSsTv2HxNsi18O95zerclot4GZvn9gLqldbkmY/iFZ7XBlmVNgKV7h8lw73+6Nfcre2chk8pBdB/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421777; c=relaxed/simple;
	bh=ZiWLgE/hDl7NKdkfHl0vrv9PMmfHDU6zMAXwx2zu5ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QObJHhvO6mcaCY3ZgAyuDtvjosKRYvIOI/hvxDjegGWnl+BOdsqLiDgWdzzreyda4IV+Nj8IJ+0VWrq6OMpmBvzHPl4XMwoAtnSToIVI0xaHD45izqK2BPGO76l31CsqyDBE6Ju0+4Lh21cQ9bbyli+zvLf2iV2kdcbDsF4CfNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOiX6Ovf; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f036b17easo117486eec.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421775; cv=none;
        d=google.com; s=arc-20260327;
        b=X3WTYcI+ZjbSktZc8GFlIMMCZ/1Nwu/0WWDdWPwMbK7t4iQ8D782oa4QoA7lsdj8Nt
         zfkxQV9Apv4C0t8sMvrMMzdwnEg2sqslO/k7bkWM6LgUXza8PXdQK8UEMFGt/9NthMpy
         PiwNk3FQAYeDnnAzaDn1LgymYxOyupoi7YPo7Sthk2cYsGTOqYhgz3q7JbTJN/maWxyb
         CdAg0fSjwuWRrzW639mTvhpES601jYrRR4c4iClcHlC9YRgH6k/vRg/VDdrV10crTZlu
         tPcTTzBl1iFK0zewa0EbfcO2QAo6HlZUagvl7WAIrWr2Ezqp7GVKINihNV4ashNfP4Qn
         aH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
        fh=TkSf8gZOO4kqDunsKBVuFUrTlSlIZUtNNGJPhyDt0IM=;
        b=ZQ8gsFPa6ZEVN7ewPJNYM5gjjsksSXoF3anL7m3MMrd/f2P3PWBW9sw/J6do2YhKfZ
         5kAsg1iDg6bOFNJncLdD2Uvs/u7Ms6SUK/Mae4lgSI1ZBJtn8sznazy8+U/JxwyEsJUN
         Yq5yudTJUU920QcBChZNzXrONOzEtTppa2rV7nmSJl4PeJZSe5VDBQpMIrwcD6SeMfMD
         oiPMaXbV8UefVQBfkcwFhBeOcKgqz8j8HUfGhllFyBjaFbltF88S9FLnbbSpl2xCq/sz
         xnruzCo4GpiJXXT+jzqXl8OnIWU40oZcmvRAvsHzTyL6LETYMIEgCpznY+H/D9/BRKW3
         dJmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421775; x=1793026575; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
        b=XOiX6OvfNGtkIelfYwskduB8Jf/U3J1n0HYLMb3NM4I79Lo5ExlNWVNHGxMmlRUURD
         MUxam2Ih38ibbCOQy/XvinFkVd/q2TCoPeJWylMywZqEZNDPyC39d9H28SUM+m7z9Q2H
         L0QloqnhEHGoIn22G80fpPaBhTndjnBLG+VZmHmDQQFjieY0Fi5PEdvU8QZZDOc71Wm3
         pXxnSH3+Cy/1A3QcyH9I8ds1YveTl12xb5O/xpwhGDuacWrsUdPH4+X6JCyJgPSyUyKE
         BaNowPABmYpwAHmFdmN1lm4n+fCBg/QjhLSjbe28z3XKVb8FJlWVdTnkLZdUs1X0MwQc
         UEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421775; x=1793026575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQLz+XfAveV/B4k+ADa75qLK4k5ajQjrtzEnIHfPNDU=;
        b=BqbcoxsGqJ5e2EtEhMyp6z+z8eFu3XiC9LBKkYHd2SOKt1Kb97h0ovHv1k+FDduG14
         6oGIy8/jUJs29nS9mZ1yimAXExZsGNjfK0bPS+TBg1BLdgpI7ZQ1Rk5nIdXhGCqSvUlJ
         SBXdDEFUE2A1+DtzNN10HV3XIaLA78ZWcA+RB0xmlBM0HomAF5rADS8dedMc9wP4mvaj
         PGgpuEpwZObIqvTTVh6OruFmnQg+PCK98JSaPTpbOCcpmbByZR75jO7YqXCCjoseuD9/
         3F0kh3NCST74mzcyGc3JOh6Pt/tFtsb5EkMDH7+icnAXKzGcieDQ1QtWeGzqOA9JYtEH
         AmLA==
X-Forwarded-Encrypted: i=1; AKwUvBzb7Ss33R2fISvDlgTenNN12EpaAzqELJ5+KH5Lul/arj+FvoZXyRSAu7wlXdkuDpDdC0I=@lists.linux.dev
X-Gm-Message-State: AFq9FYKVjQb1cD/m97GZ4UjHnolrGZOFvpRAq1Z42BLd3JZ6BZVyaxB3
	+SLGWZ6S9zIgSoCfjuVn1JQTpkiE6TMubJ+cV+ZkhsN2ZL8Qo2Pv6g1uSzyQ316zq7Ktpsrmgo7
	14V/QWfxPK9bWYixL9fUmVnmvAy5fkEc=
X-Gm-Gg: AYBFou1mNewF+5qjCRNGBz2xhDtAp+uhnRhpKbFozaivjEgyurchlFDKPZ8cu63WUKf
	iPqWCczVZKspB0RBClxh58//9FNzGNU9YiO5A8nJN2S+cHVhK74zvk5h+aOFGVi/BX7rAFVRrD2
	q8Rs/hSMOrOTDtTEZ+SBLdgh0frDJmUcYYrcTyVZmYtlmZGqAwxzi8Up5UtWuL5qQAYfAefXjP5
	B87iqsE/g5XslyGw6MHrPclw44OSHbUaJmkbOP+JAr/vm6UWVVnXsNzGDOYI9B+AFiCYrqWzLjb
	IOWpm48HFdtd259/jN6SKjt/62stiB7UnVJzYwyxgISPKNYTde3DmuWQ+it44RkKqG61e8EyRnR
	4Y++KKhZimYi08SO4gSdIAv4=
X-Received: by 2002:a05:693c:20d2:10b0:356:7ddb:2e54 with SMTP id
 5a478bee46e88-361a2349f61mr12825749eec.29.1792421775026; Mon, 19 Oct 2026
 07:56:15 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-4-clamor95@gmail.com>
 <179198329794.839288.10569542357230656958@kernel.org>
In-Reply-To: <179198329794.839288.10569542357230656958@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 17:56:02 +0300
X-Gm-Features: AclHuK-So1fk-SufXF9ELHqjLzJsGlTnieaKofgBf88_CnYDM-h4bTkcCd70Qok
Message-ID: <CAPVz0n3cfh3LcYwARJ-5gkvQZj3cPVG8XGwH+YkPaOrW36cJ-A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mfd: aat2870: Convert to use OF bindings
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:5=
1 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 13 Oct 2026, Svyatoslav Ryhel wrote:
>
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
> > from a dedicated OF node using modern regulator framework.
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
> >  drivers/mfd/aat2870-core.c            | 115 +++++--------------
> >  drivers/regulator/aat2870-regulator.c | 159 +++++++++++---------------
> >  drivers/video/backlight/aat2870_bl.c  |  51 +++++----
> >  include/linux/mfd/aat2870.h           |  95 +--------------
> >  4 files changed, 121 insertions(+), 299 deletions(-)
> >
> > diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
> > index 0d56cd6fbc6a5..909c14ee60323 100644
> > --- a/drivers/mfd/aat2870-core.c
> > +++ b/drivers/mfd/aat2870-core.c
> > @@ -16,8 +16,15 @@
> >  #include <linux/gpio/legacy.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/mfd/aat2870.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/regulator/machine.h>
>
> Since we are moving away from legacy GPIO and MFD APIs here, does it
> make sense to replace '<linux/gpio/legacy.h>' and '<linux/mfd/core.h>'
> with '<linux/gpio/consumer.h>'?
>

Sure

> > +struct aat2870_register {
> > +     bool readable;
> > +     bool writeable;
> > +     u8 value;
> > +};
> > +
> >  static struct aat2870_register aat2870_regs[AAT2870_REG_NUM] =3D {
> >       /* readable, writeable, value */
> >       { 0, 1, 0x00 }, /* 0x00 AAT2870_BL_CH_EN */
> > @@ -61,34 +68,6 @@ static struct aat2870_register aat2870_regs[AAT2870_=
REG_NUM] =3D {
> >       { 0, 1, 0x00 }, /* 0x26 AAT2870_LDO_EN */
> >  };
> >
> > -static struct mfd_cell aat2870_devs[] =3D {
> > -     {
> > -             .name =3D "aat2870-backlight",
> > -             .id =3D AAT2870_ID_BL,
> > -             .pdata_size =3D sizeof(struct aat2870_bl_platform_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOA,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOB,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOC,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -     {
> > -             .name =3D "aat2870-regulator",
> > -             .id =3D AAT2870_ID_LDOD,
> > -             .pdata_size =3D sizeof(struct regulator_init_data),
> > -     },
> > -};
> > -
> >  static int __aat2870_read(struct aat2870_data *aat2870, u8 addr, u8 *v=
al)
> >  {
> >       int ret;
> > @@ -196,22 +175,6 @@ static int aat2870_update(struct aat2870_data *aat=
2870, u8 addr, u8 mask,
> >       return ret;
> >  }
> >
> > -static inline void aat2870_enable(struct aat2870_data *aat2870)
> > -{
> > -     if (aat2870->en_pin >=3D 0)
> > -             gpio_set_value(aat2870->en_pin, 1);
> > -
> > -     aat2870->is_enable =3D 1;
> > -}
> > -
> > -static inline void aat2870_disable(struct aat2870_data *aat2870)
> > -{
> > -     if (aat2870->en_pin >=3D 0)
> > -             gpio_set_value(aat2870->en_pin, 0);
> > -
> > -     aat2870->is_enable =3D 0;
> > -}
> > -
> >  #ifdef CONFIG_DEBUG_FS
> >  static ssize_t aat2870_dump_reg(struct aat2870_data *aat2870, char *bu=
f)
> >  {
> > @@ -332,9 +295,7 @@ static inline void aat2870_init_debugfs(struct aat2=
870_data *aat2870)
> >
> >  static int aat2870_i2c_probe(struct i2c_client *client)
> >  {
> > -     struct aat2870_platform_data *pdata =3D dev_get_platdata(&client-=
>dev);
> >       struct aat2870_data *aat2870;
> > -     int i, j;
> >       int ret =3D 0;
> >
> >       aat2870 =3D devm_kzalloc(&client->dev, sizeof(struct aat2870_data=
),
> > @@ -348,60 +309,29 @@ static int aat2870_i2c_probe(struct i2c_client *c=
lient)
> >
> >       aat2870->reg_cache =3D aat2870_regs;
> >
> > -     if (pdata->en_pin < 0)
> > -             aat2870->en_pin =3D -1;
> > -     else
> > -             aat2870->en_pin =3D pdata->en_pin;
> > +     aat2870->en_pin =3D devm_gpiod_get_optional(&client->dev, "enable=
",
> > +                                               GPIOD_OUT_HIGH);
> > +     if (IS_ERR(aat2870->en_pin))
> > +             return dev_err_probe(&client->dev, PTR_ERR(aat2870->en_pi=
n),
> > +                                  "Failed to get EN GPIO\n");
> >
> > -     aat2870->init =3D pdata->init;
> > -     aat2870->uninit =3D pdata->uninit;
> >       aat2870->read =3D aat2870_read;
> >       aat2870->write =3D aat2870_write;
> >       aat2870->update =3D aat2870_update;
> >
> >       mutex_init(&aat2870->io_lock);
> >
> > -     if (aat2870->init)
> > -             aat2870->init(aat2870);
> > -
> > -     if (aat2870->en_pin >=3D 0) {
> > -             ret =3D devm_gpio_request_one(&client->dev, aat2870->en_p=
in,
> > -                                     GPIOF_OUT_INIT_HIGH, "aat2870-en"=
);
> > -             if (ret < 0) {
> > -                     dev_err(&client->dev,
> > -                             "Failed to request GPIO %d\n", aat2870->e=
n_pin);
> > -                     return ret;
> > -             }
> > -     }
> > -
> > -     aat2870_enable(aat2870);
> > -
> > -     for (i =3D 0; i < pdata->num_subdevs; i++) {
> > -             for (j =3D 0; j < ARRAY_SIZE(aat2870_devs); j++) {
> > -                     if ((pdata->subdevs[i].id =3D=3D aat2870_devs[j].=
id) &&
> > -                                     !strcmp(pdata->subdevs[i].name,
> > -                                             aat2870_devs[j].name)) {
> > -                             aat2870_devs[j].platform_data =3D
> > -                                     pdata->subdevs[i].platform_data;
> > -                             break;
> > -                     }
> > -             }
> > -     }
> > +     gpiod_set_value(aat2870->en_pin, 1);
>
> Is this needed when 'devm_gpiod_get_optional()' already requested the pin=
 with
> 'GPIOD_OUT_HIGH'?
>

I will check, most likely it is not. I will adjust in v5.

> >
> > -     ret =3D mfd_add_devices(aat2870->dev, 0, aat2870_devs,
> > -                           ARRAY_SIZE(aat2870_devs), NULL, 0, NULL);
> > -     if (ret !=3D 0) {
> > -             dev_err(aat2870->dev, "Failed to add subdev: %d\n", ret);
> > -             goto out_disable;
> > +     ret =3D devm_of_platform_populate(&client->dev);
> > +     if (ret) {
> > +             gpiod_set_value(aat2870->en_pin, 0);
> > +             return dev_err_probe(&client->dev, ret, "Failed to popula=
te cells\n");
> >       }
> >
> >       aat2870_init_debugfs(aat2870);
> >
> >       return 0;
> > -
> > -out_disable:
> > -     aat2870_disable(aat2870);
> > -     return ret;
> >  }
> >
> >  static int aat2870_i2c_suspend(struct device *dev)
> > @@ -409,7 +339,7 @@ static int aat2870_i2c_suspend(struct device *dev)
> >       struct i2c_client *client =3D to_i2c_client(dev);
> >       struct aat2870_data *aat2870 =3D i2c_get_clientdata(client);
> >
> > -     aat2870_disable(aat2870);
> > +     gpiod_set_value(aat2870->en_pin, 0);
> >
> >       return 0;
> >  }
> > @@ -421,7 +351,7 @@ static int aat2870_i2c_resume(struct device *dev)
> >       struct aat2870_register *reg =3D NULL;
> >       int i;
> >
> > -     aat2870_enable(aat2870);
> > +     gpiod_set_value(aat2870->en_pin, 1);
> >
> >       /* restore registers */
> >       for (i =3D 0; i < AAT2870_REG_NUM; i++) {
> > @@ -436,6 +366,12 @@ static int aat2870_i2c_resume(struct device *dev)
> >  static DEFINE_SIMPLE_DEV_PM_OPS(aat2870_pm_ops, aat2870_i2c_suspend,
> >                               aat2870_i2c_resume);
> >
> > +static const struct of_device_id aat2870_match_table[] =3D {
> > +     { .compatible =3D "skyworks,aat2870" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, aat2870_match_table);
> > +
> >  static const struct i2c_device_id aat2870_i2c_id_table[] =3D {
> >       { "aat2870" },
> >       { }
> > @@ -444,6 +380,7 @@ static const struct i2c_device_id aat2870_i2c_id_ta=
ble[] =3D {
> >  static struct i2c_driver aat2870_i2c_driver =3D {
> >       .driver =3D {
> >               .name                   =3D "aat2870",
> > +             .of_match_table         =3D aat2870_match_table,
> >               .pm                     =3D pm_sleep_ptr(&aat2870_pm_ops)=
,
> >               .suppress_bind_attrs    =3D true,
> >       },
>
> --
> Lee Jones
