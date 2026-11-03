Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706876;
	b=2PKW94/XprTxDwww3EiF1za+8EGfdxJRQ7bX3j9/NR2Hfkut3TNfIxAL1+GFXrAd2Mfh
	 4kcoMCW1q/YSg0cl8WopTlGssco6Q2IlgHuH6YCIZLKDZAkkl8hFdV/IlVPXS79Tg4gVG
	 Kh96ko5szl+EIzbVsxrOU2s6dv4QiPNwAbkDHwDyHZUNfAsQ9CrySCisIOvGbHsoWNjLp
	 qQXaHDbHgj/dVImoWgdzNVbaJ9g0pZ8f5Ahqj0/bPJbbpjvR6ANVVs0z2ijFWrDRC7HiS
	 VcUuqYYLDBlImo5YoOH6HC5hRKJEJyEjlWBAvRU3UEVEMACzjRM1p+bnoVf+NCXPuXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
	b=hMfQCuShILQQnoe3R4WB7XkkOOW79uvztPRL4l542TONe0dgYAXH1Gq9CM8ziiyXIApH
	 JIkwcwVPTH5eT4VSx8xmvMaEgW7+O/4o7c1Ltc/RWr1X7MrTVtEpfKHMvV4RyYEJK8JR6
	 UpvV1jzdG3vJW2xvr5vYTzU8yzEyrTgwmy3cgmbL8q/xm8Jdv4hznz/wk0TjMEC+2cFx1
	 EKuyS6efEEw4VgC4SgqsjUbOhFhAwtdfG4LhcYVSEzuHtR6sTgKZXqKpcxVfhK9MSj/TC
	 V2miSwi6N4MX8amRhJPqt0QHI5knzsQcgwngxiz+6eEJqIcyEfLsakZcXntAS76T8Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0RwBB6Pw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFDB606A324
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 11:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFDB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0RwBB6Pw
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a18fc7a38so7737974eec.1
        for <mfd@lists.linux.dev>; Tue, 03 Nov 2026 03:54:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793706875; cv=none;
        d=google.com; s=arc-20260327;
        b=oNAz/JbeLfMFXfDuLB61YftB/C7LICCw3acMiiB5Y/dXtGLdbDJCxs3najF9ovlAMt
         TUMHrHIbvnEK/uS9H+K0z877ezxTITV4SD2hdowuNCbd4nayXaDsoI9bcrJjicCc8LTr
         /fUPcye2HAEnS6XOuTNog3sohTMR0k8SYCzY0I1ZSZAv+CJb6n5kNvePHw9eaMbJsJ5m
         IvStzuCLMMuvQkuunbpS6SPIrA92ty7M8rdviSQSxtBFXqPA0sssS8ns8C4SIOtSOGFr
         gvc27pZT5JjJNmogrBfcrRppa9OqIYtxw4h5XomNThkSZE8+zqXei/AIA+1zhsXVOzdq
         wjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
        fh=Y1YtVu7irRWg9RzB25QAeOcMFKaE6yaY2lOOBDphnJ8=;
        b=fK21ahV24TUZ+vbgZTgrzHe0ev34uZeq5Dufkm0UYV6ix0q3Ytq+toeBGV9ZWvXdov
         Nzo/hcjux2EV0swcs2Ra0b6BWj7m6CRrRjvDE8bm9buU4vq+NlsjSN9axL7PAo44i0WL
         zK6e+oYZ/IC/+ERkNDH6JXV260mlvzREVFndlSGwhI+ICeH+AIH/9wlLxnwRkT8R4rvh
         J8REvMX1KOmTQb5qvkHFwS2Qr0IDIoeSGMrkcwBBFQzKrm/K9optOKCjOQ9k1Hz0UKDU
         L6XoLkdKuaNGRtwMgAwWefN2m97Q2J8rvbQQJ89UprOlkWdeOCMLgar6QsERqDvB/KkI
         tm1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706875; x=1794311675; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
        b=0RwBB6PwF+/4IaYeLndIZDslzCa/6fLQvQvGSz1JyYUAkpETWVKEgU3gM8giwCAQ6j
         Ds0ceKExotBXO+egc7xFKCWWpU8BpxK47VhOG9vkNS0sZeQlWerZAy4BF85W7qOEZW4D
         YwpuwtqB6ZtWEQYOQxxkMZYNid9JwDHDn+C7KNWRkgs9QzAoZb0EonLUrfxj8R+oOhmX
         MkhypYkQcNbU0U9bbdtqWWCsXQDOhpJBACdtOyVr2F685m4wR3URbUvr9uY14zgau+LD
         uHBqKugSSWas14EhjdPxSOOpNNTQqk3Ttn9ZfFPJksZqh5PPXYzV1A/BxKlLlm09O/Iv
         XPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706875; x=1794311675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PM2HHelgPkDOM09SC4y+B9wXuK/MgDDM2iHXZ32cbZI=;
        b=XW+iUyL3RnBNKo3L9C7Eg5ZmcC5anF4/BK4T5jfjxU/U9xWe9t7hILn/iVAsw3k/jb
         53AZzPvAEp3MrFcqd+rVr1uoHBQ4+A3RvNJJqdrFoA665KwqoNpUR/hdslVtElJVSTru
         FKSK2jrNue/xDDS1foJyA9z76mk5/+8gi6AYgERKfluAhtdReZVFQtOCY/L04DutId+P
         Yqv8A+YxW6bJYpEuUeOKmD2wGbZTSWouN//D6MbYlXxLuPaA//e5jQczcf8e1UbyKGC8
         EkW6RnUoMAIiePscMo2tLKxrVSKPeluQIfrLRUSTSM7ELJ56TJG9SzzuHkYFz9Xk0JoV
         Adaw==
