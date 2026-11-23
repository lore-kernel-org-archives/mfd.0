Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461883;
	b=mt/3UBN3yRiuAf6Kg6uyAIyuPYeODgZjbpFqBwIUDZyz8hQpG61RdMOwWgpqrkpMksY1
	 n74e6P1CCwNyjcx7cT2a3L/pu3hvIcXpWj0LdoFlHhcc9TMQVG8AZJieftEptkCkfhdMp
	 hfoHnCEFlOnBXFCYc1cxLsESTSohjFJ18J2K8aXuKjhMro4IAW/4vkFDS2YULp8pbMR5e
	 L8ht3a0CZKUEvGRx4kcNs2bHGGewxTC3h2c+YVhBlb7zM0KliyqzuXsbkowOmtJe08Gcq
	 FcAvkfngom039gmWrBGA9jZOP08VBlFAtQUzPhNQUvfPU8ErgILxBDJOTrW9/tj4QzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
	b=D3q9Fo6BF+9sSmRUt2Wv07MFSzrCqd0Uo3vLw0KDvgpKXPxVni/FCxeEG2eedrHxjfYz
	 pN+JWdM8i6gNFs2kPr2VnRbPv7GlAwK3GaouSErsSLFcxUZSzeFdV8w9tI9dY4lKLESPr
	 31E01YabMsoLw1GNuXqjxH3jPyMXzGtVOpEkm3EfRnWE3VAgq0vh5DxnZg7DnI1pdsODs
	 MgW24fJg2+aWo7a//zjFCP5JJXGFdLpbrTybQGIb0JF+t603PVqWiC/imPIvXTw7NQzP3
	 D90SRJxMh+ZyF916Et39sAs1nPN2vzqGqQgzJW1evyuHWZqahP1uuTZJhdTV5N7IpTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULDOeiLB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DCF606A31F
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 19:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DCF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULDOeiLB
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385d8a00598so5126576eec.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461882; cv=none;
        d=google.com; s=arc-20260327;
        b=OVs8qxeN5T0WGu1qkBatF1FRxOnqRf7WZ2jTOHzaMnAahwX8afmmARR8ZLjzgbhOwX
         HqhZPzZyBWtb+fRI4z4muBOY8kj3Dx/ceQQvgmPx0G7zPujao/Jk7efmaHIm6Z2yg4e+
         /PJME/4eY42Ac0udcRpQwK0kWqKrdLvkxt8iSI8B4FIXU33ooxkv5TFP17WIDnFMMMG0
         GVy+PsshPHBDYtdSeddCr3sWSSj1p2Msba6ZMkFg6hQcqZnEGOq6d83c2Py9mrDhGHdI
         2pFFMvLYZhnW+wyf85CHlnkw3MJAYeQIUHfowkdDharqyULK0euaK9LeW38pKe757krx
         gY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
        fh=ZG3u1vktU1BzWlWJWhDON9mOQvHaG+dn68A0MdESpTQ=;
        b=ABXCsCvURPfgn/2BztROFmZcJoPZsDmfmLIDLKqADhFqFTmFY7NcQiEqFfGtBEGOx/
         fCd8+MMqyjKhXdDx+7W3oLmg68BgKGzpcuFr5up0Tf2GMWl+SayJdHI85LVa4lmx0qGo
         taObnsHbdichjLt+58uS+1h1e6yRrdPgqoF7nxVWD5oKStlFv6WxYn7i8XU5v58j/qKo
         D5QZ8wc66E+r6e/85WTET2vDgDMCHEgLEnZPgM79jH71qDl1Lql70WzeaQH5zehWNSVZ
         5CIRqm6NStlla8AU7uJHlNA8CBKpAAHYJSCwPF445Ot4fkn/SwgZAtEjwOtiwe2Lz+Hv
         n5Ug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461882; x=1796066682; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
        b=ULDOeiLBPnN5tsJ/UQ6damAu6GwK9BGmpP8snU8bIDEP1HbZ8IWNnArLnDaNJ/Mf9d
         jmBix18TWifgeLn+JO49EArdtP8mTN8sz5slkCo809qLosjhjWXdgAh7co2qjmhhv12H
         jPJeKfYiFzfRFPTLq9k/EnlTg8KrDYu3yNqMWRfYiufQsjv6Qz+BuHiEqbQyvnAqJUsq
         Ggql5UXCwiy0w0z18VPA1DZZK16NIQ6zrENZgsrTguZzt85AZrIFyf+LxAdbh5naHvk+
         AyPQfhq3+67jpJwGj43+tI/Tt+NAs4Kii8OlscKQkH32l1mOVer10lRZAb0PgZSyMQXn
         c6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461882; x=1796066682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mu3NpxL0VDL/oCB28gOtk5lf+/OEsMsSKxF2nMbAOns=;
        b=lusZ9Suw82TbUyc29nnDhFA+6pPEMayf06JUbh1VmC2vIhL8m9be+JyXMTyrfdlPIH
         HeoCfbVyroU1NhViCddilWpFuIPR/xG/HG//JC+FLsrPgCYcCkKcPd1LCBM/gG+gihNr
         FTebNi11UCW5odOu28D7i9tP04HDh+ATuT4g5SHpW9ICOVKaAs6oKoT7SvH8/Ejb1G2T
         wcLMoKgnP/pnW554lbP25dSXODw3txOAZXpvWhEWl5Q7/7nxbbGO9oXk24s0Y4WHDLqP
         0iKfh3B1C49Sfig7KQvcENF8+xjHX6j9lPDh1zNSq9NN+COAcH+ix4nkwcNgeBCAUDz3
         JV5A==
