Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717275;
	b=RREUamyN9qHCp/z/wD0ZqqB9BtY0yEP47e8CD7GXtezpmA74i7DBldc9XZGV/2KZhrzr
	 OlI3r9hdgacc4qzqGCwEqwq6hQ75OamQ/u/ivUxyJ8Iyfwmz8N8QKVmNc0LgXcd1vwkwi
	 eHdn3lrUTIw2N8Ri47cp4z7ukDrKJf28aA0Q1y59Tkv2TJqJ6Zlcv4t/2Lmv9vI/CrFmE
	 U/PBgbAmLW1lj1gVUQuGtkKpRz2YnduiGROxWX7r+m3IE8k+JXKLIuelyhqJsgiZmpxjl
	 KoYVA1axIl6E/maNJFCjowEyn/y4st28Cy/jblW3T1j0bPF/HbYLNnnM9oEnNeioDAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EmwaoLyEu5PNjBx2vvNAolYKonR5/swVcE8YNHDBpts=;
	b=pSuN9Tp+sNV3w3rWL+6yHq1iaAYC4TDpDaWDuE2SP0UL5d612IIrm+C8FnqHGUzBQQ6K
	 h3ElcDV8AwkaM+HkVJL70iJ7dDUClPE/QRxnv2FNEt1vPwGf3nku+Sjs2rfVVW5x9rC/w
	 RtEKyrBl3fcpWLXRLkshQC8cYUSRko+UVAMXAEYz2qOR5Hp7Cad1K6CbmcUniByg7JnBA
	 s0h0knw7Pcnll6AVSpelIM++krxcnjaxG00fnuCo+P/xDPKNazAtF6HBw1EJ2d90f3J9L
	 vIxfuyj5Q9WSmeOxYs/AIZE/8SroEoNPkUrxIMwR3V6s6j5uDgrIUK3edlymtsG394w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LaM3TLEC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D068A6083618
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 14:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D068A6083618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LaM3TLEC
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so4353165c88.1
        for <mfd@lists.linux.dev>; Tue, 03 Nov 2026 06:47:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717274; cv=none;
        d=google.com; s=arc-20260327;
        b=pcZvG7VTSzY7TC3K6zqBHG/goLFD1Z+4HVU/zsXVuN0VaUj9ZnKjXiTckTDoAnrn6P
         vzG8BxYHCdKvwpA6GsM2ElO0ZN7xaGrZw59C6ml9NG1PhF3qsDBALdOJ0OQxlkLx5zgj
         6OEt/c8vDULiSUk+mi0uebP1nxyGFHVtSfXuDQ0Z8qPAYY8R0/KlbgjNLD8mxrHbsVAb
         i+m0NmZjUaSWoMyuZhrVN8bBthgdg9QOABSH7tlnbgaaM0xKr6r7jRqGHw0tYoCyStS2
         Rwgvo1IkqUYWoca+y6zA6igF9I3O7VQokZQ4NpZcs2PtI7C9uzJpPKTZtefzfkGXpiwn
         Hrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmwaoLyEu5PNjBx2vvNAolYKonR5/swVcE8YNHDBpts=;
        fh=1JJZgJlCDjHPy266CfHXwFQ9VEpo1SV6LGQrT9lPy6Q=;
        b=UfpdNI/47/Vfuhsn5J/mD7eBjQYFurqW4qMSZ25I2/mUM1szjMpCyd+lIITeUoJ4Dp
         VZmoxhA1vlu9aAF7xZmVc3GJ18jrNRTsw/uZ+VuD2efMQqOSJq/9q+gDDLaQrxLJeACF
         CCIwcf59ZL/2bEPH4PAKJGcZZupHWGHR6aND9pu4eKc39BpvQ1H2EwbPlvqmc5eB8bdy
         Ste1sffNpkeymKak2SyryTw4Z4zKPs4AsodnVxoXUIshGprQmdIZdnkJR1ThwxbaR36O
         amhdSzOoYBBNZiEXAru65/IOWxnJMb4yY3Ker9C8x0XE7C8m8GcHofEMG5UtTYeAtFX8
         jkeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717274; x=1794322074; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EmwaoLyEu5PNjBx2vvNAolYKonR5/swVcE8YNHDBpts=;
        b=LaM3TLECPTEm6Z+llgVXBbeBrJ16IjhtRlo26xaKKTtTPZCs1sRxETHXVhwi5jzTvH
         s2yX3zpMcb++uhmNraZo9DGRd5B35eb/dZzEbxUG4sYPmwwUPRVvNW0fpv9rmjX3pIiF
         /AUpbvHD10G3L/BLFZDloJMI4t89jO0oz24/JQYUIlm6Hxstd/WGJ9HQN8BIkBodBSDw
         ulmESGC8+Y7ic2rVNBw6vo092m3apdlaDxxBUcOofL8EdAKBdTyvGP9bQ5K7Mj3Fiug+
         K/+Y7A8jskE8kDZrwqf28ppC/g2510hWFb0Ubn7CSs/jeYeYefUOfMfFG8k0FF8sfJzf
         ZLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717274; x=1794322074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmwaoLyEu5PNjBx2vvNAolYKonR5/swVcE8YNHDBpts=;
        b=B1Yy9/ABhHLczLq0SXFa+PlJPyRuDUVC/PPZI/+V+15un0jNM/oNInvWo7yoCHtRkp
         UbS678uSlh2BRjRNQbEg8OCrAeIYDnKxsMIJ2B8ZVRVS0rz/vTRa3pdqa3rFXj4sZ+dV
         R2x4MGGbsnIc262HTDdocvqWnsIN3dGVrLSlV7IIMzK3/q9AZ6MjLsBXcceUcrm7eKc7
         0iM9YaKdk8lWwNnv/JW/5gyBpCnhxyukDCTJvkMeDo40FiW2tUczai0dIkS9wa+8bAwR
         sNTR8nCBK8gq4Imc3h/pryggyoiN39LQI/BQN1TaJhFCmwjgUp3GIq6RKGMO1JXR8LN+
         i7HQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk4lqh4zQmks2fiU4O5PDLW/CY8SAGjfLRqrzZ5ynLBBcL9/npcXWBBHRIu9QyNIWf2g4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/lBVPUUk39yKAGM/a+G7en4NTRVXZk9CwJhBI6gNkkpY9jNlkk
	w/hPqBWP+GC5P+7h0N3JIWrKUIVDgDFEQPzjBIsnhX++HjDq7hcHant8lXCx2OrhZC4au5WRpu/
	zZ4+G14HqU/Ud/pWXJ01DS9ZfMIHmAFKID7ES