X-Forwarded-Encrypted: i=1; AKwUvByZnnE5+OMM09ewyf26PHNXsPttXc9l25aSG1fbq3TAe3Fh/bAgpecdPcTGJItfYJjbK4g=@lists.linux.dev
X-Gm-Message-State: APuU4Z/F+GwpDKbe7wdJhqMvGxp0xckbekk7tJ33WdGzVJ8SOHQdnsYY
	bIsMxxAN4ZoUD6iaZTVEqG87V9UweH+9WjUYWwBDMh7eR5IzMiJvvYNZJv1dQA5ma1LSaatTd5B
	UeywmiugC/iDnQnvgCs8vIeYtD0cycjY=
X-Gm-Gg: AYBFou02oteKLBPFvyvvQ+45DbyYuRx7eUJXxN1T8VJ2bBW4TJ88Bbv2WYYVMgFS3kG
	hiPHQfHCoyHljboNy3X/MZnnmFkkb55JsfT2FdapXtAYiPbRItQ9u62lszkldfjQQYEwpuRkHtf
	dB6SD8EJwqGjesi0lXZYI68RoQ5+wceb5rmPDOqFOH20as3xTFOUJk1FSCP0bFBPHKNTYRn/hCj
	RflvLNubCAyWTohmtO09FPwgJINLFQxGWaGLGelrRHuQcEJZbjq++m2DmVw3qNapTWEvINtfYwG
	7uWBF1Z/gYI9amFyI7Z5HYDm5+DuIk28eqocOBp70H4rcQHqzplbjCy0bbR2KCvh6/wkQ7Q4S12
	DWRw5G3tHRARp5vp0UYHPVnfWip4CUsA4TWrOR2Nj+v9Zx3HdgrXM8vo7GSwUZvbrMVD2CQ==
X-Received: by 2002:a05:693c:6381:20b0:36a:1d6a:596b with SMTP id
 5a478bee46e88-36a42412f55mr21504309eec.29.1793706874612; Tue, 03 Nov 2026
 03:54:34 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-3-clamor95@gmail.com>
 <179249578293.1833288.15514260998480602004@kernel.org>
