Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806702;
	b=vqNjaYWM6Ni2oGZ3G4HfqpiCcfVyrv5dZr14kX0UDXTL9fSobddJF8cAzq4wtsOwdyET
	 jVy1eGc9IW+LIH/ZLlWKhmF1IxwmWLOqLi6inYG/ezZd0OAmhFvt7/aTRkzik9hfXk6I7
	 8+4OaJKDzO2XpTMrmExHEOIwCpk6olVjwNC5/4lGYcl0beCgQDBYga3VIz/fBsTFdtpOG
	 V3hVcvaWWVbzh13uTg9fif+Bm66b2Bt9nFS1a3rLWlUsLMom6/4oSnAzIHHHqmihIoBO7
	 COeXL9JLI6SBYPQvsiGsOJpOQeO+Oy7Y6F3+AsalaYAAKQFawyHeerMq/rHP0bUo+Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
	b=g8n60jL8y9Reust/yFfZ7DO3+Nyi5QddSugoTV2nTWye891tELz4BV/IOEq3t4v/qCqF
	 Xhy0avh0QfLEPkNRAESSDoDhRPzCo/C3tWhFpEOAxR+yB5asCk3EEB6lXbw62kvbI2l6X
	 kRfOVoXnOmdxk+c5JzEjisD/6SuTU42h1VaUN36/5SPPHyN551ZrSzBnWUVeHs8aRgYKi
	 Mz9cicPesYjGILddMmcFJnqG0iTu5JFgadZtewgeEySq/iLEWkrQEmXOwzkrznJUf7VT+
	 EqjUCorAaz85dlf44Wd9RvM35srwG0jykQ51hWFacIZs0vIrjuJ5R2J5QFnPlkiRn1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/ddO8JB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F984606EEB1
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 15:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F984606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/ddO8JB
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dbde64409so163010eec.0
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 07:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793806700; cv=none;
        d=google.com; s=arc-20260327;
        b=jLCmXT7Fcr7ldiXjgIZhUtf3ISPo3h7OmHd19arIqce4pkZc2P/W7szv/kFp1Djmx/
         qAR6Ix2D7KcG3aO7ZDee68bO8G9SOMZ/IGM6UVd2GeFWm76mWNuEWq9Giz3vPqPzw1no
         tIzMZjSgYd3Dp1EbPvYJiDybDo97oaxhuP+CCEbP4KZR2c3EQd/PvalHL7zr8mK40b9W
         WjquMLpgIQcK2A3V1V0qQncLKkjTBwpD8d9whuzp9KwYbvx5EuRzq+25Jc7czlHEXMwR
         dD+oraCe0p7RsDUDB/WuZn/BHXvdWxEn8jIoMoYaAazPD8sSt+HZNSdD70nrUPjsgEfl
         fC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
        fh=RvaXGbEsypzRODyBBxnEV9rKKI8TeKQkZUYHp34teKU=;
        b=EOYzlqGUJ/WsRAXGq6oFJUIvQ9AGzzm/ial5r8AwzDtoG4Yxm5Lm6D2+/2bQDFmQu0
         BDknWJ5tJBUevXbTby/4Hn19YXhje1lZOetChVWUz7pAE5EJchbObJvVfij+WJCmdd0H
         IT3VaTgQhapB1VlNI+S2zdkvmcKryZoR+mglU4WHVHyuhZlkr0tR+G2gOS8dC/XnpjIh
         bc5Q707nCcqpDCqZlEoFnFdER3lajL2QVMkrJwn/cslE5r1cUxNJqGjms9tFJ0ZDaist
         p58qp+M7jaX723sxQehPiDVhMWgOJYRFCjns6kolE2q5vWJx17JpFLWBjWYeIUyINoxh
         PIwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806700; x=1794411500; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
        b=F/ddO8JBWmVKOdeZcJUiWDEKsHjjnLW4UaqFbRVfP/j3f0UtBtG2EAtC1w9H66TDmH
         jDmRjV+CuoiMRVQemAjDO9q189fztF0yjSckvFWxO85koXnAuujSEmc7omuKurNT4zMd
         4ZMUSd6bjxW+rtLMMFcqAt563PlCHQEZVjzG1cPA9IDcIQfSA4SQxD+j4NgPvddt6V3c
         JFcJXXzQmNHwKzEyV8ozbWaGLXhPuF2/QDTFYF4EoNJ0ltwLVBlxYUL/5/B7x+CMuYjb
         pO+e+PRcKdOeuBGXtZs9xJPWmn4WHoM4n7n3o5yRs+vCFxNbKEaL2vqvzRsxQ5ESHikI
         LzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806700; x=1794411500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
        b=XQG2eFlSPEPVvgxQNvnigSKUafEz/jex9Wle9+pEhccMfWYwADMT+IrOQrPUJprbe1
         t4WWIhOFlM672GDxvnAfrEVGdODoQmR8cwxtfNp5DKv0KyjQJ/Tdb0O8pHtkkB0vRft2
         mz1z+FuifqlJFJUDCwn4K/yZm36gYwx3VfJkBupvKthDaMsmBrycKxn4I25FvGwBjXOi
         eTB86pn5LSwyPfpoZTtpR3LSqHl8P86ujFtFwzf4mLRK4vYfe5TLddn+7SOThBExn53r
         koEmbWRWqnsM88FSovhBLRAhAfrY1yRueQjDrmjfH60yGIZM4AmR+Vba+5x6qt0j0zt3
         4WIg==
