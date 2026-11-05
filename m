Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888938;
	b=EAPBUlWltsSobIEVFCtiwLSwqYMWvAeOdOXLgw+BIH6sC/hh0HcyQoOxelVZf65Z+Zp4
	 7mHQaKe9Y835bo5f8bukyXZ0K+Co/AQWDcotNorqkePuXHH1gk0CEq/fDTaUhCtQ7ARgm
	 yLnmptYeGzJFR6DBQOqGhxT0c28/MdV4xvxPNUPZp8dM4IqTMvw6rVNm035HqZeHGViyz
	 kUTZlP7zFa9lXTpz2usxTTXYOgo4CbCDYi+Za4FXyftJPpxjwj4S+ZwCdviJKs0VyZLes
	 e59XOWZ4VAbjAlF6Hi/Yx7GndGCVVITCadQoex0JVvuE5+DsPIyoI+t8+5cfx4i/WSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
	b=r3GIjj8w1HeqouB/jx09xbkGe4rQpZjJEkPbOpgj5uZdmqF4BpLrMqyifVQKaIH6cArs
	 p3GpbK3qH1wQ5BGgECxonCArMa9+tvA3yTYREUy9BeSNO4Znja/Mmq+dVVLqsKbkFRuWW
	 NLBj9TELznKM10rIrDbNhwLgYXIidH9ZOn+7msITUCfu1u0Rs5DIU82kmrOb6PlOFAaZq
	 AqHC0gb7fcXOpA1gKuwrtrsstwtjBGXlKAWBj16ZkFUuUeXctuFftCKbAGXH6WCvdxUAG
	 JbQoJUjV0lmt7HXOFCQMUxPHNwNXrWbHxgFXVSrw4s6HGuoBjldpXDtNEExVgObvklA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuWMMq+h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8385B606A31B
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 14:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8385B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuWMMq+h
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c49c32650adso137982966b.0
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 06:28:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793888936; cv=none;
        d=google.com; s=arc-20260327;
        b=nUJ/2an6HdyCbC5bU59mWD5EsubA/vEmjToRfhsc9xwgVrJ5FBdR7tVw6W0oYGVTq3
         oSGHbjPGU5uzMWv3qTKG3yKEVu7Qd/534ojVAE1+3yrjxOGz3TLOU7qeqkmPbe6ZRviu
         zGiqa3NLGiqC6fK+FQdAlZh0x+NKAzFslHXGqgAuV3SoY8G4QEPQg/7RnrBYDlr0xAO4
         WW3HCUjjcIEevEGljfQjZeNrfTMuJMnHIhFEYFn9uvJWO4ErCG/TQAmfswxSrLXMxIDy
         HmRgIJapNnjkkAxzKXYcS30F80n6CX37Z5pDx7y8hniuP8Etar/pUv4yDKPlDptZ5CkL
         qDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
        fh=sZsH7ZoJ0hC6AQDYQUlm7e/sXMvp4gYHZ7nk4IQ3Tbg=;
        b=RIa9ZCJmjmbIt4zqf3c28Htnkzm2BaW0tGsFBB2jeGgxOdUi3vUjOfvxLvfeuuzrQH
         nZ5ap4GKC2TVy2gwbfHNjjrZ2BoaGyDxJ7U+nZdfKK8a/iQOQl8LuVJs6Be0PBpGRMXO
         uPPY9t8KxLX38+amRAG1W3nRCKqj+oGxwNGKNA2SZfh5MqErfeWY9CwdniCW06VQhjv2
         rjwPuAbKsx8ixUvYqXvS9VolxtBh7mxYCkYbs2kDnCIbtv3okKbGyJzGkYIir+RGFdOV
         gXL9CZZXUkSNxNxT5JaIX8TQtHldobQ2bmCORSW2yurTC8GfRPI6zrho2Bx8W3wAtnCS
         g4gQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888936; x=1794493736; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
        b=cuWMMq+hm7F7tWcjgdaiNdKFh6jcmOWQy3tsZUGmlTA/R7AKyJ/9CmVrJshHeKGzgl
         AJnVlHNtlEc7eudagHvOHcSn0M+Jf3Iq++0nx1db8frROlPAZf1vLfZx32SPD5Ua3qNe
         +vGp63afGAfd0qoii7l3WEby5sqj8nRc5mzac6E1cvvUpPAoAPfFqZR4TeE87Ejbu1wn
         2FNJuO0J1ebkPl5K95iaBauXK9aAyUMKxQWsKkgjG2GaG2cGBu+nFzn+supT0YtnrCte
         GyuQQ3p6MPmXvZyuEYP/oPQfpgtHrRtM6QRVn9XgT3c8yh1qnxDsVT1ksKhwk1NC5EN+
         7/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888936; x=1794493736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
        b=Ns21C0wUuPhsiIMuFiYbuVOJU6f2goILMwaJkICWL8QTBzza7+Ub+T6ZPIVEeOuAKK
         F7sKkUOgQRLvOphWlv/ylsk9C1fZu0lpMU7K9FOPozmC2QUKZcnJo53JV0izI/CfX/Gl
         I0+Aqir+WFLGjLejhiRUi9PFQS1szLPz4NNtIsMOHBINNhxJJqphixBxF+ssrVe7SGSP
         cxRhl4r6Pf9t1D4OO7JXbTXhLfaDvZTfcktcdNicXRpSB9IWuIXGs1JxkyFrea4YKRjE
         OMlfU6RetwclWzfHRCiAM7tnIE8vw+xEcI9E+PmYyowIZkpYVPitpafvGAGfu/GHAKiW
         ADEA==