X-Forwarded-Encrypted: i=1; AL+hErEjAvXNK63Agal/YP3yN1ln9ivf3JEWZ3ol9+9NMf0w5bNjp8SDedfHw4Yds+9H3/U7z+E=@lists.linux.dev
X-Gm-Message-State: APuU4Z9yFS9gcDRoPiE28lCSgTiZ2iA3PlpN4U3k0hbdqp8pzZrvqP7m
	fcFUw32OxnAWxGooGY5NtLUMsUzOybFcSmpMXJf8I7SDRpxaBQantZRxLrb/ORnF+F7/V53xJiV
	HrPTTTtbylm5LrRwHuiUVFqukH1frT60=
X-Gm-Gg: AZFdTZdmVdeNSiP3H0wxZQwp54/2jJTvvbGbTYayeD08GwQzi+eIjUpAAZf+HTRVYOX
	y7TSFKh/2Jj1dgubmeur/VGPk9tAYbQLs6GlZBn+9yjNATupnm0AIMEMgOEvXtL7heWK6zxo+gN
	Km4/PmmWwmHO0rJ843R9XHV6qdOwV7HqfUacs72GwLKoP8HEIOINR2c5nc2ICDoUbSMzc9F/Lb8
	l2/TjMUWJWROHnuqo7ge5YK2bTSiOSoM+ByoOj7XTlafOsvCIkclWNcdQRBrOQLHntmsFwkKTnQ
	r+1CJ5dzASvnbrEqisl6aQ4DnvYP/OnrxnFpGAVagrZla6UBazL+bOJ/4A4D+8NCY2q7a6Adl0N
	6op0fdeo/2yg7Avtr7CawVUh8/x3+lsFLxWIoyxuMa49FJvGiUEIIgmbzflTDHhY0evv2v/Getu
	5xdH638aySnCDnmLEj12PuRZQ7AAjVjQ==
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id
 5a478bee46e88-38571223ee7mr14067601eec.40.1795461881820; Mon, 23 Nov 2026
 11:24:41 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123150725.212836-1-clamor95@gmail.com> <20261123150725.212836-4-clamor95@gmail.com>
 <awSNc2piI26LgyAU@ashevche-desk.local>
In-Reply-To: <awSNc2piI26LgyAU@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 21:24:30 +0200
X-Gm-Features: Aa3M54p9p3fpa_qpWITuz1CQVJO7lvIEsLxGf_QiAXXT24x-6L6prR2LGWA5Z2I
Message-ID: <CAPVz0n2yBtFh-TJ13cH8WXtiyzR3tOrbhACyq8MThi_6+7DOYg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] iio: adc: Add support for MAX8907 ADC cell
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
1 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Nov 23, 2026 at 05:07:24PM +0200, Svyatoslav Ryhel wrote:
> > The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channel=
s
> > with information about different parts of the power system, including t=
he
> > battery, charger/plug, jack and thermal readings.
>
> ...
>
> > +#define MAX8907_CHAN(_type, _idname, _datasheet_name) {              \
> > +     .type =3D (_type),                                        \
> > +     .address =3D MAX8907_REG_##_idname##_MSB |                \
> > +                MAX8907_REG_##_idname##_MEASURE << 8,        \
> > +     .indexed =3D 1,                                           \
> > +     .channel =3D (_idname),                                   \
> > +     .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |          \
> > +                           BIT(IIO_CHAN_INFO_SCALE),         \
> > +     .scan_index =3D (_idname),                                \
>
> Using () means that you expect an expression as a possible input. In such
> a case the macro is buggy as it will evaluate it twice for _idname. The
> simple solution is to drop these parentheses and expect that this macro
> won't ever be used with the expressions in the parameters.
>