X-Gm-Gg: AYBFou0MC/awTcgL7rpHIV06iR4xwbJtT/9E4hIyPAM9D2CwNe5qNfE6g7qbBGy6gsC
	Kty5KYLDqGb33l9/6hmRKQHbQNA3QIaRfLe+8TsQrEm2UF/t0QJUlhVzyfIvi7J0hc8aNWzaWay
	r6iTNuzPXnFG8wR58WyNN05Dng5zK0b36ar6QkHRoCkSrly13Mg7FSW0nvQVACsOcUrAPr0Mhs4
	DLpnakwz/NeCjHEXV9+xfzx69Cel2tyGTLlfBSSjNXDlS5DUOvbvJ6FH0d7XWbxZUrKQgElKnP2
	moPOpPwP05qTYtfMulSoV5qcF8jFYbSeS/regoZxetpwUuJgP70oN4gJHS53uZTgXx2jm2vdKm3
	skj8VEkXvvpBncxQSm887YIkdg3DquvMtrwI1E/lMGsQSwHzoSNudk5IfjqEX8vxlw6hObg==
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id
 a92af1059eb24-1ac5e6f5132mr25490470c88.24.1793717273733; Tue, 03 Nov 2026
 06:47:53 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-6-clamor95@gmail.com>
 <179249575817.1833288.1089755405582445022@kernel.org>