X-Forwarded-Encrypted: i=1; AKwUvByw6vAwGG3HsTXxXRyhbyYNSwRhrIUaEcwaKrPciFMZ3Q+Q5olc5dS2HNLGZBncYV4KymQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9STXduThxutymUOOGdCtIyJIVZjLac/mCszstvK6dxHsN17RjM
	9C+ylViHw14+XZYMW6WJi2KabYX2BhudjxHq4OvMJu4yaBbwEMmKrRH22MKDA6xBNmK8dXrNLs3
	2zNuwhPP1pJtFbZvGnRc2boVqj0YXAr8=
X-Gm-Gg: AYBFou2/YlzHfKZiU8JlQBj5Et0zZ2AZrqQGBsu16b53YGoeu5lDg5Z7D4dgd3FQ2wR
	sRv3xvZkOoTjuq+XgpVZJzBZ4KddCgX8vojKIbgcXGJOlEZyzCTfVztY1v47qXNsVSyTBmJ8/Cl
	/wHG/pQZvFJTwkzFbdbjcQ3eiUgxIfSKVta1KYvyvDUU5nZq+utnRN2Cs3mhPf1oUNNBquSLyFa
	UWyWL345IHShz+ZiwOFPQ8T7WKHyheOt5yqxCaEzjNp+VKZnfqNgymAWNJBHTlA7Ca8faVZdxxd
	P+CQCAnHU3ysyhsjxo61HEQoy6MFjsCz5uJMvxnQQSHxNHYTlAinrTVoRi1uX44ciu1ZRhGoC22
	mCng0Q7BvnwP5eWJNwiCKfwGtAMXetnzqXpLh3vJC8Emux2dM52PoBZGm72pVk0eG9tWFMu8G9a
	LMRNPGKfW3SGvbot7nDIYnmLfNVCHD/WybOFYGXmTV6eqcGI4X2FY=
X-Received: by 2002:a17:906:b10f:b0:c4c:f85f:aa2b with SMTP id
 a640c23a62f3a-c4cf85fb079mr528297866b.24.1793888935580; Thu, 05 Nov 2026
 06:28:55 -0800 (PST)
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
 <CAPVz0n3tR8R5xe_F20kChnHHrWG40o7prwY6kCYXM-UtYPFKLQ@mail.gmail.com> <20261105140843.GK1650678@google.com>
