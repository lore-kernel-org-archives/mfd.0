Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F734C752A
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050900; cv=pass; b=RA8q09n5gnI3pM9aL2BGRdp4wLIhAJekd5pmW1nb0dcJEI8zY8mmcMGYDwOQoq522SbmvTM+W98Sv1MAqZ3Ou0GnFE7OAUjakYvQQ4fW/37OvbtQQVeny5ptnQlWTgIcmfF4wWDRnJ+dXujI3UPFeT/RHNVc+pxqJeZ//rOK3eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050900; c=relaxed/simple;
	bh=QUhjA9hwUmTXGUjT356rZPUadcbJKMeW3gD2q9pu7ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RB/GrXwAyuAczjs/fDbEtGCQ3tDwnMbfuqn4nd95hItvxh9ADZ9G2C8VFcAADFyN4pHAeGawpdfUCFf/JvBDbjtYN+ITDlykBl2WaU0Bp0EScW+d/+WLtuJ0QN6dCRVwcX5FvUOY56yz8IPgFNB90Zvyc6oQVFcnuFjTXdXSavQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqC7yLXb; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqC7yLXb"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso1128852a12.0
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 00:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050895; cv=none;
        d=google.com; s=arc-20260327;
        b=QL/DWufr0U8EgHSOahoZh4BydIk+vQH9BMQgzqUVVVSRuPmEz7OVhZvdV6tFKeSkDR
         oq7xvFNHF2KSNOAE7Xp5qUEzDIlU7s1SQ7A6hXzfjTFR+BMRb/EmGzEt1daZpaxFmpjm
         chCXsyiUvtXtWHFahukTB9BudR8KG+3vpGEfshelRuAs2+Bmd2a+qlTbSbK9DukGE6Ee
         iqb9zuKSmSZx3yJGChqM/bN7Z2dT/kEseOZWAYROR5IYOpbH4j8lQrcmNGlf2Na8NOjm
         35kIW/8Oeh9pmIrczAJjMkQ3ppV46xjapr2FfZ5PpohH54IEf1vEpsXY1r6POM8t0THU
         kwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/sGN7s60I9kDns7tf8RWcyBjmY1L2WRY6Qxl0o1md1A=;
        fh=zrEeVxNxsFqNrvkjzTDGOS7VyQGKu4d1Bg35dHMc6ww=;
        b=fzQen1MO4d4DfTfecXAlJeU5YQFKzMiuLTxzvb4GyKlvTBuH9PaDlpfRppbV19+IYC
         SYXCoFvWTN8pAv9PAqMo7JENBq/FOAvCr/sxIHYJtp63UAXu1fmQIhiAjBgTmuw52np7
         DYuRkXeEzJv7eX/M3RZF5r38CDHhVTlY6sNunPXXC6SoZlOl99n5wgm2ygcXF9b7eM20
         DaIxSp4rrP0d0eq4TgDmt5ZEwv3phEseElGo/dp5//tR54MpSWD84gtKWonZVylr1onN
         aobaO7oML7SVOl3sQNHpC2QQd/dChKsSvlVWPL0VNd2J2IGjLPV1qDkx5OwKAcn+NRvn
         JlYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050895; x=1792655695; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sGN7s60I9kDns7tf8RWcyBjmY1L2WRY6Qxl0o1md1A=;
        b=LqC7yLXbg6e5qiLozmSD+3mN/LxPC+GavKlAN1Ts8ijhQiazI/ztjlF7Nngo2c+AxH
         j3t9GQSnWQCrOs3g3JpPlngJI8r6VCmbDCAnITPW3SkK/i5RQ7u9fm6hxdfrvsvKRDIB
         35ow9A0jVaNALg4Fa+P1Dzc03mZhL1Cma78kXO0IEHuwsVhhQ1D84wCQEvR/gP1qyWX1
         4s91/8kzn8Ga+0jkXh8n+RkyOr1LSfvT5Gtsh000kfTISjS4QoWBc+Y/PXavq59a8bZZ
         FlaJhvgliGskbb1kIUGH1NbbxMoBH6UEqX7aG1CNQTHioMYhNBjXCh2BCp1UJrSAntZ4
         QbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050895; x=1792655695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sGN7s60I9kDns7tf8RWcyBjmY1L2WRY6Qxl0o1md1A=;
        b=KVyeq4wvUSgHF+twocR0bjMrNnQVoM/mXOreQh5j6Yo3uPDn97raZFHoaayozxkhP4
         tTgK/N03B4G9pxOjJZJwFimnvtWw8SoCLJ8ScHTcM75Cr4LoRzG9TrMHpQgby4oGlwoh
         yPV7t3HxA6i1Twwh7zZ/XJVcPoTVT1xjm4FCbEr7LI3aupE82M4IgYB7Bwc5Vg03Wcb8
         ql6GeCRbLJtw9gT8Rc5IXrLZfjWWvC4jVtycAX4v7k9vPEQCPCVZqftAAXvlnVK4g+je
         LMdmzHCWq0UpYkCqYw4IC7moEihRkLxfYgy15o97BOFrLNIT+Ov1JqC/zx0R0wEIJOO1
         ztSA==
