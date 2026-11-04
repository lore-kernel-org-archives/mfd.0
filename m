Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793812303;
	b=Oznz172cU9g+Hx7HdjfF8p6M97qvjWZ2+OPhGBplhev8QmKdVmgo0ekyCSHvsLW9FsXQ
	 DY5sSys4hPIsQKVXi6MGG5h8nGUSGuieVRfClc1s2QmOIgVI/3ByKkWGXJliwLRLwRLdP
	 gVy8KkMNvIJD8MOFscXjO+vyYmnXwI/xionh7q7w8ZEqEPSaZDFepw24e9zPUCW1Yy8iT
	 2Lx6kv+wX2k3holgoltMg7bVAjmpzRV3Elzr166+go7GAI1q8dqs98Gc1GzkzksI5dzq7
	 Z58HgzFH1OF/+mu/EMBfBa4wqOXOV0XQNjMsHGiZNppXw7WVoR0OvCI1YV+gqOBbGbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vLpPSm7/G9CGwwl+f3j0Z0ukU9iAToPS+CRUPv/RJVM=;
	b=gGQ533bbkOd4z68hUxVVuMs/T/vZVN6ekA6AyH/MM1z0u3StBonE3mYYoLCEJA0Vgg8g
	 qEBaEQKuwcLo15haaYtpeb90K/aQpibOzDBAEgtnf7mG0lRZQ2tv3+b/pTZ/Ms12aYBv+
	 usBCxuoLPDDh+WmsQ0cUAooWzPwl0+f58nr6eo5bdYoGfhnk/rMxyDvnYWfd43Img3Afc
	 pJfbDx3Br4gC4ZVqXnUhw/tO8XzZCTh3CK4qMLqgo/qaRmcoSBPBGZEj9Lu+sWuWH39xq
	 eEjwfNIi2+5QAVFQZ94trsDyOAmLQxXvDmq8ZdhPQuk17OiIbWu7/RZKYk8Qn97XouQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LXVQSKEj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADFD606A328
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 17:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADFD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LXVQSKEj
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so1483255c88.0
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 09:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793812301; cv=none;
        d=google.com; s=arc-20260327;
        b=kRJtOPUbZDlHCYlybvbcXDkXSi0jbSgfoo7qwQ+v8kgvZS6SYK9RIAtR9YbvVrSZkr
         DfnZZQAx2RM7cZcRiVXb8KJePwGBmlEYLM5YNeIPOv8dzD73VsWS/2kSogex7ooHEnkn
         ZnPJXcAsP2g9sSTlBtVrj8PTjRCYY1CkvLHo03tjfdN7EyTAiGqxenhR5pvs1WFv/lOe
         LM4Aoojyz7IOFcVQ7O3UIFwl3PRlScurd9lju1bN2HnFGI1yXWoClra4E2F/WNKJsiWq
         vWK79rVZkHps9Pv9r4hCLtzCb06vYvNTgrrxb7/WXRnvT6+h9AYSGff4Zyhg9GNpkpaM
         ae9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLpPSm7/G9CGwwl+f3j0Z0ukU9iAToPS+CRUPv/RJVM=;
        fh=4gNprAlwC6i61TVtVRY21rNynncye2dOO1k6JmgWZpo=;
        b=FowbBM858PUQMEF38mnl2L4dGym0EH8l5xsA1jIKM2GV3uVI1pZOED9LihQrpSmz/P
         4rDgalQJufdNFdIzRBAO+zpBx1nm2dp0leKoP7pWwSi1WTXCPxQKKuLLLaMhFX/gfZGb
         6LTb2a9/zevleYzrOntgi5qLXlS0dZljCApgmVwSYYtpW1idlV8XqsUrI3yYJXUNYBSG
         sbDQBoqDhPjf0xM+6ScPnQA35JctG3VKhT3y2WR78/IAQHEb+CD7YSz0+PdRAvV1tCAP
         19GarYZlN77UDRgn/a/l2jYsWudYS7jlxDxwxK5PPcr60sAVfbfZEz+Hdc23iY9uR7p+
         qWew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793812301; x=1794417101; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLpPSm7/G9CGwwl+f3j0Z0ukU9iAToPS+CRUPv/RJVM=;
        b=LXVQSKEjOruyFrQFHxKiRgb+wz/r6KwRRFQbl7axNnIIIo25m1eCEnNMqxWCVcv7r5
         3nI07GlkSHYg2jSocp6hFbRU5MAj71Yc2eP7fAwFJoB2uehvOtUEz1GyK1bUXn7qOeHb
         aA5sr9gqsC46pmpR8mj6399LN8Hv1lXtUxFE/5bxkpdIehHvLf/Ub1z11JjQRkR29ccP
         FAEhwktcXNblUZrr528sJg+t361vf359vHcmRCwliZaXEUDCqTAsrfsK1hRUCsgbyUeW
         SxkXk0X0xq0VeizEkMrs5OkMuqRSiCP8zGHj/ZRCRVr+IaR2Jd0GKyILRwB4O+lZ/m5Q
         f0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812301; x=1794417101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLpPSm7/G9CGwwl+f3j0Z0ukU9iAToPS+CRUPv/RJVM=;
        b=0u2+IEMl2uo6Y0wzNaV6mxTIcc376KC5Hcj1L9Nv3HsZIJp5qo1dyGwejXhlYk0rxr
         Mj+vVzYgJKy1OdHeXBxoUJRwivwiHSTxO6znwcukByEIe85fZkeFbN7f/PiOP3xnAqJM
         hCkeFHYIx+jWSbd15W5jlNYJWPzRuWTMarZorf4C4kQ2G3+W+cC5EU8ghVMCuZZNjWi0
         pCcaY8UNRe4zNsat0Dw7OtTUXsKX6AKgJmSbmPA/O5GpcmbkE3Jw//Ge9eqqs9TSXl15
         hh9XGtFSImYX4XA0Wu6d4U5scCe72Sl4ShxEGsPI4x+rOoll9/fRCVO/t/HT8sJePZHM
         Ms2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzm5tau36YilITY3G/XK+AfipxbUO33svEZ/yMdQcDe1DfkjzczQk9wJQvMtujQdfpBzk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9PAhOsDftsQJrKUJ+d/klzrHFCwUgwbg6rs7/4jB6F7OLVBOmt
	PW5AGl9acw6NqoFT3eczXpASQtEtr34x017m4RpKjEZZwy7XFXZh4u7rT44lyqzmtHeWUeGqRIh
	utYij2k8ZXKx/20+yJB6XPqCC0GhY1HI=