You have a point but current state should not cause issues as well.

> > +     .scan_type =3D {                                          \
> > +             .format =3D IIO_SCAN_FORMAT_UNSIGNED_INT,         \
> > +             .realbits =3D 12,                                 \
> > +             .storagebits =3D 16,                              \
> > +             .endianness =3D IIO_CPU,                          \
> > +     },                                                      \
> > +     .datasheet_name =3D (_datasheet_name),                    \
> > +}
>
> ...
>
> > +static int max8907_adc_read(struct iio_dev *indio_dev,
> > +                         struct iio_chan_spec const *chan,
> > +                         int *val, int *val2, long mask)
> > +{
> > +     struct regmap **regmap =3D iio_priv(indio_dev);
>
> Then logically better to go further and have
>
>         struct regmap *map =3D *regmap;
>

This is matter of taste, I was inspired by MAX77541 ADC which uses
exactly this approach.

> > +     __be16 data;
> > +     int ret;
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             ret =3D regmap_write(*regmap, MAX8907_TO_MEASURE(chan->ad=
dress), 0);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D regmap_bulk_read(*regmap, MAX8907_TO_REG(chan->ad=
dress), &data, sizeof(data));
>
> This is a bit too long.
>

101 char, yeah 1 char too long, though maybe it is not wort resending
for a single char too long?

>                 ret =3D regmap_bulk_read(map, MAX8907_TO_REG(chan->addres=
s),
>                                        &data, sizeof(data));
>
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D be16_to_cpu(data) >> 4;
> > +
> > +             return IIO_VAL_INT;
> > +
> > +     case IIO_CHAN_INFO_SCALE:
> > +             *val =3D max8907_default_ref[chan->channel];
> > +             *val2 =3D chan->scan_type.realbits;
> > +
> > +             return IIO_VAL_FRACTIONAL_LOG2;
> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
>
> ...
>
> > +static int max8907_adc_init(struct regmap *regmap)
>
> Why not name it 'map'?
>

Because regmap is more explicit and is used consistently across the driver.

> > +{
> > +     u32 value;
> > +     int ret;
> > +
> > +     /* Enable internal voltage reference. Exact purpose of bits is no=
t known. */
> > +     ret =3D regmap_update_bits(regmap, MAX8907_REG_TSC_CNFG1, GENMASK=
(1, 0), BIT(1));
>
>         ret =3D regmap_update_bits(map, MAX8907_REG_TSC_CNFG1, GENMASK(1,=
 0), BIT(1));
>

which map? bitmap? statemap? or maybe geographical map?

> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Check for internal reference IRQ */
>
> Please, make style of one-line comments consistent ("all or none" are wit=
h or
> without period, same for the first letter =E2=80=94 capital or small).
>

First comment has 2 sentences, that is why it has periods. Second only
one, so it does not need period.  "same for the first letter =E2=80=94 capi=
tal
or small" - have you even checked the patch?


> > +     ret =3D regmap_read_poll_timeout(regmap, MAX8907_REG_TSC_STA_INT,=
 value,
> > +                                    !(value & MAX8907_MASK_NREF_OK), 1=
0, 1000);
>
>         ret =3D regmap_read_poll_timeout(map, MAX8907_REG_TSC_STA_INT, va=
lue,
>                                        !(value & MAX8907_MASK_NREF_OK),
>                                        10, 1 * USEC_PER_MSEC);
>

hmm, replace 1000 (4 chars, pretty readable) with USEC_PER_MSEC (12
chars and twice wrapped line and needs tinkering or looking into
units.h), I don't think so.

> > +     if (ret)
> > +             return ret;
> > +
> > +     return regmap_update_bits(regmap, MAX8907_REG_ADC_SCHED,
> > +                               MAX8907_ADC_SCHED_AUTOSCH_ENABLE |
> > +                               MAX8907_ADC_SCHED_AUTOSCH_TIME,
> > +                               MAX8907_ADC_SCHED_AUTOSCH_ENABLE);
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>

I would like to hear what Jonathan has to say.