X-Forwarded-Encrypted: i=1; AKwUvByAMMEZMDHZ7nJyBbbLMtkafJJy+zxp5g84SJi3OzfZeo9pH1FrhoTVgMx5yEG8YPEGUvU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKeBMqofwX282ngpAwbnHklAsnY/3bjQiaogoXI0GPLvjzSuRZK
	3n7X3yzlVeLJUCGFUfd0pBdoDgjiy43cPAx+5hDmbyJOAsa+Vokh3G3Bp6OYnJs1bPB0BHQAhqk
	h3ZH6AiEB1S3O89Wa3Rv0oIJJzFOUsd8=
X-Gm-Gg: AYBFou0j1AixEWmfUAKAvC1qcsjuZ+Y0Ain8FJA/hh9a6W/MG0Lj4AsnbkZdfPH3iW9
	qpMqKPcmGT8i2lsb3UKXc3e0g/6k4SPyNhHwBcy2YOThHNoa1srPXB6K7Gco+RMeW6/egbnOXdx
	2v3iYvhetGj0avhpXRHskGIUNcHeN5dR+kWABEdo4duaw8tSW/4vJpOwVYBXNVflJc3uGXb3Xak
	n1eJUwN6CThsoHnxMMqZqPUzcUbyss4EmHzxkSiynMCgnddI/0IfTk4cTuDowPHv8c4KXApO/Ss
	WnQmGeu8X0lpVFtNL/DpUQ7VSJf2MfnkW9/R00Tvs/5l4TK1WWssk+Pg5PgAC698ueuQ6jE6nei
	zWFNNodzlOyV2aE4jI0cjcqo=
X-Received: by 2002:a17:907:c60e:10b0:c32:110d:682f with SMTP id
 a640c23a62f3a-c32110d6952mr1085661366b.18.1792050895249; Thu, 15 Oct 2026
 00:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-3-clamor95@gmail.com>
 <d5f54636c25e0e60731adc200a63ceb5@gmail.com>
In-Reply-To: <d5f54636c25e0e60731adc200a63ceb5@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:54:40 +0300
X-Gm-Features: AclHuK8G-cs7nBf_jb7Nz-sYHdY2hV4DGcnygUqGWeotEdcljE4mZaNjbadyaBQ
Message-ID: <CAPVz0n2yR9C4Jan9=0=ck-RyKk1m19s3q4wfLCz9Bvw1TYNS0A@mail.gmail.com>
Subject: Re: [PATCH v11 2/7] mfd: Add driver for ASUS Transformer embedded controller
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 04:3=
6 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Oct 13, 2026 at 08:34:58PM +0300, Svyatoslav Ryhel wrote:
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/debugfs.h>
>
> Unused include (left over after debugfs support was dropped).
>