X-Gm-Gg: AYBFou2cMEwT4BBDk9n8WP78Gtx/xsHW6DQ8k+zmkJJ+TfXQYKJ3bz/uhvvzsasYgjR
	lbunBN024WAllIYcZMQJ2x9G3z1ujb82IKNwWOo81mnfGTNqbhS61wocO8Rvsga5vJ41RiqyGFm
	rkjvktD1yjg/99eiY9D1xfuLsmJ0JvoKsSzpqU9Mvf20It7CCZD53Kt9U9lDmUof/ClzkpJ79ay
	dAQ66P36O/152e2cM5Jf4CwZwhImuYcGD6vwvHhEJfnWKPfu6p7icYh0L2qf7yuTBvMC2moxzN7
	vKq4WwXDYGYsa3EiCFd1Yo3mLMDmbPk90CA2/hipgGnfdlkiwrCi9DTcCGpfvPZPQEVN+0Jna7U
	6M91xHD9eoa96aFPj7ujXfBYWS0SrAXosOG+LmegAabbK+NwSygXlGw6v9GSHr80hOrRIm+c=
X-Received: by 2002:a05:701b:2094:20b0:15e:3a65:5b97 with SMTP id
 a92af1059eb24-1ac5b028805mr25800804c88.16.1793812300785; Wed, 04 Nov 2026
 09:11:40 -0800 (PST)
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
Date: Wed, 4 Nov 2026 19:11:29 +0200
X-Gm-Features: AclHuK-W6Ff7Myct4ijzugesQFIYDn63N4IFMyOx6cneGQ-BUwydTKZuesFNTiI
Message-ID: <CAPVz0n3tR8R5xe_F20kChnHHrWG40o7prwY6kCYXM-UtYPFKLQ@mail.gmail.com>
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

This is required to be able to reference led in the device tree. Since
led node is folded into pmic's node, pmic's node is used to bind led.

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