In-Reply-To: <179249578293.1833288.15514260998480602004@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Nov 2026 13:54:22 +0200
X-Gm-Features: AclHuK9k-JPaNaa2w2wyQuHafuZvZgRRQXAbt-BGJRbzly4wj0XcizvF3rWabus
Message-ID: <CAPVz0n0kKRpOsUNxvUKiTPSY7bF3h+ruV05B+9jSvs9NOxthkg@mail.gmail.com>
Subject: Re: [PATCH v12 2/7] mfd: Add driver for ASUS Transformer embedded controller
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

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:43=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> --- checkpatch.pl (4 issues) ---
> Line 607: WARNING: DT compatible string "asus,sl101-ec-dock" appears un-d=
ocumented -- check ./Documentation/devicetree/bindings/
> Line 610: WARNING: DT compatible string "asus,tf101-ec-dock" appears un-d=
ocumented -- check ./Documentation/devicetree/bindings/
> Line 613: WARNING: DT compatible string "asus,tf201-ec-pad" appears un-do=
cumented -- check ./Documentation/devicetree/bindings/
> Line 616: WARNING: DT compatible string "asus,tf600t-ec-pad" appears un-d=
ocumented -- check ./Documentation/devicetree/bindings/
> ----------------------------------
>
> On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
> > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > detection and common operations for EC's functions.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/Kconfig                     |  16 +
> >  drivers/mfd/Makefile                    |   1 +
> >  drivers/mfd/asus-transformer-ec.c       | 569 ++++++++++++++++++++++++
> >  include/linux/mfd/asus-transformer-ec.h | 100 +++++
> >  4 files changed, 686 insertions(+)
> >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> >  create mode 100644 include/linux/mfd/asus-transformer-ec.h
>
> [...]
>
> > +static int asus_ec_reset(struct asus_ec_data *ddata)
> > +{
> > +     int retry, ret;
> > +
> > +     guard(mutex)(&ddata->ecreq_lock);
> > +
> > +     for (retry =3D 0; retry < ASUSEC_RETRY_MAX; retry++) {
>
> As mentioned on v8, 'for (int retry =3D 0; ...)' is generally preferred f=
or
> throw-away loop variables.
>

I must have overlooked this, appologies.

> > +             ret =3D i2c_smbus_write_word_data(ddata->client, ASUSEC_W=
RITE_BUF,
> > +                                             ASUSEC_RESET);
> > +             if (!ret)
> > +                     return 0;
> > +
> > +             msleep(ASUSEC_ACCESS_TIMEOUT);
> > +     }
> > +
> > +     return ret;
> > +}
>
> [...]
>
> > +static int asus_ec_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct asus_ec_data *ddata;
> > +     const struct mfd_cell *cells;
> > +     unsigned int num_cells;
> > +     unsigned long irqflags;
> > +     int ret;
> > +
> > +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_I2C_=
BLOCK))
> > +             return dev_err_probe(dev, -ENXIO,
> > +                     "I2C bus is missing required SMBus block mode sup=
port\n");
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     ddata->info =3D device_get_match_data(dev);
> > +     if (!ddata->info)
> > +             return -ENODEV;
> > +
> > +     switch (ddata->info->variant) {
> > +     case ASUSEC_SL101_DOCK:
> > +             cells =3D asus_ec_sl101_dock_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_sl101_dock_mfd_devices);
> > +             break;
> > +     case ASUSEC_TF101_DOCK:
> > +             cells =3D asus_ec_tf101_dock_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_tf101_dock_mfd_devices);
> > +             break;
> > +     case ASUSEC_TF201_PAD:
> > +             cells =3D asus_ec_tf201_pad_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_tf201_pad_mfd_devices);
> > +             break;
> > +     case ASUSEC_TF600T_PAD:
> > +             cells =3D asus_ec_tf600t_pad_mfd_devices;
> > +             num_cells =3D ARRAY_SIZE(asus_ec_tf600t_pad_mfd_devices);
> > +             break;
> > +     default:
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "unknown device variant %d\n",
> > +                                  ddata->info->variant);
> > +     }
> > +
> > +     i2c_set_clientdata(client, ddata);
> > +     ddata->client =3D client;
> > +
> > +     ddata->ec.dockram =3D devm_asus_dockram_get(dev);
> > +     if (IS_ERR(ddata->ec.dockram))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->ec.dockram),
> > +                                  "failed to get dockram\n");
> > +
> > +     ddata->ecreq_gpio =3D devm_gpiod_get(dev, "request", GPIOD_OUT_LO=
W);
> > +     if (IS_ERR(ddata->ecreq_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(ddata->ecreq_gpio),
> > +                                  "failed to get EC request GPIO\n");
> > +
> > +     BLOCKING_INIT_NOTIFIER_HEAD(&ddata->ec.notify_list);
> > +     mutex_init(&ddata->ecreq_lock);
> > +
> > +     asus_ec_signal_request(ddata);
> > +
> > +     ret =3D asus_ec_detect(ddata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to detect EC versi=
on\n");
> > +
> > +     ret =3D asus_ec_init(ddata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to init EC\n");
> > +
> > +     /*
> > +      * Systems using device tree should set up interrupt via DTS,
> > +      * the rest will use the default low interrupt.
> > +      */
> > +     irqflags =3D dev->of_node ? 0 : IRQF_TRIGGER_LOW;
> > +
> > +     ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> > +                                     &asus_ec_interrupt,
> > +                                     IRQF_ONESHOT | irqflags,
> > +                                     client->name, ddata);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to register IRQ\n"=
);
> > +
> > +     /* Parent I2C controller uses DMA, ASUS EC and child devices do n=
ot */
> > +     client->dev.coherent_dma_mask =3D 0;
> > +     client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> > +
> > +     return devm_mfd_add_devices(dev, 0, cells, num_cells, NULL, 0, NU=
LL);
>
> Why not use 'PLATFORM_DEVID_NONE' or 'PLATFORM_DEVID_AUTO' here instead o=
f a raw
> '0' and hard-coded cell IDs in 'asus_ec_tf101_dock_mfd_devices'?
>

There can be more then 1 EC in the tablet. PLATFORM_DEVID_NONE will
not work in this case and PLATFORM_DEVID_AUTO should work, but one of
EC is detachable (dock one) so devices there may need a fixed id. I
can test if PLATFORM_DEVID_AUTO works, but may this be sent as a
followup?

> > +}
>
> --
> Lee Jones