In-Reply-To: <20261105140843.GK1650678@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Nov 2026 16:28:42 +0200
X-Gm-Features: AclHuK-5D29V0k3q5Pq6uMwZ9kKLHCkv3_XM79rEU9L5CC_QQ2cj_fenaRjE_co
Message-ID: <CAPVz0n0dqrJa5ih8pcgRpxG3e3rBrBr2AkAoNY=dwq8LJcj77w@mail.gmail.com>
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 5 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:08=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 04 Nov 2026, Svyatoslav Ryhel wrote:
>
> > =D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
7:16 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > --- checkpatch.pl (1 issue) ---
> > > Line 38: WARNING: please write a help paragraph that fully describes =
the config symbol with at least 4 lines
> > > ----------------------------------
> > >
> > > On Tue, 27 Oct 2026, Svyatoslav Ryhel wrote:
> > >
> > > > Add a small driver to control the LED cell provided by the MAX8907 =
PMIC.
> > > > The LED does not require any specific configuration and is folded i=
nto the
> > > > PMIC's node.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > > - rebased so patch is now applicable to linux/next
> > > >
> > > > Changes in v3:
> > > > - added check if led is off for get callback
> > > > - added dedicated MAX8907_REG_WLED_MODE_ON mask
> > > > - switched to devm_led_classdev_register_ext
> > > >
> > > > Changes in v4:
> > > > - platform_set_drvdata dropped
> > > > - init_data.devicename dropped
> > > > - added MODULE_ALIAS
> > > > ---
> > > >  drivers/leds/Kconfig        |  7 +++
> > > >  drivers/leds/Makefile       |  1 +
> > > >  drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++=
++++
> > > >  drivers/mfd/max8907.c       |  1 +
> > > >  include/linux/mfd/max8907.h |  2 +-
> > > >  5 files changed, 100 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/leds/leds-max8907.c
> > > >
> > > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > > index 788e689fe875c..3796c562919fe 100644
> > > > --- a/drivers/leds/Kconfig
> > > > +++ b/drivers/leds/Kconfig
> > > > @@ -813,6 +813,13 @@ config LEDS_MAX77705
> > > >       help
> > > >         LED driver for MAX77705 PMIC from Maxim Integrated.
> > > >
> > > > +config LEDS_MAX8907
> > > > +     tristate "LED support for MAX8907 PMIC"
> > > > +     depends on LEDS_CLASS && MFD_MAX8907
> > > > +     help
> > > > +       This option enables support for on-chip LED drivers on
> > > > +       MAXIM MAX8907 PMIC.
> > >
> > > As requested on v3, please expand this help text to at least 4 lines =
to satisfy
> > > 'checkpatch.pl'.
> > >
> > > > +
> > > >  config LEDS_MAX8997
> > > >       tristate "LED support for MAX8997 PMIC"
> > > >       depends on LEDS_CLASS && MFD_MAX8997
> > > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > > index 3da746279bb81..24efda3fbaa44 100644
> > > > --- a/drivers/leds/Makefile
> > > > +++ b/drivers/leds/Makefile
> > > > @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)          +=3D leds-ltc=
3220.o
> > > >  obj-$(CONFIG_LEDS_MAX5970)           +=3D leds-max5970.o
> > > >  obj-$(CONFIG_LEDS_MAX77650)          +=3D leds-max77650.o
> > > >  obj-$(CONFIG_LEDS_MAX77705)          +=3D leds-max77705.o
> > > > +obj-$(CONFIG_LEDS_MAX8907)           +=3D leds-max8907.o
> > > >  obj-$(CONFIG_LEDS_MAX8997)           +=3D leds-max8997.o
> > > >  obj-$(CONFIG_LEDS_MC13783)           +=3D leds-mc13783.o
> > > >  obj-$(CONFIG_LEDS_MENF21BMC)         +=3D leds-menf21bmc.o
> > > > diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max890=
7.c
> > > > new file mode 100644
> > > > index 0000000000000..a5c445f75d1b1
> > > > --- /dev/null
> > > > +++ b/drivers/leds/leds-max8907.c
> > > > @@ -0,0 +1,90 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +#include <linux/err.h>
> > > > +#include <linux/leds.h>
> > > > +#include <linux/mfd/max8907.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/property.h>
> > > > +#include <linux/regmap.h>
> > > > +
> > > > +#define MAX8907_REG_WLED_MODE_ON     BIT(0)
> > > > +
> > > > +struct max8907_led_data {
> > > > +     struct max8907 *max8907;
> > >
> > > As asked on v3, what is 'max8907' used for?
> > >
> > > > +     struct regmap *regmap;
> > > > +     struct led_classdev cdev;
> > > > +};
> > > > +
> > > > +static enum led_brightness max8907_led_get_brightness(struct led_c=
lassdev *cdev)
> > > > +{
> > > > +     struct max8907_led_data *ddata =3D container_of(cdev, struct =
max8907_led_data, cdev);
> > > > +     unsigned int brightness_lvl;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL=
, &brightness_lvl);
> > > > +     if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
> > > > +             return LED_OFF;
> > > > +
> > > > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &br=
ightness_lvl);
> > > > +     if (ret)
> > > > +             return LED_OFF;
> > > > +
> > > > +     return brightness_lvl;
> > > > +}
> > > > +
> > > > +static int max8907_led_set_brightness(struct led_classdev *cdev,
> > > > +                                   enum led_brightness brightness)
> > > > +{
> > > > +     struct max8907_led_data *ddata =3D container_of(cdev, struct =
max8907_led_data, cdev);
> > > > +     int brightness_lvl, ret;
> > > > +
> > > > +     brightness_lvl =3D clamp(brightness, LED_OFF, LED_FULL);
> > > > +
> > > > +     if (brightness_lvl) {
> > > > +             ret =3D regmap_write(ddata->regmap, MAX8907_REG_WLED_=
CNTL, brightness_lvl);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MOD=
E_CNTL,
> > > > +                               MAX8907_REG_WLED_MODE_ON,
> > > > +                               brightness_lvl ? MAX8907_REG_WLED_M=
ODE_ON : 0);
> > > > +}
> > > > +
> > > > +static int max8907_led_probe(struct platform_device *pdev)
> > > > +{
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     struct max8907 *max8907 =3D dev_get_drvdata(dev->parent);
> > > > +     struct led_init_data init_data =3D { };
> > > > +     struct max8907_led_data *ddata;
> > > > +
> > > > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > > > +     if (!ddata)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ddata->max8907 =3D max8907;
> > > > +     ddata->regmap =3D max8907->regmap_gen;
> > > > +
> > > > +     init_data.fwnode =3D dev_fwnode(dev->parent);
> > >
> > > This will evaluate to 'pmic'.  The sysfs attribute will be incorrect.
> > >
> > > Since there is no child node, why not set 'ddata->cdev.name' directly
> > > and use 'devm_led_classdev_register()'?
> > >
> >
> > This is required to be able to reference led in the device tree. Since
> > led node is folded into pmic's node, pmic's node is used to bind led.
>
> Right, so you need device_set_node() called in led_classdev_register_ext(=
)
> so fwnode_led_get() can look up the LED via the parent PMIC phandle.
>
> However, passing only 'init_data.fwnode =3D dev_fwnode(dev->parent)' into
> led_compose_name() when the parent PMIC node has no 'label', 'function'
> or 'color' properties causes it to fall through to:
>
>     } else if (is_of_node(fwnode)) {
>         n =3D snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
>                  to_of_node(fwnode)->name);
>
> Which registers the LED in sysfs as '/sys/class/leds/pmic' (and fails
> with -EINVAL if 'fwnode' is NULL on non-DT platforms).
>
> To bind the parent fwnode while avoiding the node-name fallback, please
> also populate 'devicename' and 'default_label' (similar to
> drivers/leds/leds-tps6105x.c):
>
>     init_data.fwnode =3D dev_fwnode(dev->parent);
>     init_data.devicename =3D "max8907";
>     init_data.default_label =3D ":wled"; /* or "white:backlight" */
>

Thank you for your suggestion. I was tinkering a bit and got to
conclusion that adding dedicated LED node will be beneficial.

My idea is to add led node without compatible (since it is redundant,
pmic has only a single led anyway).

Driver will check for this node and return -ENODEV if node is not present.

Then I will use devm_led_classdev_register_ext but will pass led node
and then most of your concerns should be addressed. What do you think
about this?

As a prerequisite, this change would require
https://lore.kernel.org/lkml/20261027114634.79706-1-clamor95@gmail.com/

I have answered your concerns regarding Sashiko finding.

> --
> Lee Jones