In-Reply-To: <179249575817.1833288.1089755405582445022@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Nov 2026 16:47:40 +0200
X-Gm-Features: AclHuK9ZpOIriaiTNLrTV18kT4HaNtHT339MXb6YEPw-7495gnOAW9awk73Le-M
Message-ID: <CAPVz0n0=6Z7E9iSc84xL6Jt=Xi=a=qmSwVsT5g-LMZ+mENFkzg@mail.gmail.com>
Subject: Re: [PATCH v12 5/7] leds: Add driver for ASUS Transformer LEDs
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:03=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > ASUS Transformer tablets have a green and an amber LED on both the Pad
> > and the Dock. If both LEDs are enabled simultaneously, the emitted ligh=
t
> > will be yellow.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/leds/Kconfig                    |  11 +++
> >  drivers/leds/Makefile                   |   1 +
> >  drivers/leds/leds-asus-transformer-ec.c | 125 ++++++++++++++++++++++++
> >  3 files changed, 137 insertions(+)
> >  create mode 100644 drivers/leds/leds-asus-transformer-ec.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 7ec2c8d785426..788e689fe875c 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -120,6 +120,17 @@ config LEDS_OSRAM_AMS_AS3668
> >         To compile this driver as a module, choose M here: the module
> >         will be called leds-as3668.
> >
> > +config LEDS_ASUS_TRANSFORMER_EC
> > +     tristate "LED Support for Asus Transformer charging LED"
> > +     depends on LEDS_CLASS
> > +     depends on MFD_ASUS_TRANSFORMER_EC
> > +     help
> > +       This option enables support for charging indicator on
> > +       Asus Transformer's Pad and its Dock.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called leds-asus-transformer-ec.
> > +
> >  config LEDS_AW200XX
> >       tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 4d4b089156e24..3da746279bb81 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_ADP5520)          +=3D leds-adp5520=
.o
> >  obj-$(CONFIG_LEDS_AN30259A)          +=3D leds-an30259a.o
> >  obj-$(CONFIG_LEDS_APU)                       +=3D leds-apu.o
> >  obj-$(CONFIG_LEDS_ARIEL)             +=3D leds-ariel.o
> > +obj-$(CONFIG_LEDS_ASUS_TRANSFORMER_EC)       +=3D leds-asus-transforme=
r-ec.o
> >  obj-$(CONFIG_LEDS_OSRAM_AMS_AS3668)  +=3D leds-as3668.o
> >  obj-$(CONFIG_LEDS_AW200XX)           +=3D leds-aw200xx.o
> >  obj-$(CONFIG_LEDS_AW2013)            +=3D leds-aw2013.o
> > diff --git a/drivers/leds/leds-asus-transformer-ec.c b/drivers/leds/led=
s-asus-transformer-ec.c
> > new file mode 100644
> > index 0000000000000..1b129247ea6c6
> > --- /dev/null
> > +++ b/drivers/leds/leds-asus-transformer-ec.c
> > @@ -0,0 +1,125 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/err.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/asus-transformer-ec.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +enum {
> > +     ASUSEC_LED_AMBER,
> > +     ASUSEC_LED_GREEN,
> > +     ASUSEC_LED_MAX
> > +};
> > +
> > +struct asus_ec_led_config {
> > +     const char *name;
> > +     unsigned int color;
> > +     u64 ctrl_bit;
> > +};
> > +
> > +struct asus_ec_led {
> > +     struct asus_ec_leds_data *ddata;
>
>
> Why do we need 'struct ' at all?
>
> If we put 'const struct asusec_core *ec;' directly into 'struct
> asus_ec_led', we can drop the outer wrapper struct and the back-pointer
> completely.
>

You propose to allocate asus_ec_led for each led in a loop? I have not
seen this done by other leds. The asus_ec_leds_data is driver ddata,
asus_ec_led is each led individual structure.

> > +     struct led_classdev cdev;
> > +     u64 ctrl_bit;
> > +};
> > +
> > +struct asus_ec_leds_data {
> > +     const struct asusec_core *ec;
> > +     struct asus_ec_led leds[ASUSEC_LED_MAX];
> > +};
> > +
> > +static const struct asus_ec_led_config asus_ec_leds[] =3D {
> > +     [ASUSEC_LED_AMBER] =3D {
> > +             .name =3D "amber",
> > +             .color =3D LED_COLOR_ID_AMBER,
> > +             .ctrl_bit =3D ASUSEC_CTL_LED_AMBER,
> > +     },
> > +     [ASUSEC_LED_GREEN] =3D {
> > +             .name =3D "green",
> > +             .color =3D LED_COLOR_ID_GREEN,
> > +             .ctrl_bit =3D ASUSEC_CTL_LED_GREEN,
> > +     },
> > +};
> > +
> > +static enum led_brightness asus_ec_led_get_brightness(struct led_class=
dev *cdev)
> > +{
> > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec_led=
, cdev);
> > +     const struct asusec_core *ec =3D led->ddata->ec;
> > +     u64 ctl;
> > +     int ret;
> > +
> > +     ret =3D asus_dockram_access_ctl(ec->dockram, &ctl, 0, 0);
>
> As requested on v6 and v8, why are we still using this bespoke accessor i=
nstead
> of Regmap?
>