X-Forwarded-Encrypted: i=1; AKwUvBzp1TgMIwf0EW2H5CmmPy5EG7mLbIk9Mf9Krpwr9oZswZVKpRRII4I1paeiHV9g2OIp7dY=@lists.linux.dev
X-Gm-Message-State: APuU4Z//ofbVvdPF4tmvRnQf3sV/9N8HR092QehSGWcR1hnTlXBnvNsq
	08ELqXqz/sODvNcwJMy4b61rEawJPxmKRT0QgUMfFfg2RI+96pUJITyqtoeoCOYx3XAr7i5bJhU
	boBpSVjwmfjxGfeunNd0B/FlHD8ig/Gs=
X-Gm-Gg: AYBFou3oUmlcaqqiZCOZS4yShxUVwPwoUB8V3bn3uJobbi7ceRTfgkeADID/XMoMrjc
	bTekaahRMpwZ303yxPNatE/iIWGVdS0tm87zSco8vsvOaTTDUX3ca22Q26UqTrJjEfCvkIOHS/P
	p47NjJpBhINLJ4NeUjCU7FxM+qjZohd85dWR0ibDDawv8Lg4nBeByJkf7Kn2rArzWrCVrj8DX4P
	ltNJmSWP8WHDu11kdmsW5HiPA17v6kYkejQm87AvDB7JKpay1nVxaXLCwMtofu9Iuhr96ueP0pL
	vSvHy/p4LVUoUqsszG2RuQm7vVNHWrYvLD2IY9olgUXPRf+vyRbqugrx9aVlfL/HaXSTVTjbhFV
	ZKu/Kbmfe9DYOMy9aXbqJhrDwoLS8sKEKCvBjNgFrGyTPxdX2ATIb5My4bcWTickSjqGK5Ybgfg
	R8a0f1yb69MhoaGdg=
X-Received: by 2002:a05:7301:715:b0:369:f41e:d2dd with SMTP id
 5a478bee46e88-36a4241b18amr24074791eec.31.1793806700155; Wed, 04 Nov 2026
 07:38:20 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027115006.86032-1-clamor95@gmail.com> <179318844110.3606039.5801345229436270811@kernel.org>