Noted

> > +/**
> > + * struct asus_ec_chip_info
> > + *
> > + * @name: prefix associated with the EC
> > + * @variant: id of programming model of EC
> > + * @mode: state of Factory Mode bit in EC control register
> > + * @read_size: size of block to read
> > + * @keyboard_mask: mask of keyboard packets
> > + */
> > +struct asus_ec_chip_info {
> > +     const char *name;
> > +     enum asusec_variant variant;
> > +     enum asusec_mode fmode;
> > +     u8 read_size;
> > +     u8 keyboard_mask;
> > +};
> > +
> > +/**
> > + * struct asus_ec_data
> > + *
> > + * @ec: public part shared with all cells (must be first)
> > + * @ecreq_lock: prevents simultaneous access to EC
> > + * @ecreq_gpio: EC request GPIO
> > + * @client: pointer to EC's i2c_client
> > + * @info: pointer to EC's version description
> > + * @ec_buf: buffer for EC read
> > + * @logging_disabled: flag disabling logging on reset events
> > + */
> > +struct asus_ec_data {
> > +     struct asusec_core ec;
> > +     struct mutex ecreq_lock;
> > +     struct gpio_desc *ecreq_gpio;
> > +     struct i2c_client *client;
> > +     const struct asus_ec_chip_info *info;
> > +     u8 ec_buf[ASUSEC_ENTRY_BUFSIZE];
> > +};
>
> scripts/kernel-doc warns on these two structs:
> - In struct asus_ec_chip_info, the kerneldoc says @mode while the field i=
s
>   named fmode.
> - In struct asus_ec_data, @logging_disabled no longer exists.
>

Noted

> > +int asus_dockram_access_ctl(struct i2c_client *client, u64 *out, u64 m=
ask,
> > +                         u64 xor)
> > +{
> > +     struct dockram_ec_data *ddata =3D i2c_get_clientdata(client);
> > +     u8 *buf =3D ddata->ctl_buf;
> ...
> > +static struct i2c_client *devm_asus_dockram_get(struct device *dev)
> > +{
> > +     struct i2c_client *parent =3D to_i2c_client(dev);
> > +     struct i2c_client *dockram;
> > +     struct dockram_ec_data *ddata;
> > +     int ret;
> > +
> > +     dockram =3D i2c_new_ancillary_device(parent, "dockram",
> > +                                        parent->addr + ASUSEC_DOCKRAM_=
OFFSET);
> > +     if (IS_ERR(dockram))
> > +             return dockram;
> > +
> > +     ret =3D devm_add_action_or_reset(dev, asus_ec_release_dockram_dev=
,
> > +                                    dockram);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     ddata =3D devm_kzalloc(&dockram->dev, sizeof(*ddata), GFP_KERNEL)=
;
> > +     if (!ddata)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     i2c_set_clientdata(dockram, ddata);
> > +     mutex_init(&ddata->ctl_lock);
> > +
> > +     return dockram;
> > +}
>
> Attaching ddata to &dockram->dev via devm_kzalloc() and
> i2c_set_clientdata() is fragile because dockram is bound to the I2C dummy
> driver. If the dummy driver is unbound from dockram via sysfs, the driver
> core frees &dockram->dev devres allocations and clears dockram's
> driver_data to NULL, so the next call to asus_dockram_access_ctl() will
> dereference NULL.
>
> Instead of allocating a separate struct dockram_ec_data on the ancillary
> i2c_client, could ctl_lock and ctl_buf live in struct asus_ec_data (or
> struct asusec_core) and have asus_dockram_access_ctl() take struct
> asusec_core *ec?
>
> Thanks.
>

I did this since dockram and ec can be accessed and work
independently, hence separate locks and buffers. I would like this to
remain as it is, but you have a point here. Adding check if dockram
client is not NULL should resolve possible issues with
asus_dockram_access_ctl calls.

> --
> Dmitry