https://lore.kernel.org/lkml/CAPVz0n0imF_ESoGMJSrEX7NOnBShFj8wehDtQKXZV_DMc=
Gqq=3DA@mail.gmail.com/

> > +     if (ret)
> > +             return LED_OFF;
> > +
> > +     return ctl & led->ctrl_bit ? LED_ON : LED_OFF;
> > +}
> > +
> > +static int asus_ec_led_set_brightness(struct led_classdev *cdev,
> > +                                   enum led_brightness brightness)
> > +{
> > +     struct asus_ec_led *led =3D container_of(cdev, struct asus_ec_led=
, cdev);
> > +     const struct asusec_core *ec =3D led->ddata->ec;
> > +
> > +     if (brightness)
> > +             return asus_dockram_access_ctl(ec->dockram, NULL,
> > +                                            led->ctrl_bit, led->ctrl_b=
it);
>
> Use 100-chars throughout to prevent early wrapping.
>
> > +     return asus_dockram_access_ctl(ec->dockram, NULL, led->ctrl_bit, =
0);
> > +}
> > +
> > +static int asus_ec_led_probe(struct platform_device *pdev)
> > +{
> > +     const struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.parent=
);
> > +     struct asus_ec_leds_data *ddata;
> > +     struct device *dev =3D &pdev->dev;
> > +     int ret;
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, ddata);
>
> What consumes this?
>

Seems to be an overlook, must have forgotten to remove it during 12
iterations over last 10 month

> > +     ddata->ec =3D ec;
> > +
> > +     for (int i =3D 0; i < ASUSEC_LED_MAX; i++) {
>
> `i` isn't just a random iterator here - maybe call it `led`?
>

This is just a disposable iterator.

> > +             const struct asus_ec_led_config *cfg =3D &asus_ec_leds[i]=
;
> > +             struct asus_ec_led *led =3D &ddata->leds[i];
> > +
> > +             led->cdev.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%s=
",
> > +                                             ddata->ec->name, cfg->nam=
e);
> > +             if (!led->cdev.name)
> > +                     return -ENOMEM;
> > +
> > +             led->cdev.max_brightness =3D 1;
> > +             led->cdev.color =3D cfg->color;
> > +             led->cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RETAIN_A=
T_SHUTDOWN;
> > +             led->cdev.brightness_get =3D asus_ec_led_get_brightness;
> > +             led->cdev.brightness_set_blocking =3D asus_ec_led_set_bri=
ghtness;
> > +
> > +             led->ddata =3D ddata;
> > +             led->ctrl_bit =3D cfg->ctrl_bit;
> > +
> > +             ret =3D devm_led_classdev_register(dev, &led->cdev);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret,
> > +                                          "Failed to register %s LED\n=
",
> > +                                          cfg->name);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver asus_ec_led_driver =3D {
> > +     .driver.name =3D "asus-transformer-ec-led",
>
> Clever!  But, I'd prefer we still to the usual format to be honest.
>
> > +     .probe =3D asus_ec_led_probe,
> > +};
> > +module_platform_driver(asus_ec_led_driver);
> > +
> > +MODULE_ALIAS("platform:asus-transformer-ec-led");
> > +MODULE_AUTHOR("Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>");
> > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > +MODULE_DESCRIPTION("ASUS Transformer's charging LED driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.53.0
> >
>
> --
> Lee Jones

v7 seem fine https://lore.kernel.org/lkml/20260702162425.GD2108533@google.c=
om/
v9 as well https://lore.kernel.org/lkml/20260702162425.GD2108533@google.com=
/

Yet again complains and nits