In-Reply-To: <179318844110.3606039.5801345229436270811@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Nov 2026 17:38:07 +0200
X-Gm-Features: AclHuK9cSaRNIpy-1KTZ4JvVgFogvZS7HZFHVxjMuvwtP6PF9TF7v6QwxfJ1f4w
Message-ID: <CAPVz0n05rXtBJzPZo4k9=ns52n10rAKpW83gbwpQwZQW3i-u6Q@mail.gmail.com>
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:16=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> --- checkpatch.pl (1 issue) ---
> Line 38: WARNING: please write a help paragraph that fully describes the =
config symbol with at least 4 lines
> ----------------------------------
>
> On Tue, 27 Oct 2026, Svyatoslav Ryhel wrote:
>
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> > Changes in v2:
> > - rebased so patch is now applicable to linux/next
> >
> > Changes in v3:
> > - added check if led is off for get callback
> > - added dedicated MAX8907_REG_WLED_MODE_ON mask
> > - switched to devm_led_classdev_register_ext
> >
> > Changes in v4:
> > - platform_set_drvdata dropped
> > - init_data.devicename dropped
> > - added MODULE_ALIAS
> > ---
> >  drivers/leds/Kconfig        |  7 +++
> >  drivers/leds/Makefile       |  1 +
> >  drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++++++
> >  drivers/mfd/max8907.c       |  1 +
> >  include/linux/mfd/max8907.h |  2 +-
> >  5 files changed, 100 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/leds/leds-max8907.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 788e689fe875c..3796c562919fe 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -813,6 +813,13 @@ config LEDS_MAX77705
> >       help
> >         LED driver for MAX77705 PMIC from Maxim Integrated.
> >
> > +config LEDS_MAX8907
> > +     tristate "LED support for MAX8907 PMIC"
> > +     depends on LEDS_CLASS && MFD_MAX8907
> > +     help
> > +       This option enables support for on-chip LED drivers on
> > +       MAXIM MAX8907 PMIC.
>
> As requested on v3, please expand this help text to at least 4 lines to s=
atisfy
> 'checkpatch.pl'.
>
> > +
> >  config LEDS_MAX8997
> >       tristate "LED support for MAX8997 PMIC"
> >       depends on LEDS_CLASS && MFD_MAX8997
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 3da746279bb81..24efda3fbaa44 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)          +=3D leds-ltc3220=
.o
> >  obj-$(CONFIG_LEDS_MAX5970)           +=3D leds-max5970.o
> >  obj-$(CONFIG_LEDS_MAX77650)          +=3D leds-max77650.o
> >  obj-$(CONFIG_LEDS_MAX77705)          +=3D leds-max77705.o
> > +obj-$(CONFIG_LEDS_MAX8907)           +=3D leds-max8907.o
> >  obj-$(CONFIG_LEDS_MAX8997)           +=3D leds-max8997.o
> >  obj-$(CONFIG_LEDS_MC13783)           +=3D leds-mc13783.o
> >  obj-$(CONFIG_LEDS_MENF21BMC)         +=3D leds-menf21bmc.o
> > diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
> > new file mode 100644
> > index 0000000000000..a5c445f75d1b1
> > --- /dev/null
> > +++ b/drivers/leds/leds-max8907.c
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/err.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/max8907.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +
> > +#define MAX8907_REG_WLED_MODE_ON     BIT(0)
> > +
> > +struct max8907_led_data {
> > +     struct max8907 *max8907;
>
> As asked on v3, what is 'max8907' used for?
>
> > +     struct regmap *regmap;
> > +     struct led_classdev cdev;
> > +};
> > +
> > +static enum led_brightness max8907_led_get_brightness(struct led_class=
dev *cdev)
> > +{
> > +     struct max8907_led_data *ddata =3D container_of(cdev, struct max8=
907_led_data, cdev);
> > +     unsigned int brightness_lvl;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL, &b=
rightness_lvl);
> > +     if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
> > +             return LED_OFF;
> > +
> > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &bright=
ness_lvl);
> > +     if (ret)
> > +             return LED_OFF;
> > +
> > +     return brightness_lvl;
> > +}
> > +
> > +static int max8907_led_set_brightness(struct led_classdev *cdev,
> > +                                   enum led_brightness brightness)
> > +{
> > +     struct max8907_led_data *ddata =3D container_of(cdev, struct max8=
907_led_data, cdev);
> > +     int brightness_lvl, ret;
> > +
> > +     brightness_lvl =3D clamp(brightness, LED_OFF, LED_FULL);
> > +
> > +     if (brightness_lvl) {
> > +             ret =3D regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL=
, brightness_lvl);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CN=
TL,
> > +                               MAX8907_REG_WLED_MODE_ON,
> > +                               brightness_lvl ? MAX8907_REG_WLED_MODE_=
ON : 0);
> > +}
> > +
> > +static int max8907_led_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct max8907 *max8907 =3D dev_get_drvdata(dev->parent);
> > +     struct led_init_data init_data =3D { };
> > +     struct max8907_led_data *ddata;
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     ddata->max8907 =3D max8907;
> > +     ddata->regmap =3D max8907->regmap_gen;
> > +
> > +     init_data.fwnode =3D dev_fwnode(dev->parent);
>
> This will evaluate to 'pmic'.  The sysfs attribute will be incorrect.
>
> Since there is no child node, why not set 'ddata->cdev.name' directly
> and use 'devm_led_classdev_register()'?
>
> > +
> > +     ddata->cdev.brightness =3D LED_OFF;
> > +     ddata->cdev.flags =3D LED_CORE_SUSPENDRESUME;
> > +     ddata->cdev.max_brightness =3D LED_FULL;
> > +
> > +     ddata->cdev.brightness_get =3D max8907_led_get_brightness;
> > +     ddata->cdev.brightness_set_blocking =3D max8907_led_set_brightnes=
s;
> > +
> > +     return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_da=
ta);
> > +}
> > +
> > +static struct platform_driver max8907_led_driver =3D {
> > +     .driver.name =3D "max8907-leds",
>
> Cute.  But please expand.
>
> > +     .probe =3D max8907_led_probe,
> > +};
> > +module_platform_driver(max8907_led_driver);
> > +
> > +MODULE_ALIAS("platform:max8907-leds");
> > +MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
>
> Your name is misspelt here.
>
> > +MODULE_DESCRIPTION("MAX8907 LED driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> > index e282dd82ece69..826d7768fd8d0 100644
> > --- a/drivers/mfd/max8907.c
> > +++ b/drivers/mfd/max8907.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/slab.h>
> >
> >  static const struct mfd_cell max8907_cells[] =3D {
> > +     { .name =3D "max8907-leds", },
>
> Separate patch.
>

All valid, but way adding led requires a separate patch? Just to know.

The max8907.h change can be left with leds change? It changes reg name
used by led cell.

> >       { .name =3D "max8907-regulator", },
> >       { .name =3D "max8907-rtc", },
> >  };
> > diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
> > index e222250f0cc1e..35b2ede54f856 100644
> > --- a/include/linux/mfd/max8907.h
> > +++ b/include/linux/mfd/max8907.h
> > @@ -112,7 +112,7 @@
> >  #define MAX8907_REG_CHG_IRQ2_MASK    0x81
> >  #define MAX8907_REG_CHG_STAT         0x82
> >  #define MAX8907_REG_WLED_MODE_CNTL   0x84
> > -#define MAX8907_REG_ILED_CNTL                0x84
> > +#define MAX8907_REG_WLED_CNTL                0x85
> >  #define MAX8907_REG_II1RR            0x8E
> >  #define MAX8907_REG_II2RR            0x8F
> >  #define MAX8907_REG_LDOCTL20         0x9C
> > --
> > 2.53.0
> >
> >
>
> --
> Lee Jones
